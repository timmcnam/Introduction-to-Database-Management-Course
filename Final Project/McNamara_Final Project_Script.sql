# Final Project 
# Timothy McNamara
# 4/27/2024
# CIT 21400

create database KeyboardOrderManagement;
use KeyboardOrderManagement;

# PART A 
CREATE TABLE Customers 
(
    Customer_ID varchar(4),
    Customer_Name varchar(100) NOT NULL,
    ContactNumber varchar(15),
    Email varchar(100),
	CONSTRAINT Customers_CustID_PK PRIMARY KEY(Customer_ID) 
);

CREATE TABLE Keyboards
(
    Keyboard_ID varchar(4),
    Keyboard_Name varchar(100) NOT NULL,
    Price decimal(10,2) NOT NULL,
	CONSTRAINT Keyboards_KybrdID_PK PRIMARY KEY(Keyboard_ID)
);

CREATE TABLE Orders 
(
    Order_ID varchar(4),
    Customer_ID varchar(4),
    OrderDate date NOT NULL,
    CONSTRAINT Orders_OrderID_PK PRIMARY KEY(Order_ID),
    CONSTRAINT Orders_CustID_FK FOREIGN KEY (Customer_ID) 
    REFERENCES Customers(Customer_ID)  
);

CREATE TABLE OrderDetails (
    Order_ID varchar(4),
    Keyboard_ID varchar(4),
    Quantity int NOT NULL,
    CONSTRAINT OrderDetails_OrderID_FK FOREIGN KEY (Order_ID) 
    REFERENCES Orders(Order_ID),
    CONSTRAINT OrderDetails_KybrdID_FK FOREIGN KEY (Keyboard_ID) 
    REFERENCES Keyboards(Keyboard_ID),
    CONSTRAINT OrderDetails_OrderID_KybrdID_PK PRIMARY KEY (Order_ID, Keyboard_ID)
);

CREATE TABLE ShippingAddresses 
(
    Address_ID varchar(4),
    Customer_ID varchar(4),
    Street varchar(100) NOT NULL,
    City varchar(50) NOT NULL,
    State varchar(50),
    Country varchar(50) NOT NULL,
    PostalCode varchar(10),
    CONSTRAINT ShippingAddresses_CustID_FK FOREIGN KEY (Customer_ID) 
    REFERENCES Customers(Customer_ID),
    CONSTRAINT ShippingAddresses_AddrID_PK PRIMARY KEY(Address_ID)
);

INSERT INTO Customers (Customer_ID, Customer_Name, ContactNumber, Email) VALUES
('C001', 'Reggie Smith', '317-555-7342', 'dabest32@aol.com'),
('C002', 'Chris Fish', '317-555-8439', 'oktoberfst91@aol.com'),
('C003', 'Alica Wembley', '317-555-0921', 'jaccsonp98321@aol.com'),
('C004', 'Kobe Austin', '317-555-1640', 'cryercall12@aol.com'),
('C005', 'Debra Hayfield', '317-555-4208', 'crystaljump09@aol.com'),
('C006', 'Laura Seward', '317-555-9526', 'crazytrainlover01@aol.com'),
('C007', 'Logan Wilfred', '317-555-7495', 'girthy2332@aol.com'),
('C008', 'William Sherbert', '317-555-3636', 'gueststarpodcast@aol.com'),
('C009', 'Seth Lawerence', '317-555-0221', 'footbul98@aol.com'),
('C010', 'Regina Quigley', '317-555-4769', 'messyfi3081@aol.com'),
('C011', 'Maleek Brown', '317-555-3995', 'clevlandstan2095@aol.com'),
('C012', 'Bawi Thang', '317-555-7848', 'sheffieldLower45578@aol.com'),
('C013', 'Ayo Nelli', '317-555-8402', 'cikus-obaze84@aol.com'),
('C014', 'Kassie Liljana', '317-555-9764', 'cojoc-ejihu94@aol.com'),
('C015', 'Verity Alba', '317-555-1408', 'loz_icaraha97@aol.com'),
('C016', 'Royle Colin', '317-555-8367', 'ricihof-awe61@aol.com'),
('C017', 'Martin Jarod', '317-555-5467', 'dod-abigitu3@aol.com'),
('C018', 'Colin Kiaran', '317-555-7172', 'yadeh_adoro91@aol.com'),
('C019', 'Ferdinand Jaye', '317-555-8855', 'figozuy-ugo12@aol.com'),
('C020', 'Humphry Maximilian', '317-555-8699', 'yudej_ufixi59@aol.com'),
('C021', 'Clarence George', '317-555-5283', 'feni-baxiga75@aol.com'),
('C022', 'Jessy Shirley', '317-555-6288', 'rufon-awowi60@aol.com'),
('C023', 'Jade Rusty', '317-555-7782', 'rate_satezu85@aol.com'),
('C024', 'Woody Wolfe', '317-555-8094', 'tar_avuzire93@aol.com'),
('C025', 'Cass Conway', '317-555-5688', 'dobisot_ivo65@aol.com'),
('C026', 'Martie Clay', '317-555-2853', 'pir-awopase57@aol.com'),
('C027', 'Stu Robert', '317-555-1936', 'diwipap-ayu96@aol.com'),
('C028', 'Ozzie Heath', '317-555-5984', 'messyfi3081@aol.com'),
('C029', 'Kegan Fisher', '317-555-9656', 'mehepom-upi36@aol.com'),
('C030', 'Kingston Oliver', '317-555-3495', 'yumu-kitiki83@aol.com');

