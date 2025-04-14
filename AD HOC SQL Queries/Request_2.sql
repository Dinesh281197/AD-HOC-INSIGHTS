/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg*/

with  cte_1 as(
SELECT count(distinct product_code) as unique_products_2020 FROM dim_product
join
fact_sales_monthly
using(product_code) where fiscal_year=2020
),
cte_2 as(
SELECT count(distinct product_code) as unique_products_2021 FROM dim_product
join
fact_sales_monthly
using(product_code) where fiscal_year=2021)

select unique_products_2020,unique_products_2021, round((((unique_products_2021-unique_products_2020)/unique_products_2020)*100),2) as percentage_chg from cte_1
join cte_2   
