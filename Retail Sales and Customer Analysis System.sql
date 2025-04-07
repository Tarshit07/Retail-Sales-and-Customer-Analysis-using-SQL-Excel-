create DATABASE Business ;
use Business ;
create table products (
		Product_ID int primary key ,
        product_name varchar (100),
        category varchar(50),
        price decimal (10,2),
        stock int);
        
 create table customers (
		customer_ID int primary key ,
        firstname varchar (500),
        lastname varchar (500),
        email varchar(1000),
        phone_no int); 

create table orders (
		order_ID int,
        customer_ID int,
        product_id int,
        quantity int,
        order_date date,
        Total_Amount DECIMAL(10, 2),
        foreign key (customer_ID) references customers(customer_ID),
        foreign key (product_ID) references products(product_ID));
    
create table expance (Expense_ID int,
					Expense_Type varchar (500),
                    Amount decimal(10,2),
                    Expense_Date date);   
    
    
insert into products(Product_ID,Product_Name,Category,Price,Stock)
values
(1,"iphone 15","Electronics",999.00,50),
(2,"MacBook pro","Electronics",1999.00,30),
(3,"Office Chair","Furniture","299.00",20),
(4,"AirPods","Accessories",199.00,80),
(5,"Cofee table","Furniture",129.00,25),
(6,"Smartwatch","Wearable",249.00,40),
(7,"LED Moniter","Electronics",249.00,45);

insert into customers(customer_ID, firstname, lastname, email, Phone_no)
values
(1,	"John",	"Doe",	"john.doe@email.com",	12567890),
(2,	"Jane",	"Smith", "jane.smith@email.com",987656650),
(3,"Emily",	"Johnson", "emily.j@email.com",	85274130),
(4,"Michael", "Brown", "michael.b@email.com",963258710),
(5,"Sarah", "Wilson", "sarah.w@email.com",741852960),
(6,	"Robert", "Davis", "robert.d@email.com",369258140),
(7,	"Olivia", "Martinez", "olivia.m@email.com	",159357462);

insert into orders(order_ID, customer_ID, product_iD, quantity, order_date, Total_Amount)
values
(1,	1,	2,	1,	"2025-01-01",	1999.00),
(2,	3,	3,	2,	"2025-01-02",	598.00),
(3,	5,  5,	1,	"2025-01-03",	129.00),
(4,	1,	1,	1,	"2025-01-04",	999.00),
(5,	6,	6,	1,	"2025-01-05",	349.00),
(6,	7,	7,	1,	"2025-01-06",	249.00),
(7,	4,	4,	3,	"2025-01-07",	597.00);

insert into expance(Expense_ID, Expense_Type, Amount ,Expense_Date)
values
(1, "Rent",	3000.00, "2025-01-01"),
(2,	"Salary",8000.00, "2025-01-02"),
(3,"Utilities",	500.00,	"2025-01-03"),
(4,"Marketing",	1200.00, "2025-01-04"),
(5,"Inventory",	5000.00, "2025-01-05");
select SUM(Total_Amount) AS Total_Revenue FROM orders;
SELECT Product_ID, SUM(quantity) AS Total_Sold FROM orders GROUP BY Product_ID ORDER BY Total_Sold LIMIT 5;
SELECT c.firstname, c.lastname, SUM(o.Total_Amount) AS Total_Spent FROM orders o JOIN customers c ON o.customer_ID = c.customer_ID GROUP BY c.customer_ID ORDER BY Total_Spent DESC LIMIT 5;
SELECT MONTH(order_date) AS Month, SUM(Total_Amount) AS MonthlyRevenue FROM orders GROUP BY MONTH(order_date) ORDER BY Month;
SELECT product_name, Stock FROM products WHERE stock < 10;
select stock from products;
SELECT 
    (SELECT SUM(Total_Amount) FROM orders) - (SELECT SUM(Amount) FROM expance) AS Profit;
select*from expance;