INSERT INTO Keyboards (Keyboard_ID, Keyboard_Name, Price) VALUES
('K001', 'K950 KEYBOARD', 49.99),
('K002', 'MX MECHANICAL MINI', 59.99),
('K003', 'JX50 MECHANICAL ERGO', 69.99),
('K004', 'C7 SERIES WIRELESS', 110.99),
('K005', 'JM75 KEYBOARD', 59.99),
('K006', 'HR40 ERGO', 69.99),
('K007', 'K120 CARBON', 129.99),
('K008', 'C8 SERIES WIRELESS', 99.99),
('K009', 'JX30 TACTILE KEYBOARD', 179.99),
('K010', 'JX40 KEYBOARD', 79.99),
('K011', 'K900 WIRELESS KEYBOARD', 199.99),
('K012', 'PRO CX8', 149.99),
('K013', 'C1 SERIES WIRED', 39.99),
('K014', 'K850 KEYBOARD', 55.99),
('K015', 'C6 SERIES WIRELESS', 89.99),
('K016', 'C7 SERIES WIRELESS', 100.99),
('K017', 'LIMITED EDITION ONE PIECE KEYBOARD', 199.99),
('K018', 'STEEL STARLIGHT', 65.99),
('K019', 'STEEL STARLIGHT 2', 125.99),
('K020', 'C2 SERIES V2', 53.99),
('K021', 'JC1 WIRED KEYBOARD', 29.99),
('K022', 'K88 LITESPEED', 60.00),
('K023', 'K600 WIRELESS KEYBOARD', 79.49),
('K024', 'PRO CX9 WIRED', 149.99),
('K025', 'PRO CZ10 WIRELESS', 219.99),
('K026', 'MZ MECHANICAL FULL', 100.99),
('K027', 'C3 SERIES WIRELESS', 60.99),
('K028', 'C4 SERIES WIRELESS', 61.99),
('K029', 'JM99 WIRELESS KEYBOARD', 55.99),
('K030', 'ERGO MINI', 89.99);

INSERT INTO Orders (Order_ID, Customer_ID, OrderDate) VALUES
('O001', 'C001', '2024-01-02'),
('O002', 'C002', '2024-01-02'),
('O003', 'C003', '2024-01-04'),
('O004', 'C004', '2024-01-05'),
('O005', 'C005', '2024-01-08'),
('O006', 'C006', '2024-01-11'),
('O007', 'C007', '2024-01-28'),
('O008', 'C008', '2024-02-02'),
('O009', 'C009', '2024-02-03'),
('O010', 'C010', '2024-02-06'),
('O011', 'C011', '2024-02-14'),
('O012', 'C012', '2024-02-28'),
('O013', 'C013', '2024-03-02'),
('O014', 'C014', '2024-03-03'),
('O015', 'C015', '2024-03-04'),
('O016', 'C016', '2024-03-06'),
('O017', 'C017', '2024-03-06'),
('O018', 'C018', '2024-03-07'),
('O019', 'C019', '2024-03-09'),
('O020', 'C020', '2024-03-09'),
('O021', 'C021', '2024-03-09'),
('O022', 'C022', '2024-03-09'),
('O023', 'C023', '2024-03-10'),
('O024', 'C024', '2024-03-16'),
('O025', 'C025', '2024-03-19'),
('O026', 'C026', '2024-04-02'),
('O027', 'C027', '2024-04-03'),
('O028', 'C028', '2024-04-05'),
('O029', 'C029', '2024-04-13'),
('O030', 'C030', '2024-04-28');

