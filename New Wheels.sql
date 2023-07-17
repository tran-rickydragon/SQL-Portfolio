-- --Queries are written by me. Data dump was provided to me
use new_wheels;
/*-- QUESTIONS RELATED TO CUSTOMERS
     [Q1] What is the distribution of customers across states?
     Hint: For each state, count the number of customers.*/
select count(customer_id) as customer_count, state
from customer_t
group by state
order by customer_count desc;
-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q2] What is the average rating in each quarter?
-- Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5.

Hint: Use a common table expression and in that CTE, assign numbers to the different customer ratings. 
      Now average the feedback for each quarter. */

with feedback_cte as (
select quarter_number,
sum(case when customer_feedback = 'Very Bad' then 1 else 0 end) as Very_Bad,
sum(case when customer_feedback = 'Bad' then 2 else 0 end) as Bad,
sum(case when customer_feedback = 'Okay' then 3 else 0 end) as Okay,
sum(case when customer_feedback = 'Good' then 4 else 0 end) as Good,
sum(case when customer_feedback = 'Very Good' then 5 else 0 end) as Very_Good,
count(customer_feedback) as total_feedback
from order_t
group by quarter_number
order by quarter_number
)

select quarter_number, ((Very_Bad + Bad + Okay + Good + Very_Good)/total_feedback) as avg_feeback
from feedback_cte
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q3] Are customers getting more dissatisfied over time?

Hint: Need the percentage of different types of customer feedback in each quarter. Use a common table expression and
	  determine the number of customer feedback in each category as well as the total number of customer feedback in each quarter.
	  Now use that common table expression to find out the percentage of different types of customer feedback in each quarter.*/
      
with feedback_count_cte as (
select quarter_number,
sum(case when customer_feedback = 'Very Bad' then 1 else 0 end) as Very_Bad,
sum(case when customer_feedback = 'Bad' then 1 else 0 end) as Bad,
sum(case when customer_feedback = 'Okay' then 1 else 0 end) as Okay,
sum(case when customer_feedback = 'Good' then 1 else 0 end) as Good,
sum(case when customer_feedback = 'Very Good' then 1 else 0 end) as Very_Good,
count(customer_feedback) as total_feedback
from order_t
group by quarter_number
order by quarter_number
)

select quarter_number, 
(Very_Bad /total_feedback) * 100 as Very_Bad,
(Bad /total_feedback) * 100 as Bad,
(Okay /total_feedback) * 100 as Okay,
(Good /total_feedback) * 100 as Good,
(Very_Good /total_feedback) * 100 as Very_Good
from feedback_count_cte
;
-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q4] Which are the top 5 vehicle makers preferred by the customer.

Hint: For each vehicle make what is the count of the customers.*/

select p.vehicle_maker, count(c.customer_id) as customer_count
from product_t p
join order_t o using (product_id)
join customer_t c using (customer_id)
group by p.vehicle_maker
order by customer_count desc
limit 5
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/*[Q5] What is the most preferred vehicle make in each state?

Hint: Use the window function RANK() to rank based on the count of customers for each state and vehicle maker.*/

select state, make
from (
select c.state as state, p.vehicle_maker as make, 
rank() over (partition by c.state order by count(c.customer_id) desc) as ranking
from product_t p
join order_t o using (product_id)
join customer_t c using (customer_id)
group by c.state, p.vehicle_maker
) rank_tbl
where ranking = 1
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/*QUESTIONS RELATED TO REVENUE and ORDERS 

-- [Q6] What is the trend of number of orders by quarters?

Hint: Count the number of orders for each quarter.*/

select quarter_number, count(order_id)
from order_t
group by quarter_number
order by quarter_number
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q7] What is the quarter over quarter % change in revenue? 

Hint: Quarter over Quarter percentage change in revenue means what is the change in revenue from the subsequent quarter to the previous quarter in percentage.
      To calculate you need to use the common table expression to find out the sum of revenue for each quarter.
      Then use that CTE along with the LAG function to calculate the QoQ percentage change in revenue.*/

with revenue as (
select quarter_number, sum(quantity * (vehicle_price - ((discount/100)*vehicle_price))) as revenue
from order_t
group by quarter_number
order by quarter_number
)
, revenue_lag as (
select quarter_number, revenue, lag(revenue, 1) over (order by quarter_number) previous_quarter
from revenue
group by quarter_number
order by quarter_number
)
select quarter_number, revenue, previous_quarter, round((((revenue - previous_quarter) / previous_quarter)*100),2) as QoQ
from revenue_lag
group by quarter_number
order by quarter_number
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q8] What is the trend of revenue and orders by quarters?

Hint: Find out the sum of revenue and count the number of orders for each quarter.*/

select quarter_number, sum(quantity * (vehicle_price - ((discount/100)*vehicle_price))) as revenue, count(order_id) as order_count
from order_t
group by quarter_number
order by quarter_number
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* QUESTIONS RELATED TO SHIPPING 
    [Q9] What is the average discount offered for different types of credit cards?

Hint: Find out the average of discount for each credit card type.*/

select credit_card_type, avg(discount) as avg_discount
from customer_t
join order_t using (customer_id)
group by credit_card_type
;

-- ---------------------------------------------------------------------------------------------------------------------------------

/* [Q10] What is the average time taken to ship the placed orders for each quarters?
	Hint: Use the dateiff function to find the difference between the ship date and the order date.*/

select quarter_number, avg(datediff(ship_date, order_date)) as avg_ship_time
from order_t
group by quarter_number
order by quarter_number
;

-- --------------------------------------------------------Done----------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------



