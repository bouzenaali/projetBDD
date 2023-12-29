from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from item.models import Item
from django.db import connection


@login_required
def index(request):
    cursor = connection.cursor()
    table_name = Item._meta.db_table
    cursor.execute(f"SELECT * FROM {table_name} WHERE created_by_id = %s",[request.user.id])
    cursor.fetchall()
    items = Item.objects.filter(created_by=request.user)

    return render(request, 'dashboard/index.html', {
        'items': items,
    })
