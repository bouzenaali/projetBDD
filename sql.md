 # SQL Queries of our project
 ## Items
- get all categories
```sql
    SELECT *
    FROM item_category;
```

- create view that reference all items
```sql
    CREATE OR REPLACE VIEW all_items AS
    SELECT *
    FROM item_item;
```

- create view that reference to items filtered by category
```sql
   CREATE OR REPLACE VIEW filtered_by_category AS 
   SELECT *
   FROM all_items
   WHERE category_id = %s;
```

- get all items that match the search query
```sql
   SELECT *
   FROM filtered_by_category
   WHERE name LIKE '%s' OR description LIKE '%s';
```

- get all items from 'filtered_by_category' view
```sql
   SELECT *
   FROM filtered_by_category;
```

- get all items that match the search query
```sql
   SELECT *
   FROM all_items
   WHERE name LIKE %s OR description LIKE %s;
```

## detail

- get the item
```sql
    SELECT *
    FROM item_item
    WHERE id = %s
```

- get the user who created the item (the seller)
```sql
    SELECT users.username
    FROM auth_user AS users, item_item AS items
    WHERE items.id = %s AND items.created_by_id = users.id
```

- get all non sold items that are in the same category with the item
```sql
    SELECT *
    FROM item_item
    WHERE category_id = %s AND is_sold = False AND id != %s
```

## new

- insert new item
```sql
 INSERT INTO item_item (category_id, name, description, price, image, created_by_id, is_sold, created_at)
 VALUES (%s, %s, %s, %s, %s, %s, False, CURRENT_TIMESTAMP)
```

## Update
- update the item with new information
```sql
   UPDATE item_item
   SET name = %s,
         description = %s,
         price = %s,
         image = %s,
         is_sold = %s
   WHERE id = %s;
```

## Delete

- delete the item
```sql
   DELETE FROM item_item
   WHERE id = %s
```