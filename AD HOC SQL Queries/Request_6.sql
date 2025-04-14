/*6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage*/


SELECT customer_code, customer, round((avg(pre_invoice_discount_pct)*100),2) as avg_discount_pct FROM fact_pre_invoice_deductions
join dim_customer
using(customer_code)
where fiscal_year=2021 and market like "%india%"
group by customer_code,customer
order by avg_discount_pct desc
limit 5;
