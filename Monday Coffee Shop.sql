--create a database 
create database ;

--Creating tables  

drop table if exists city;
create table city
(
	city_id	INT PRIMARY KEY,
	city_name VARCHAR(15),	
	population	BIGINT,
	estimated_rent	FLOAT,
	city_rank INT
);

drop table if exists customers ;
CREATE TABLE customers
(
	customer_id INT PRIMARY KEY,	
	customer_name VARCHAR(25),	
	city_id INT,
	CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES city(city_id)
);

drop table if exists products;
CREATE TABLE products
(
	product_id	INT PRIMARY KEY,
	product_name VARCHAR(35),	
	Price float
);

drop table if exists sales ;
CREATE TABLE sales
(
	sale_id	INT PRIMARY KEY,
	sale_date	date,
	product_id	INT,
	customer_id	INT,
	total FLOAT,
	rating INT,
	CONSTRAINT fk_products FOREIGN KEY (product_id) REFERENCES products(product_id),
	CONSTRAINT fk_customers FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);


----
select * from city ;

select * from customers;

select * from products ;

select * from sales;

--------------counting data 
select count(*) from city ;

select count(*) from customers;

select count(*) from products ;

select count(*) from sales;

--EDA
select * from customers
where 
customer_id is null
or customer_name is null
or city_id is null ;

--
select * from sales 
where sale_id is null
or sale_date is null
or product_id is null
or customer_id is null
or total is null
or rating is null ;

--- 
--Q1.Coffee Consumers Count
--How many people in city are estimated to consume coffee.given that 25% of the population does.
select 
city_name,
round((population*0.25),2) as total_population,
city_rank
from city
order by total_population desc 

-- Total Revenue from coffee sales
--what is the total revenue generated from coffee sales across all cities in the last quater of 2023

select * from sales ;

select cy.city_name ,
sum(s.total) as total_sales
from sales as s join customers as c on s.customer_id = c.customer_id
join city as cy on cy.city_id = c.city_id
where 
 extract( year from s.sale_date) = 2023
 and
 extract(quarter from s.sale_date ) = 4
group by cy.city_name
order by totaL_sales desc;

--Sales Count for Each Product
--How many units of each coffee product have been sold?
select product_name,count(*) as total_sale from sales as s left join products as p on s.product_id= p.product_id  
group by 1 
order by 2 desc;

--Average Sales Amount per City
--What is the average sales amount per customer in each city?
select ci.city_name,count(distinct c.customer_id) as customer_count,sum(s.total) as total_rev,
(sum(s.total)/count(distinct c.customer_id)) as avg_ammount from  sales as s
join customers as c on  s.customer_id = c.customer_id 
join city as ci on ci.city_id = c.city_id 
group by 1
order by 3 desc ;

--City Population and Coffee Consumers
--Provide a list of cities along with their populations and estimated coffee consumers.
