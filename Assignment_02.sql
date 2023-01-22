-- SQL, ASSIGNMENT-02


----------Questions---------

-- 1. Product Sales

-- You need to create a report on whether customers who purchased the product named '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD' buy the product below or not.
-- 'Polk Audio - 50 W Woofer - Black' -- (other_product)   


SELECT *
FROM sale.customer C
INNER JOIN sale.orders O ON C.customer_id=O.customer_id
INNER JOIN sale.order_item OI ON O.order_id=OI.order_id
INNER JOIN product.product P ON OI.product_id=P.product_id
WHERE product_name IN('Polk Audio - 50 W Woofer - Black', '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD')


-- 2. Conversion Rate


CREATE TABLE ECommerce (Visitor_ID INT IDENTITY (1, 1) PRIMARY KEY,	
    Adv_Type VARCHAR (255) NOT NULL,	
    Action1 VARCHAR (255) NOT NULL);
INSERT INTO ECommerce(Adv_Type, Action1)VALUES ('A', 'Left'),('A', 'Order'),
    ('B', 'Left'),('A', 'Order'),
    ('A', 'Review'),('A', 'Left'),
    ('B', 'Left'),('B', 'Order'),
    ('B', 'Review'),('A', 'Review');                                                   --query calismadi




-- Write a query to return the conversion rate for each Advertisement type.


-- a. Create above table (Actions) and insert values,
-- b. Retrieve count of total Actions and Orders for each Advertisement Type,
-- c. Calculate Orders (Conversion) rates for each Advertisement Type by dividing by total count of actions casting as float by multiplying by 1.0.