INSERT INTO OrderDetails (Order_ID, Keyboard_ID, Quantity) VALUES
('O001', 'K002', 2),
('O002', 'K003', 1),
('O003', 'K006', 1),
('O004', 'K001', 1),
('O005', 'K002', 2),
('O006', 'K005', 1),
('O007', 'K003', 1),
('O008', 'K007', 3),
('O009', 'K008', 2),
('O010', 'K011', 1),
('O011', 'K009', 2),
('O012', 'K005', 1),
('O013', 'K030', 2),
('O014', 'K013', 1),
('O015', 'K016', 1),
('O016', 'K017', 2),
('O017', 'K014', 2),
('O018', 'K017', 4),
('O019', 'K003', 3),
('O020', 'K007', 3),
('O021', 'K029', 2),
('O022', 'K017', 1),
('O023', 'K007', 2),
('O024', 'K017', 1),
('O025', 'K021', 1),
('O026', 'K020', 1),
('O027', 'K008', 1),
('O028', 'K022', 1),
('O029', 'K014', 2),
('O030', 'K026', 1);

INSERT INTO ShippingAddresses
(Address_ID, Customer_ID, Street, City, State, Country, PostalCode) VALUES
('A001', 'C001', '10 Ramblewood Drive', 'Elizabeth', 'NJ', 'USA', '07202'),
('A002', 'C002', '950 10th Street', 'Greenfield', 'IN', 'USA', '46140'),
('A003', 'C003', '10812 Lakeshore Dr E', 'Carmel', 'IN', 'USA', '46033'),
('A004', 'C004', '9055 West Buckingham Road', 'Fort Walton Beach', 'FL', 'USA', '32547'),
('A005', 'C005', '801 Old Young St.', 'Holbrook', 'NY', 'USA', '11741'),
('A006', 'C006', '272 Bishop St.', 'Chatsworth', 'GA', 'USA', '30705'),
('A007', 'C007', '279 Pawnee Road', 'Ocoee', 'FL', 'USA', '34761'),
('A008', 'C008', '821 Dr Martin Luther King Jr St Apt F', 'Indianapolis', 'IN', 'USA', '46202'),
('A009', 'C009', '901 Division St', 'Indianapolis', 'IN', 'USA', '46221'),
('A010', 'C010', '91 South Shady Street', 'New Lenox', 'IL', 'USA', '60451'),
('A011', 'C011', '6367 Green Leaves Rd', 'Indianapolis', 'IN', 'USA', '46220'),
('A012', 'C012', '7029 Barth Ave', 'Indianapolis', 'IN', 'USA', '46227'),
('A013', 'C013', '8623 Shady Dr', 'Groton', 'CT', 'USA', '06340'),
('A014', 'C014', '272 Westport St', 'Logansport', 'IN', 'USA', '46947'),
('A015', 'C015', '9179 Eagle St', 'Ambler', 'PA', 'USA', '19002'),
('A016', 'C016', '140 N. Thompson Street', 'Woodbridge', 'VA', 'USA', '22191'),
('A017', 'C017', '8389 Studebaker Drive', 'Willingboro', 'NJ', 'USA', '08046'),
('A018', 'C018', '756 White Road', 'Land O Lakes', 'FL', 'USA', '34639'),
('A019', 'C019', '986 Lawrence Street', 'Princeton', 'NJ', 'USA', '08540'),
('A020', 'C020', '28 West Wintergreen Street', 'Williamsburg', 'VA', 'USA', '23185'),
('A021', 'C021', '7109 Brown Lane', 'Perkasie', 'PA', 'USA', '18944'),
('A022', 'C022', '326 Chestnut St', 'Melbourne', 'FL', 'USA', '32904'),
('A023', 'C023', '73 South Wentworth St.', 'Massillon', 'OH', 'USA', '44646'),
('A024', 'C024', '7638 Yukon Ave.', 'Burnsville', 'MN', 'USA', '55337'),
('A025', 'C025', '649 State Avenue', 'Galloway', 'OH', 'USA', '43119'),
('A026', 'C026', '795 Miller Rd.', 'Hanover Park', 'IL', 'USA', '60133'),
('A027', 'C027', '79 East Albany Road', 'Osseo', 'MN', 'USA', '55311'),
('A028', 'C028', '44 10th Drive', 'Harrisonburg', 'VA', 'USA', '22801'),
('A029', 'C029', '223 W. Myrtle Ave.', 'Middleburg', 'FL', 'USA', '32068'),
('A030', 'C030', '152 Valley View Ave.', 'West Lafayette', 'IN', 'USA', '47906');

