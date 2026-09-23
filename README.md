##Customer Behavior Analysis

This project analyzes the shopping behavior of 3,900 customers using SQL. The goal is to understand who the customers are, what they buy, and how they shop, so the business can make better decisions.

#Dataset
3,900 customer purchase records
Columns include: gender, age, category, item purchased, purchase amount, season, subscription status, discount applied, promo code used, previous purchases, frequency of purchases, payment method, shipping type and customer segment
Tools Used
PostgreSQL (SQL)
pgAdmin / DBeaver
What I Did

#I wrote SQL queries to answer the following questions:

How do orders and revenue differ between male and female customers?
Which age groups bring the most revenue?
How many customers are New, Returning and Loyal?
Do subscribed customers spend more or buy more often than non-subscribed customers?
How does purchase frequency (weekly, monthly, quarterly, etc.) affect revenue?
Which items are the top 3 in each category?
Which items are the top 3 in each season?
Do customers who use discounts and promo codes spend more?
Which payment methods are used the most?
Which shipping types are the most popular and earn the most?

#SQL concepts used: GROUP BY, aggregate functions (COUNT, SUM, AVG), CASE WHEN, RANK() window function and CTEs.

Key Findings
Total revenue is $233,081 and the average purchase is $59.76.
Men make up 68% of customers, but women spend slightly more per purchase.
Customers aged 26-65 bring about 76% of revenue.
79.9% of customers are Loyal, but only 2.1% are New.
Only 27% of customers are subscribed. Subscribers repeat purchases more often, but do not spend more per purchase.
Customers who used discounts spent slightly less per purchase than those who did not.
Free Shipping is the most popular shipping type and earns the most revenue.
Jewelry and Blouse are top items in their categories.
Payment methods are used almost equally.
#Conclusion

The business has a strong base of loyal customers, but it needs to attract more new customers. Discounts do not increase spending, and subscriptions help retention but not purchase size. The business can grow by targeting new customers and women, and by using conditional offers instead of general discounts.

Files
README.md - project description
customer_behavior_analysis_report.pdf - full report with insights and recommendations
sql/ - SQL queries used in the analysis
Author

Muhammad Azan Khalid
