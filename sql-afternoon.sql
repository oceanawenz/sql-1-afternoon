--TABLE PERSON--

-- step 1 Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color
create table person (
person_id serial primary key,
name varchar(64) not null,
age integer not null,
height integer not null,
city varchar(64) not null,
favorite_color varchar(64) not null
);

-- step 2 Add 5 different people into the person database.
insert into person (name, age, height, city, favorite_color) 
values
('Michael', 27, 196, 'Phoenix', 'red'),
('Brody', 55, 165, 'Houston', 'blue'),
('Max', 30, 210, 'Miami', 'brown'),
('Archer', 23, 250, 'Portland', 'green'),
('Carter', 40, 180, 'Seattle', 'orange')

--step 3 --List all the people in the person table by height from tallest to shortest
select * from person 
order by height desc;

-- step 4 List all the people in the person table by height from shortest to tallest.
select * from person
order by height asc;

-- step 5 List all the people in the person table by age from oldest to youngest.
select * from person
order by age desc;

-- step 6 List all the people in the person table older than age 20.
select * from person
where age > 20;

-- step 7 List all the people in the person table that are exactly 18.
select * from person
where age = 18;

--step 8 List all the people in the person table that are less than 20 and older than 30.
select * from person
where age < 20 or age > 30; 

--step 9: List all the people in the person table that are not 27 (Use not equals).
select * from person
where age !=27;

--step 10: List all the people in the person table where their favorite color is not red.
select * from person
where favorite_color != 'red'; 

--step 11: List all the people in the person table where their favorite color is not red and is not blue.
select * from person
where favorite_color != 'red' and favorite_color != 'blue';

--step 12: List all the people in the person table where their favorite color is orange or green.
select * from person
where favorite_color = 'orange' or favorite_color = 'green';

--step 13: List all the people in the person table where their favorite color is orange, green or blue (use IN).
select * from person 
where favorite_color in ('orange', 'green', 'blue');

--step 14: List all the people in the person table where their favorite color is yellow or purple (use IN).
select * from person
where favorite_color in ('yellow', 'purple');

-- TABLE ORDERS ---------
-- step1: Create a table called orders that records: person_id, product_name, product_price, quantity.
create table orders (
   person_id serial primary key,
  product_name varchar(64) not null,
  product_price numeric,
  quantity integer
);

--step2: Add 5 orders to the orders table. 
    --Make orders for at least two different people.
insert into orders (person_id, product_name, product_price, quantity)
values 
(0,'macbook', 2000, 1),
(1,'airpods', 150, 3),
(2,'mouse', 80, 2),
(3,'apple pencil', 100, 5),
(4,'iphone', 1000, 1);

--step3: Select all the records from the orders table.
select * from orders;

--step4: Calculate the total number of products ordered.
select sum(quantity) from orders;

--step5: Calculate the total order price.
select sum(product_price * quantity) from orders;

--step6: Calculate the total order price by a single person_id.
select sum(product_price * quantity) from orders
where person_id = 1;

----TABLE ARTIST---------------
--step 1: Add 3 new artists to the artist table. ( It's already created )
insert into artist (name)
values
('michelle'),
('meghan'),
('karlie');

--step 2: Select 10 artists in reverse alphabetical order.
select * from artist 
order by name desc limit 10;

--step 3: Select 5 artists in alphabetical order.
select * from artist
order by name asc limit 5;

--step 4: Select all artists that start with the word 'Black'.
select * from artist 
where name like 'Black%';

--step 5: Select all artists that contain the word 'Black'.
select * from artist 
where name like '%Black%';

--TABLE EMPOLYEE---------------------
--step 1: List all employee first and last names only that live in Calgary.
select first_name, last_name from employee
where city = 'Calgary';

--step 2: Find the birthdate for the youngest employee.
select max(birth_date) from employee;

--step 3: Find the birthdate for the oldest employee.
select min(birth_date) from employee;

--step 4: Find everyone that reports to Nancy Edwards (Use the ReportsTo column).
select * from employee
where reports_to = 2;

--step 5: Count how many people live in Lethbridge.
select count(*) from employee 
where city = 'Lethbridge';

--TABLE INVOICE----------------------
--step 1: Count how many orders were made from the USA.
select count(*) from invoice
where billing_country = 'USA';

--step 2: Find the largest order total amount.
select max(total) from invoice;

--step 3: Find the smallest order total amount.
select min(total) from invoice;

--step 4: Find all orders bigger than $5.
select * from invoice
where total > 5;

--step 5: Count how many orders were smaller than $5.
select count(*) from invoice
where total < 5;

--step 6: Count how many orders were in CA, TX, or AZ (use IN).
select count(*) from invoice 
where billing_state in ('CA', 'TX', 'AZ');

--step 7: Get the average total of the orders.
select avg(total) from invoice;

--step 8: Get the total sum of the orders.
select sum(total) from invoice;