# PART B

## Retrieve a subset of Columns
# Get the phone number for each customer
SELECT Customer_Name, ContactNumber FROM Customers;

## Use a simple Condition
# List all the keyboards less than $100 and what they are 
# along with their Keyboard ID
SELECT * FROM Keyboards WHERE Price < 100;

# List all the Customers Shipping addresses in the USA
SELECT * FROM ShippingAddresses WHERE Country = 'USA';

## Compund Condition
# List the Keyboards where the price is between 100 or 50 dollars
SELECT * FROM Keyboards WHERE Price > 50 AND Price < 100;

## Uses the Like, Between and IN operator
# List all the customers with the name starting with 'L'
SELECT * FROM Customers WHERE Customer_Name LIKE 'L%';

# List the customer shipping address where the State is in 'IN'
SELECT * FROM ShippingAddresses WHERE State IN ('IN') ;

#List the keyboard prices between 100 and 200 dollars
SELECT * FROM Keyboards WHERE Price BETWEEN 100 AND 200;

## Aggregate Function
# Count the number of orders each customer has placed
SELECT Orders.Customer_ID, SUM(OrderDetails.Quantity) as Total_Quantity
FROM OrderDetails
JOIN Orders ON OrderDetails.Order_ID = Orders.Order_ID
GROUP BY Orders.Customer_ID;

# Count the Number of Customers
SELECT COUNT(*) FROM Customers;

# Get the average price of every keyboard
SELECT AVG(Price) FROM Keyboards;

## Uses the group by clause
# Show the number of each keyboard that has been ordered
SELECT Keyboard_ID, COUNT(*) FROM OrderDetails GROUP BY Keyboard_ID;

## Uses joins to retrieve data from more than one table
# Show each Customer name and their respective order ID using the join
SELECT Orders.Order_ID, Customers.Customer_Name 
FROM Orders JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID;

## Use the IN or Exist operator
# Both below do the same thing but use the different operators.
# The select all from customers where they have the same Customer_ID
# from orders table
SELECT * FROM Customers WHERE Customer_ID 
IN (SELECT Customer_ID FROM Orders);

SELECT * FROM Customers WHERE EXISTS 
(SELECT 1  FROM Orders WHERE Orders.Customer_ID = Customers.Customer_ID );

## Use a subquery
# Create A subquery to find the name of the customer whose order_ID
# is 'O006'
SELECT Customer_Name FROM Customers 
WHERE Customer_ID = (SELECT Customer_ID FROM Orders WHERE Order_ID = 'O006');

## Perfom an Inner or Outer Join 
# Use an Inner Join that Joins the customers_name to their order_ID
SELECT Customers.Customer_Name, Orders.Order_ID 
FROM Customers 
INNER JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID;

## Use ANY or ALL operators
# Select all from keyboard where the price is greater than 100. 
# Use the All operator.
SELECT * FROM Keyboards 
WHERE Price > ALL (SELECT Price FROM Keyboards WHERE Price < 100);












