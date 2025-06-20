-- =================================================================================
-- Query 1: Retrieve Order, Customer, and Employee Information
-- =================================================================================
-- This query joins three tables (Orders, Customers, Employees) to create a list
-- that shows which customer placed each order and which employee handled it.
-- It uses INNER JOINs to connect the tables on their respective ID keys.

SELECT
    o.OrderID,
    c.CompanyName,
    e.FirstName,
    e.LastName
FROM
    Orders o
INNER JOIN
    Customers c ON o.CustomerID = c.CustomerID
INNER JOIN
    Employees e ON o.EmployeeID = e.EmployeeID;

-- =================================================================================
-- Query 2: Find Products from a Specific Supplier
-- =================================================================================
-- This query identifies all products supplied by the company 'Exotic Liquids'.
-- It joins the Products and Suppliers tables and filters the results using a WHERE clause.

SELECT
    p.ProductID,
    s.CompanyName,
    p.ProductName
FROM
    Products p
INNER JOIN
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE
    s.CompanyName = 'Exotic Liquids';

-- =================================================================================
-- Query 3: Identify Late Orders
-- =================================================================================
-- This is a common business question to find orders that missed their deadline.
-- It filters the Orders table for records where the ShippedDate is after the RequiredDate.

SELECT
    OrderID,
    RequiredDate,
    ShippedDate
FROM
    Orders
WHERE
    ShippedDate > RequiredDate;

-- =================================================================================
-- Query 4: Calculate Total Cost for Each Order
-- =================================================================================
-- This query calculates the total cost of each individual order, including discounts.
-- It joins Orders and OrderDetails, multiplies unit price by quantity, applies the discount,
-- and then uses SUM() and GROUP BY to aggregate the total for each OrderID.

SELECT
    o.OrderID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalOrderCost
FROM
    Orders o
INNER JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    o.OrderID
ORDER BY
    TotalOrderCost DESC;

-- =================================================================================
-- Query 5: Find Customers Who Have Never Placed an Order
-- =================================================================================
-- This query uses a LEFT JOIN to find all customers who do not have a
-- corresponding entry in the Orders table. A NULL OrderID after the join
-- indicates that the customer has never placed an order.

SELECT
    c.CustomerID,
    c.CompanyName
FROM
    Customers c
LEFT JOIN
    Orders o ON c.CustomerID = o.CustomerID
WHERE
    o.OrderID IS NULL;

-- =================================================================================
-- Query 6: Identify Top-Performing Employees
-- =================================================================================
-- This query identifies employees who have handled more than 100 orders.
-- It uses COUNT() to aggregate the number of orders and the HAVING clause
-- to filter these aggregated results.

SELECT
    e.FirstName,
    e.LastName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM
    Employees e
INNER JOIN
    Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY
    e.EmployeeID, e.FirstName, e.LastName
HAVING
    COUNT(o.OrderID) > 100
ORDER BY
    NumberOfOrders DESC;

-- =================================================================================
-- Query 7: Determine the Date Range of the Data
-- =================================================================================
-- An exploratory query to find the first and last order dates in the dataset,
-- which is useful for understanding the time span of the data.

SELECT
    MIN(OrderDate) AS FirstOrder,
    MAX(OrderDate) AS LastOrder
FROM
    Orders;

-- =================================================================================
-- Query 8: Count Orders by Quarter
-- =================================================================================
-- This query uses a CASE statement to create custom groupings for each fiscal quarter.
-- It then counts the number of orders that fall into each quarter and groups the
-- results accordingly, providing a summary of business activity over time.

SELECT
    CASE
        WHEN strftime('%m', OrderDate) IN ('01', '02', '03') THEN strftime('%Y', OrderDate) || '-Q1'
        WHEN strftime('%m', OrderDate) IN ('04', '05', '06') THEN strftime('%Y', OrderDate) || '-Q2'
        WHEN strftime('%m', OrderDate) IN ('07', '08', '09') THEN strftime('%Y', OrderDate) || '-Q3'
        WHEN strftime('%m', OrderDate) IN ('10', '11', '12') THEN strftime('%Y', OrderDate) || '-Q4'
    END AS OrderQuarter,
    COUNT(OrderID) AS NumberOfOrders
FROM
    Orders
GROUP BY
    OrderQuarter
ORDER BY
    OrderQuarter;