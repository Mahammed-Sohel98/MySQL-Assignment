Create database assignment;
Show databases;
Use assignment;
Drop database assignment;
show databases;
Drop table countries;
Create table countries(slno int primary key auto_increment ,cname varchar(30),population int,capital varchar(30));
Show tables;
Select * from countries;
Insert into countries(cname,population,capital) values
("China",1382,"Beijing"),
("India",1326,"Delhi"),
('United States',324,'Washington D.C.'),
("Indonesia",260,"Jakarta"),
("Brazil",209,"Brasilia"),
("Pakistan",193,"Islamabad"),
("Nigeria",187,"Abuja"),
("Bangladesh",163,"Dhaka"),
("Russia",143,"Moscow"),
("Mexico",128,'Mexico City'),
("Japan",126,"Tokyo"),
("Philippines",102,"Manila"),
("Ethiopia",101,'Addis Ababa'),
("Vietnam",94,"Hanoi"),
("Egypt",93,"Cairo"),
("Germany",81,"Berlin"),
("Iran",80,"Tehran"),
("Turkey",79,"Ankara"),
("Congo",79,"Kinshasa"),
("France",64,"Paris"),
('United Kingdom',65,"London"),
("Italy",60,"Rome"),
('South Africa',55,"Pretoria"),
("Myanmar",54,"Naypyidaw");

/* B- Add a couple of countries of your choice */

Insert into countries(cname,population,capital) values
( 'South Korea',51,"Seoul"),
( "Colombia",50,"Bogota"),
("Spain", 46,"Madrid"),                      
("Uganda",45,"Kampala");
Select * from countries;

/* C) Change ‘Delhi' to ‘New Delhi' */

Update countries
set capital='New Delhi'
where slno=2;

/* 4. Rename the table countries to big_countries */

Rename table countries to big_countries;
show tables;
Select * from big_countries;

/* 5. Create the following tables. Use auto increment wherever applicable  */

Create table product (slno int Unique auto_increment,productid int not null primary key,
`Product name` varchar(40) not null unique,Discription varchar(500),supplierid int not null);
alter table product change column supplierid supplier_id int not null;

insert into product(productid,`product name`,discription,supplier_id)value
(123,"laptop","A laptop computer, sometimes called a notebook computer by manufacturers, is a battery- or AC-powered personal computer",
9080),
(234,"mobile","A mobile phone, portable device for connecting to a telecommunications network in order to transmit and receive voice, etc",
8978),
(345,"Watch","A watch is a portable timepiece intended to be carried or worn by a person.",6787),
(456,"Headphone","A Headphones are a pair of padded speakers which you wear over your ears in order to listen to a recorded music",5676);
insert into product(productid,`product name`,discription,supplier_id)value
(324,"smart_phpne","A smart_phone, portable device for connecting to a telecommunications network in order to transmit and receive voice, etc",
2233),
(432,"smart_watch","A smart_watch is a portable timepiece intended to be carried and easy to connect with smart_phone",2233);

update product set supplier_id=9080 where slno=3;
update product set supplier_id=8978 where slno=4;
truncate product;

Select * from product order by slno;
desc product;

Create table Supplier (slno int Unique auto_increment,supplier_id int not null primary key,
supplier_name varchar(40) not null unique,location varchar(40));
alter table supplier drop index supplier_name;

insert into supplier(supplier_id,supplier_name,location) values 
(9080,"Asus","hyderabad"),
(8978,"JBL","pune"),
(2233,"Titan","cuttack");
Select * from supplier order by slno;
desc supplier;
truncate supplier;

alter table product add constraint fk_product foreign key (supplier_id) references Supplier(supplier_id);

alter table product drop foreign key fk_product;

Create table stoke(slno int unique auto_increment,id int primary key,product_id int,blance_stoke int);
insert into stoke(id,product_id,blance_stoke) values 
(6162,234,289),(7272,456,763),(8383,234,654),(9494,432,675),(7823,123,543);


Select * from stoke;
desc stoke;

alter table stoke add constraint fk_stoke foreign key (product_id) references product(productid);
alter table stoke drop foreign key fk_stoke;



/*  7. Modify the supplier table to make supplier name unique and not null. */

alter table supplier add unique (supplier_name);

/*  8. Modify the emp table as follows    */

Select * from emp;
alter table emp add column deptno int;

alter table emp change column emp_no emp_id int;

/*when 20 where emp_id is divisible by 2, deptno = 30 where emp_id is divisible by 3,deptno = 40 where emp_id is divisible by 4,
deptno = 50 where emp_id is divisible by 5,deptno = 10 for the remaining records.*/


update emp set deptno=
case 
when emp_id % 2 = 0 THEN 20
when emp_id % 3 = 0 THEN 30
when emp_id % 4 = 0 THEN 40
when emp_id % 5 = 0 THEN 50
ELSE  10
  END;
  
  
  alter table emp add constraint uc_emp unique (emp_id);
  
  /*  10. Create a view called emp_sal on the emp table by selecting the following fields 
  in the order of highest salary to the lowest salary.emp_no, first_name, last_name, salary  */


