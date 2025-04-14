/*7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount*/

SELECT monthname(date) as month,year(date) as year,concat((round((sum(sold_quantity*gross_price)/1000000),2)),"M")as Gross_sales_Amount_mln
FROM fact_sales_monthly s
JOIN fact_gross_price g
using(product_code)
join dim_customer c
using(customer_code)
where customer = "Atliq Exclusive"
group by date
order by date
