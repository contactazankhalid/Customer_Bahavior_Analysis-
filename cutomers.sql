
                     -- solve the sql queries to grow business

--1 gender wise total_sale and orders
SELECT gender,
count(*) as total_orders,
SUM("purchase amount (usd)") AS total_purchase,
round((count(*)::decimal)/(select count(*) from customers)*100::numeric,2) as order_percentage 
FROM customers
GROUP BY gender
ORDER BY total_purchase DESC;

--2 top 3 order wise items in each category 
with ranked_category as (
select category,"item purchased",count(*) as total_orders,
dense_rank() over(partition by category order by count(*) desc) as rank
from customers
group by category,"item purchased"
)
select *
from ranked_category 
where rank<=3
order by category,rank

--3 top 3 loctaion order wisex
select location,
count(*) as total_orders from customers
group by 1 
order by 2 desc
limit 3

--4 avg purchase,tota_orders,total_price amount on subscription status
select
"subscription status",
count(*) as total_orders,
sum("purchase amount (usd)") as total_amount,
round(avg("purchase amount (usd)")::numeric,2)  as avg_purchase_amount
from customers
group by 1

--5 top 3 revenue_based items in each category 
with ranked_category as (
select category,"item purchased",sum("purchase amount (usd)") as total_orders,
dense_rank() over(partition by category order by sum("purchase amount (usd)") desc) as rank
from customers
group by category,"item purchased"
)
select *
from ranked_category 
where rank<=3
order by category,rank

--6Which items sell the most depending on the season? 
with ranked_item as (
select season,
"item purchased",
count(*) as total_orders,
dense_rank() over(partition by season order by count(*) desc) as rank
from customers
group by 1,2
)
select *
from ranked_item
where rank<=3
order by season 

--7Group and analyze customers based on their purchase frequency weekly, monthly, annually, etc
  select "frequency of purchases" AS purchase_frequency,
    COUNT(*) AS total_customers,
    ROUND(AVG("previous purchases"), 2) AS avg_previous_purchases,
    ROUND(AVG("purchase amount (usd)"), 2) AS avg_purchase_amount,
    ROUND(SUM("purchase amount (usd)"), 2) AS total_revenue
FROM customers
GROUP BY "frequency of purchases"
ORDER BY avg_previous_purchases DESC;

--8Regarding the discount applied/promo code: Is the average order value for those using the
--code lower or higher than for those not using a discount?
select "discount applied",
"promo code used",
count(*) as total_customers,
round(avg("purchase amount (usd)")::numeric,2) as avg_purchase_amount,
sum("purchase amount (usd)") as total_revenue
from customers
group by 1,2 
order by 2 desc

--9 age wisw orde count
select 
case when age between 18 and 25 then '18-25'
 when age between 18 and 25 then '18-25'
 when age between 26 and 35 then '26-35'
 when age between 36 and 45 then '36-45'
 when age between 46 and 55 then '46-55'
 when age between 56 and 65 then '56-65'
when age between 66 and 75 then '66-75'
else '75+' end as age_group,
count(*) as total_customers,
round(avg("purchase amount (usd)")::numeric,2) as avg_purchase_amount,
sum("purchase amount (usd)") as total_revenue
from customers
group by 1
order by age_group

--10Which payment method (credit card, PayPal, Venmo, etc.) is used the most, 
--and does it differ based on the purchase amount?
select "payment method",
count(*) as total_customers,
sum("purchase amount (usd)") 
from customers
group by 1 
order by 2 desc

--11Do shipping rates (Express, Free Shipping, Store Pickup) 
--change based on the purchase amount or order total?
SELECT 
    "shipping type",
    COUNT(*) AS total_customers,
    ROUND(AVG("purchase amount (usd)")::numeric, 2) AS avg_purchase_amount,
    ROUND(SUM("purchase amount (usd)")::numeric, 2) AS total_revenue
FROM customers
GROUP BY "shipping type"
ORDER BY avg_purchase_amount DESC;

--12. Which customers used a discount but still spent more than the average purchase amount? 
select "customer id",
"purchase amount (usd)" 
from customers
where "discount applied"='Yes'
and "purchase amount (usd)">
(select avg("purchase amount (usd)") from customers)

--13. Segment customers into New, Returning, and Loyal based on their total 
-- number of previous purchases, and show the count of each segment. 
with customer_segment as (
select
"customer id",
"previous purchases",
case
when "previous purchases"=1 then 'New'
when "previous purchases" between 2 and 10 then 'Returning'
else 'Loyal' end as customer_segment
from customers
)
select customer_segment,count(*) as total_customer from customer_segment
group by customer_segment

--14 Are customers who are repeat buyers (more than 5 previous purchases) also likely to subscribe?
select "subscription status",count(*) as repeat_buyers from customers
where "previous purchases">5 
group by 1

--15. What is the revenue contribution of each age group? 
select 
case when age between 18 and 25 then '18-25'
 when age between 18 and 25 then '18-25'
 when age between 26 and 35 then '26-35'
 when age between 36 and 45 then '36-45'
 when age between 46 and 55 then '46-55'
 when age between 56 and 65 then '56-65'
when age between 66 and 75 then '66-75'
else '75+' end as age_group,
sum("purchase amount (usd)") as total_contribution
from customers
group by age_group













