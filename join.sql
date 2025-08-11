-- 1. creating customers table
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName TEXT,
    Country TEXT
);


2. -- Inserting values into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'Arun', 'India'),
(2, 'Bharath', 'UK'),
(3, 'Charn', 'USA'),
(4, 'David', 'Canada');


-- 3. fetch data from Customers table using below query
SELECT * FROM Customers;

output:
CustomerID	CustomerName	Country
    1	        Arun	      India
    2	        Bharath	      UK
    3	        Charn	      USA
    4	        David	      Canada


-- 4. Create Orders table
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    Product TEXT,
    OrderDate DATE,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);


5. -- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, Product, OrderDate) VALUES
(101, 1, 'Laptop',  '2025-08-01'),
(102, 1, 'Mouse',   '2025-08-02'),
(103, 2, 'Keyboard','2025-08-05'),
(104, 3, 'Monitor', '2025-08-08');



-- 6. fetch data from Orders table using below query
SELECT * FROM Orders;

output:
OrderID	CustomerID	Product	    OrderDate
101	        1	     Laptop	    2025-08-01
102	        1	     Mouse	    2025-08-02
103	        2	     Keyboard	2025-08-05
104	        3	     Monitor	2025-08-08


-- 7. using  SQL Joins like (Inner, Left, Right, Full) to fetch data

-- -(a) Inner Join
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

output:
CustomerID	CustomerName	Product	   OrderDate
1	        Arun	        Laptop	    2025-08-01
1	        Arun	        Mouse	    2025-08-02
2	        Bharath	        Keyboard	2025-08-05
3	        Charn	        Monitor	    2025-08-08

-- -(b) Left Join
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

output:
CustomerID	CustomerName	Product	   OrderDate
1	        Arun	        Laptop	    2025-08-01
1	        Arun	        Mouse	    2025-08-02
2	        Bharath	        Keyboard	2025-08-05
3	        Charn	        Monitor	    2025-08-08
4	        David	        NULL	    NULL

-- Note: All customers appear, even if they have no orders.
        --  David has no orders, so Product/Date are NULL.


-- -(c) Right Join
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

output:
CustomerID	CustomerName	Product	  OrderDate
1	        Arun	        Laptop	 2025-08-01
1	        Arun	        Mouse	 2025-08-02
2	        Bharath	       Keyboard	 2025-08-05
3	        Charn	        Monitor	 2025-08-08

-- Note: All orders appear, even if the customer is not found.
        --  If an order has no matching customer, CustomerName is NULL.


-- -(d) Full Join
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

output:
CustomerID	CustomerName	Product	  OrderDate
1	        Arun	        Laptop	 2025-08-01
1	        Arun	        Mouse	 2025-08-02
2	        Bharath	       Keyboard	 2025-08-05
3	        Charn	        Monitor	 2025-08-08
4	        David	        NULL	    NULL

-- Note: All customers appear, even if they have no orders.
        --  David has no orders, so Product/Date are NULL.