/*3. Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains
2 fields,
segment
product_count*/

SELECT segment, count(distinct product_code) as product_count FROM dim_product
group by segment
order by product_count desc;

