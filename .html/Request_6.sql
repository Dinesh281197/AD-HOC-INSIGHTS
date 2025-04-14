SELECT customer_code, customer, round((avg(pre_invoice_discount_pct)*100),2) as avg_discount_pct FROM fact_pre_invoice_deductions
join dim_customer
using(customer_code)
where fiscal_year=2021 and market like "%india%"
group by customer_code,customer
order by avg_discount_pct desc
limit 5;