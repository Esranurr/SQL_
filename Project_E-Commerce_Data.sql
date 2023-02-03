-- E-Commerce Data and Customer Retention Analysis with SQL

-- Dataset

SELECT * 
FROM e_commerce_data

-- Analyze the data by finding the answers to the questions below:
-- 1. Find the top 3 customers who have the maximum count of orders.


SELECT TOP 1 Cust_ID, COUNT(Cust_ID) max_order
FROM e_commerce_data
GROUP BY Cust_ID
ORDER BY max_order desc


-- 2. Find the customer whose order took the maximum time to get shipping.


SELECT top 1 *
FROM e_commerce_data
ORDER BY DaysTakenForShipping DESC


-- 3. Count the total number of unique customers in January and how many of them came back every month over the entire year in 2011


SELECT Cust_ID , COUNT(DISTINCT Cust_ID) AS january_visits
FROM e_commerce_data
WHERE Month(Order_Date)=01
GROUP BY Cust_ID


-- 4. Write a query to return for each user the time elapsed between the first purchasing and the third purchasing, in ascending order by Customer ID.


SELECT distinct Cust_ID, MIN(order_date) first_order_date
FROM e_commerce_data
GROUP BY Cust_ID


-- 5. Write a query that returns customers who purchased both product 11 and product 14, as well as the ratio of these products to the total number of products purchased by the customer.


SELECT DISTINCT Cust_ID, COUNT(Prod_ID) OVER(PARTITION BY Cust_ID) num_of_products
FROM (
    SELECT * 
FROM e_commerce_data
WHERE Cust_ID IN (
    SELECT Cust_ID
    FROM
    (
        SELECT Cust_ID,
            SUM(CASE WHEN Prod_ID='Prod_11' THEN 1 ELSE 0 END) as Prod_11,
            SUM(CASE WHEN Prod_ID='Prod_14' THEN 1 ELSE 0 END) as Prod_14
        FROM e_commerce_data
        GROUP BY Cust_ID
    ) T1
    WHERE Prod_11 > 0 AND Prod_14 > 0
)
)T2


-- Customer Segmentation
-- Categorize customers based on their frequency of visits. The following steps will guide you. If you want, you can track your own way.
-- 1. Create a “view” that keeps visit logs of customers on a monthly basis. (For each log, three field is kept: Cust_id, Year, Month)


SELECT                                                              
    Cust_ID, 
    Year(Order_Date) AS Year, 
    Month(Order_Date) AS Month,
    COUNT(DISTINCT Order_Date) AS Visits
FROM e_commerce_data
GROUP BY Cust_ID, Year(Order_Date), Month(Order_Date)


-- 2. Create a “view” that keeps the number of monthly visits by users. (Show separately all months from the beginning business)
-- 3. For each visit of customers, create the next month of the visit as a separate column.
-- 4. Calculate the monthly time gap between two consecutive visits by each customer.
-- 5. Categorise customers using average time gaps. Choose the most fitted labeling model for you.


-- Month-Wise Retention Rate
-- Find month-by-month customer retention ratei since the start of the business.
-- There are many different variations in the calculation of Retention Rate. But we will try to calculate the month-wise retention rate in this project.
-- So, we will be interested in how many of the customers in the previous month could be retained in the next month.
-- Proceed step by step by creating “views”. You can use the view you got at the end of the Customer Segmentation section as a source.
-- (Month-Wise Retention Rate = 1.0 * Number of Customers Retained in The Current Month / Total Number of Customers in the Current Month)


-- 1. Find the number of customers retained month-wise. (You can use time gaps) 
-- 2. Calculatethemonth-wiseretentionrate.
























