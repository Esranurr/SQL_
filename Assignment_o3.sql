-- SQL, ASSIGNMENT-03

----------Questions---------

-- Discount Effects

-- Generate a report including product IDs and discount effects on whether the increase in the discount rate positively impacts the number of orders for the products.


SELECT DISTINCT product_id, discount, SUM(quantity) OVER(PARTITION BY product_id, discount) pro_dis_sale  
FROM sale.order_item
ORDER BY product_id, discount


