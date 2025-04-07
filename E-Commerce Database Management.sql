CREATE DATABASE E_Commerce ;
use E_Commerce;
create table products (
		Product_ID int primary key ,
        product_name varchar (100),
        category varchar(50),
        price decimal (10,2),
        stock int);
        
 create table customers (
		customer_ID int primary key ,
        firstname varchar (50),
        lastname varchar (50),
        email varchar(1000),
        phone_no int,
        address varchar (100)); 

create table orders (
		order_ID int,
        customer_ID int,
        product_id int,
        quantity int,
        order_date date,
        Total_Amount DECIMAL(10, 2),
        foreign key (customer_ID) references customers(customer_ID),
        foreign key (product_ID) references products(product_ID));
        
insert into products(Product_ID,Product_Name,Category,Price,Stock)
values
(1,"Smartphone","Electronics",699.00,50),
(2,"Laptop","lectronics",1299.00,30),
(3,"Headphones","Electronics","199.00",100),
(4,"Coffee Maker","Appliances",99.00,40),
(5,"Desk Chair","Furniture",249.00,20),
(6,"Microwave Oven","Appliances",299.00,25),
(7,"Running Shoes","Sportswear",149.00,60);

insert into customers(customer_ID, firstname, lastname, email, Phone_no, address)
values
(1,	"John",	"Doe",	"john.doe@email.com",	12567890,	"123 Elm St, NY"),
(2,	"Jane",	"Smith", "jane.smith@email.com",	116543210,	"456 Oak St, CA"),
(3,"Bob",	"Johnson", "bob.johnson@email.com",	56781234,	"789 Pine St, TX"),
(4,"Alice", "Brown", "alice.brown@email.com",	3489012,	"321 Maple St, FL"),
(5,"Emily", "Davis", "emily.davis@email.com",	4890123,	"654 Cedar St, IL"),
(6,	"Michael", "Miller", "michael.miller@email.com",89012345,	"987 Birch St, WA"),
(7,	"Sarah", "Wilson", "sarah.wilson@email.com",0123456, "123 Ash St, MA" );

insert into orders(order_ID, customer_ID, product_iD, quantity, order_date, Total_Amount)
values
(1,	1,	1,	2,	"2025-01-01",	1398.00),
(2,	2,	3,	1,	"2025-01-02",	199.00),
(3,	3,  5,	1,	"2025-01-03",	249.00),
(4,	4,	7,	3,	"2025-01-04",	447.00),
(5,	5,	6,	1,	"2025-01-05",	299.00),
(6,	6,	4,	2,	"2025-01-06",	198.00),
(7,	7,	2,	1,	"2025-01-07",	1299.00);

select product_name,category,price,stock from products ;
select* from orders ;
select*from orders as o join customers as c on o.customer_ID = c.customer_ID join products as p on o.Product_ID= p.Product_Id;
select sum(Total_Amount) as Total_Revenue from orders;
SELECT c.firstname,c.lastname,  MAX(o.Total_Amount) AS HighestOrder FROM orders as o JOIN customers as c ON o.customer_ID = c.customer_ID;
select product_name ,stock from products where stock >20;
update products set stock =stock-1 where Product_ID =2;
delete from orders WHERE order_date < CURDATE() - INTERVAL 1 YEAR;