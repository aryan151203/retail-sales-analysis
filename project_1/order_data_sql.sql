SELECT * FROM df_orders;

--- Find top 10 highest revenue generating product

SELECT product_id,SUM(sale_price * quantity) AS revenue
FROM df_orders
GROUP BY product_id
ORDER BY revenue DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

--- Find top  5 highest selling product in each region

WITH hsr AS 
(SELECT region,product_id,SUM(sale_price) AS total_sales
FROM df_orders
GROUP BY region,product_id)
SELECT * FROM( 
    SELECT * ,
   ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_sales DESC) AS sales_rnk
   FROM hsr)rownumber
   WHERE sales_rnk<=5;

   ---Find month over month growth comparision for 2022 and 2023 sales eg: jan 2022 vs jan 2023

  WITH CTE AS
        ( SELECT year(order_date) AS order_year,month(order_date) AS order_month,
		SUM(sale_price) AS sale
   FROM df_orders
   GROUP BY year(order_date),month(order_date)
   )
   SELECT order_month,
   SUM(CASE WHEN order_year = 2022 THEN sale else 0 end) AS sales_2022,
   SUM(CASE WHEN order_year = 2023 THEN sale else 0 end) AS sales_2023
   FROM CTE
   GROUP BY order_month
   ORDER BY order_month;

   --- For each category which month had highest sales

   WITH CTE AS (SELECT category,FORMAT(order_date,'yyyyMM') AS order_year_month,SUM(sale_price) AS sales
   FROM df_orders
   GROUP BY category,FORMAT(order_date,'yyyyMM')
   )
  SELECT * FROM 
  ( SELECT *,
   ROW_NUMBER() OVER(PARTITION BY category ORDER BY sales DESC) AS rn
   FROM CTE
   )highest_sales
  WHERE rn = 1 

  --- Which sub_category had highest growth by profit in 2023 compare to 2022 

   WITH CTE AS
   ( SELECT sub_category,year(order_date) AS order_year
   ,SUM(sale_price) AS sales
   FROM df_orders
   GROUP BY sub_category,year(order_date)
   ) ,CTE2 AS (
   SELECT sub_category,
   SUM(CASE WHEN order_year = 2022 THEN sales else 0 end) AS sales_2022,
   SUM(CASE WHEN order_year = 2023 THEN sales else 0 end) AS sales_2023
   FROM CTE
   GROUP BY sub_category
   )
   SELECT top 1 *,
    (sales_2023 -sales_2022)*100/sales_2022 AS Growth_percentage
   FROM CTE2
   ORDER BY (sales_2023 -sales_2022)*100/sales_2022 DESC
