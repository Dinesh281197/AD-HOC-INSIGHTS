
SELECT product,product_code, manufacturing_cost fROM fact_manufacturing_cost
join dim_product
using(product_code)
where manufacturing_cost in((SELECT max(manufacturing_cost)  fROM fact_manufacturing_cost) ,
(SELECT min(manufacturing_cost) fROM fact_manufacturing_cost))
order by manufacturing_cost desc






