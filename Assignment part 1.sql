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


 





 