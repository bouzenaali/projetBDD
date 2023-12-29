from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.shortcuts import render, get_object_or_404, redirect

from .forms import NewItemForm, EditItemForm
from .models import Category, Item
from django.db import connection


def items(request):
    cursor = connection.cursor()
    query = request.GET.get('query', '')
    category_id = request.GET.get('category', 0)
    cursor.execute("SELECT * FROM item_item WHERE is_sold = False")
    categories = Category.objects.all()
    cursor.execute("SELECT * FROM item_category")
    items = Item.objects.filter(is_sold=False)

    if category_id:
        cursor.execute("SELECT * FROM item_item WHERE (name LIKE %s OR description LIKE %s)", ('%'+query+'%', '%'+query+'%'))
        items = items.filter(category_id=category_id)

    if query:
        cursor.execute("SELECT * FROM item_item WHERE category_id = %s", (category_id,))
        items = items.filter(Q(name__icontains=query) | Q(description__icontains=query))

    return render(request, 'item/items.html', {
        'items': items,
        'query': query,
        'categories': categories,
        'category_id': int(category_id)
    })

def detail(request, pk):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM item_item WHERE id = %s", (pk,))
    item = get_object_or_404(Item, pk=pk)
    cursor.execute("SELECT * FROM item_item WHERE category_id = %s AND is_sold = False AND id != %s", (item.category_id, pk))
    related_items = Item.objects.filter(category=item.category, is_sold=False).exclude(pk=pk)[0:3]

    return render(request, 'item/detail.html', {
        'item': item,
        'related_items': related_items
    })

@login_required
def new(request):
    if request.method == 'POST':
        form = NewItemForm(request.POST, request.FILES)

        if form.is_valid():
            item = form.save(commit=False)
            item.created_by = request.user
            item.save()

            return redirect('item:detail', pk=item.id)
    else:
        form = NewItemForm()

    return render(request, 'item/form.html', {
        'form': form,
        'title': 'New item',
    })

@login_required
def edit(request, pk):
    item = get_object_or_404(Item, pk=pk, created_by=request.user)

    if request.method == 'POST':
        form = EditItemForm(request.POST, request.FILES, instance=item)

        if form.is_valid():
            form.save()

            return redirect('item:detail', pk=item.id)
    else:
        form = EditItemForm(instance=item)

    return render(request, 'item/form.html', {
        'form': form,
        'title': 'Edit item',
    })

@login_required
def delete(request, pk):
    item = get_object_or_404(Item, pk=pk, created_by=request.user)
    item.delete()

    return redirect('dashboard:index')