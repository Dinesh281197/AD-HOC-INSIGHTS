/*9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage*/

with cte_1 as(
SELECT channel,
concat((round((sum(sold_quantity*gross_price)/1000000),2)),"M")as Gross_sales_Amount_mln
FROM fact_sales_monthly s
JOIN fact_gross_price g
using(product_code,fiscal_year)
join dim_customer c
using(customer_code)
where fiscal_year=2021
group by channel)
select *, 
concat(round(Gross_sales_Amount_mln/sum(Gross_sales_Amount_mln) over()*100),"%") as contribution_percentage 
from cte_1
order by contribution_percentage desc


