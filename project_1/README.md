# 🛍️ Order Data Analysis Project

This project is designed to analyze e-commerce order data using SQL and Python (pandas). It covers insights such as top products by revenue and sales, month-over-month growth, and performance by category and sub-category.

## 📁 Project Structure

 - `orders_data_analyse.ipynb`: Jupyter Notebook for EDA and data visualization in Python.
 - `order_data_sql.sql`: SQL queries for advanced analytical questions on the order dataset.
 - `orders.csv.zip` : zip files 
 - `orders.csv`: csv files
 - `requirements.txt`: Lists all Python dependencies.

## 🔍 Key SQL Insights

- Top 10 highest revenue-generating products.
- Top 5 highest-selling products in each region.
- Month-over-month sales comparison for 2022 vs 2023.
- Month with highest sales for each category.
- Sub-category with the highest YoY growth in profit (2023 vs 2022).

## 📊 Key Insights Extracted from the Dataset

1. 🔝 **Top Revenue Products**:  
   The 10 products that generated the highest total revenue (calculated by multiplying sale price and quantity) are identified and ranked using SQL aggregation and sorting logic.

2. 🌍 **Top-Selling Products by Region**:  
   For each geographic region, the top 5 highest-selling products (based on total sale price) are extracted using SQL window functions (`ROW_NUMBER()` with partitioning).

3. 📈 **Month-over-Month Sales Comparison (2022 vs 2023)**:  
   Sales trends are compared month-by-month between 2022 and 2023, enabling clear visualization of growth or decline across the same months in two different years.

4. 🗓️ **Best-Selling Month by Category**:  
   For each product category, the specific month with the highest total sales is determined using a combination of aggregation and ranking functions.

5. 🚀 **Fastest-Growing Sub-Category by Sales (YoY)**:  
   Among all sub-categories, the one with the highest percentage increase in total sales from 2022 to 2023 is identified and reported. Growth is calculated using the percentage change formula.



## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/order-data-analysis.git
cd order-data-analysis
pip install -r requirements.txt
jupyter notebook orders_data_analyse.ipynb