desc emp;
select * from emp;
alter table emp change column emp_id emp_no int;

create view emp_sel as 
select emp_no, first_name, last_name, salary from emp
order by salary desc;
select * from emp_sel;

##------------------------------------------Assignment 2-------------------------------------------------------------------------

Select * from employee;
desc employee;

##   1. select all employees in department 10 whose salary is greater than 3000. [table: employee] ------------------------------

select empid,salary from employee order by salary desc limit 10;

/* 2. The grading of students based on the marks they have obtained is done as follows:

40 to 50 -> Second Class,50 to 60 -> First Class,60 to 80 -> First Class,80 to 100 -> Distinctions */

select * from students;

select marks,if(marks>=80,"Distinction",if(marks>50,"First class",if(marks>40,"Second class","fail"))) as Gread
from students order by marks desc;

/* a. How many students have graduated with first class?*/
select count(*) as total_students from students where marks>=60;

/* b. How many students have obtained distinction? [table: students]*/

select count(*) as total_student from students where marks>=80;

/* 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station] */

Select * from station;

Select distinct id,city from station  where id % 2=0 ;

/*  4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table.
In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, 
write a query to find the value of N-N1 from station.[table: station] */
Select
(select count(distinct city) from station) as unique_count,
(select count(*) from station) as total,
(select count(*)-count(distinct city) from station) as difference; 

/* 5. Answer the following
a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 
from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]*/

Select * from station;
select distinct city from station
where left(city,1) in ("a","e","i","o","u");

/* b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
Your result cannot contain duplicates.*/

Select * from station;

select distinct city from station
where left(city,1) in ("a","e","i","o","u") and left(reverse(city),1) in ("a","e","i","o","u");

/* c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates. */

SELECT DISTINCT city
FROM station
WHERE left(city,1)not in ("a","e","i","o","u");

/*  d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
 Your result cannot contain duplicates. [table: station] */
 
 Select distinct city from station
 where left(city,1) not in ("a","e","i","o","u") and left(reverse(city),1) not in ("a","e","i","o","u");
 
 /* 6. Write a query that prints a list of employee names having a salary greater than $2000 per month 
 who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp] */
 
 Select * from emp;
 
 Select first_name,last_name,salary ,hire_date from emp
 where /*salary>2000 and */timestampdiff(month,hire_date,curdate())<36
 order by salary desc;
select first_name,hire_date, timestampdiff(month,hire_date,curdate()) from emp;

select first_name,last_name,timestampdiff(month,hire_date,curdate()) from emp
where timestampdiff(month,hire_date,curdate())<36 and salary>2000
order by salary desc;

/* 7. How much money does the company spend every month on salaries for each department? [table: employee] */

select * from employee;

select deptno,sum(salary) from employee
group by deptno;

/* 8. How many cities in the CITY table have a Population larger than 100000. [table: city] */

select * from city;

select count(*) city_count from city 
where population>100000;

/*  9. What is the total population of California? [table: city] */

select countrycode,sum(population)from city where district="california"
group by countrycode;

/* 10. What is the average population of the districts in each country? [table: city] */
select * from city;

select countrycode,district,round(avg(population),2) average_population from city
group by countrycode,district;

/*  11. Find the ordernumber, status, customernumber, customername and comments for all 
orders that are ‘Disputed=  [table: orders, customers]   */

select * from orders;
select * from customers;

Select orders.ordernumber,orders.status,orders.customernumber,orders.comments,customers.customername
from orders join customers on orders.customernumber=customers.customernumber
where orders.status="disputed";

select orders.ordernumber,orders.status,orders.customernumber,orders.comments,customers.customername
from orders left join customers on orders.customernumber=customers.customernumber
where orders.status="disputed";



##---------------------------------------------Assignment 3--------------------------------------------------------------------------

/*  a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria .[table:Payments]
if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
if amount > 50000 Platinum  */

select * from payments;

select customernumber,if(amount>50000,"Platinum",if(amount>25000,"Gold","Silver")) Status_ from payments;

/*  Write a query that displays customerNumber, customername and purchase_status from customers table. */
Select * from customers;

SELECT 
    customerNumber, 
    customerName 
	
FROM 
    Customers;
    
    
    /* 3. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables.
    Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above  */
    
    select * from movies;
    
    alter table movies add constraint pk_movies primary key(id); 
    desc movies;
    
    select * from rentals;
    
    alter table rentals add constraint pk_rentals primary key (memid);
    alter table rentals add constraint fk_rentals foreign key (movieid) references movies(id);
    desc rentals;
    

    
  DELIMITER //
    create trigger movies_delete_cascade before delete on movies 
    for each row 
    begin 
    delete from  rental where movieid=old.id;
    end //
    
  
    create trigger movies_update_cascade after update on movies 
    for each row 
    begin update rentals set movieid=new.id where movieid=old.id;
    
    end //
   
    
    















 





 