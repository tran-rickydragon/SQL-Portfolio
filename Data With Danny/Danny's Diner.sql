/* --------------------
Problem Statement
Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite.
Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.
He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.
Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!
   --------------------*/

/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?
select
	s.customer_id, 
    sum(m.price) as total_spent
from dannys_diner.sales s
inner join dannys_diner.menu m 
on s.product_id = m.product_id
group by s.customer_id
;

-- 2. How many days has each customer visited the restaurant?
select 
	customer_id, 
	count(distinct order_date) as days_visited
from dannys_diner.sales
group by customer_id
;

-- 3. What was the first item from the menu purchased by each customer?
with rank_orders as (
select 
	s.customer_id, 
	s.order_date, 
	m.product_name,
	dense_rank() over (partition by s.customer_id order by s.order_date) as rank
from dannys_diner.sales s
inner join dannys_diner.menu m 
on s.product_id = m.product_id
	)

select 
	customer_id, 
	product_name
from rank_orders
where rank = 1
group by customer_id, product_name
;

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select
	m.product_name,
	count(s.product_id) as number_ordered
from dannys_diner.sales s
inner join dannys_diner.menu m 
on s.product_id = m.product_id
group by m.product_name
order by number_ordered desc
limit 1
;

-- 5. Which item was the most popular for each customer?
with item_rank as (
	select
	s.customer_id,
	m.product_name,
	count(s.product_id) as number_ordered,
	dense_rank() over (partition by s.customer_id order by count(s.product_id) desc) as rank
from dannys_diner.sales s
inner join dannys_diner.menu m 
on s.product_id = m.product_id
group by s.customer_id, m.product_name
	)

select 
	customer_id, 
	product_name, 
	number_ordered
from item_rank
where rank = 1
;

-- 6. Which item was purchased first by the customer after they became a member?
with member_joined as (
select
	m.customer_id,
	s.product_id,
	dense_rank() over (partition by s.customer_id order by s.order_date) as first_order
	from dannys_diner.sales s
	inner join dannys_diner.members m 
	on s.customer_id = m.customer_id
	and s.order_date > m.join_date
	)

select
	customer_id,
	product_name
from member_joined mj
inner join dannys_diner.menu m
on mj.product_id = m.product_id
where first_order = 1
;

-- 7. Which item was purchased just before the customer became a member?
with before_joined as (
select
	m.customer_id,
	s.product_id,
	dense_rank() over (partition by s.customer_id order by s.order_date desc) as before_member
	from dannys_diner.sales s
	inner join dannys_diner.members m 
	on s.customer_id = m.customer_id
	and s.order_date < m.join_date
	)

select
	customer_id,
	product_name
from before_joined b
inner join dannys_diner.menu m
on b.product_id = m.product_id
where before_member = 1
;

-- 8. What is the total items and amount spent for each member before they became a member?
select
	members.customer_id,
	count(sales.product_id) as total_items,
	sum(menu.price) as total_spent
from dannys_diner.members members
inner join dannys_diner.sales sales
on members.customer_id = sales.customer_id
and sales.order_date < members.join_date
inner join dannys_diner.menu menu
on sales.product_id = menu.product_id
group by members.customer_id
order by s.customer_id
;

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
with points_cal as (
	select
	product_id,
	case
		when product_id = 1 then price*20
		else price*10
	end as points
	from dannys_diner.menu
	)
select
	s.customer_id,
	sum(p.points) as total_points
from dannys_diner.sales s
inner join points_cal p
on s.product_id = p.product_id
group by s.customer_id
order by s.customer_id
;

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
with first_week as (
	select
		customer_id,
		join_date,
		join_date + 6 as end_week1
	from dannys_diner.members
	)
	
select
	s.customer_id,
	sum(case
	   when m.product_id = 1 then m.price*20
		when s.order_date between fw.join_date and fw.end_week1 then m.price*20
		else m.price*10
		end
	   ) as total_points
from dannys_diner.menu m
inner join dannys_diner.sales s
on m.product_id = s.product_id
inner join first_week fw 
on fw.customer_id = s.customer_id
group by s.customer_id
;