### SQL Product Query - Low Fat and Recyclable Products

This project contains an SQL query to filter products that are both low fat and recyclable from a given `Products` table. The purpose of this query is to extract product IDs that meet specific conditions based on the attributes of the product.

### Description

This repository demonstrates how to query a product database for products that are both low fat and recyclable. It uses basic SQL filtering techniques with `WHERE` clauses to return the required results based on product attributes.

### Database Schema

The `Products` table has the following schema:

| Column Name  | Type   |
|--------------|--------|
| product_id   | int    |
| low_fats     | enum   |
| recyclable   | enum   |

### Column Details:
- `product_id` is the primary key.
- `low_fats` can have values `'Y'` (low fat) or `'N'` (not low fat).
- `recyclable` can have values `'Y'` (recyclable) or `'N'` (not recyclable).

### Code 

SELECT product_id FROM Products WHERE low_fats = 'Y' AND recyclable = 'Y';

### Output

![image](https://github.com/user-attachments/assets/ea86b353-826d-4e4a-a44b-5e43e4e38788)
