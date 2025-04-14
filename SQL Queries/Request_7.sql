SELECT monthname(date) as month,year(date) as year,concat((round((sum(sold_quantity*gross_price)/1000000),2)),"M")as Gross_sales_Amount_mln
FROM fact_sales_monthly s
JOIN fact_gross_price g
using(product_code)
join dim_customer c
using(customer_code)
where customer = "Atliq Exclusive"
group by date
order by date