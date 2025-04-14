/*1. Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region.*/

SELECT distinct market FROM dim_customer 
 where customer like '%Atliq Exclusive%' and region='APAC'
