/*4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/

with cte_1 as(
SELECT p.segment, count(distinct p.product_code) as product_count_2020 FROM dim_product p
join fact_sales_monthly s
using(product_code)
where fiscal_year=2020
group by segment
),
cte_2 as
(SELECT p.segment, count(distinct p.product_code) as product_count_2021 FROM dim_product p
join fact_sales_monthly s
using(product_code)
where fiscal_year=2021
group by segment
)

select segment, product_count_2020, product_count_2021, (product_count_2021 - product_count_2020) as difference from cte_1 
join cte_2
using(segment)
order by difference desc
