/*8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity*/

select
(case
when  month(date) in(9,10,11) then  "Q1"
when month(date) in(12,1,2) then  "Q2"
when month(date) in(3,4,5) then  "Q3"
when month(date) in(6,7,8) then   "Q4" 
end )as Quarter,sum(sold_quantity) as total_sold_quantity from fact_sales_monthly 
where fiscal_year=2020
group by Quarter

