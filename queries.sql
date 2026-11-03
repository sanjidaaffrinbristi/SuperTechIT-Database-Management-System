-- =============================================
-- SuperTechIT: SQL Query Testing & Database Views
-- =============================================

-- 1. Simple Queries
SELECT PID, PName, P_price, quantity FROM product;
SELECT EID, EName, E_Sal FROM employee WHERE E_Sal BETWEEN 55000 AND 70000;

-- 2. Single Row Function Query
SELECT * FROM customer WHERE CName LIKE 'R%';

-- 3. Aggregate Functions / Multiple Row Queries
SELECT * FROM employee WHERE E_Sal = (SELECT MIN(E_Sal) FROM employee);
SELECT * FROM employee WHERE E_Sal = (SELECT MAX(E_Sal) FROM employee);
SELECT COUNT(PID) AS Total_Product, SUM(quantity) AS Overall_Quantity FROM product;

-- 4. Single Row Subquery
SELECT CompanyID, CompanyName FROM company WHERE CompanyID = (SELECT CompanyID FROM supply WHERE PID = 3);
SELECT * FROM employee WHERE E_Sal > (SELECT E_Sal FROM employee WHERE EName = 'Ms. Tasnim');

-- 5. Multiple Row Subquery
SELECT * FROM product WHERE PID IN (SELECT PID FROM list WHERE CaID = (SELECT CaID FROM category WHERE CaName = 'Laptop'));
SELECT * FROM product WHERE PID = ANY(SELECT PID FROM orders WHERE CID = ANY(SELECT CID FROM customer WHERE membership = 'Gold'));

-- 6. Joins Testing
-- Left Join
SELECT p.PName, c.CName 
FROM product p 
LEFT JOIN orders o ON p.PID = o.PID 
LEFT JOIN customer c ON c.CID = o.CID;

-- Right Join
SELECT c.CID, c.CName, p.PName 
FROM customer c 
RIGHT JOIN orders o ON c.CID = o.CID 
RIGHT JOIN product p ON p.PID = o.PID;

-- Full Outer Join
SELECT p.PName, c.CName 
FROM product p 
FULL JOIN orders o ON p.PID = o.PID 
FULL JOIN customer c ON c.CID = o.CID;

-- Self Join & Equi Join
SELECT e.EName, e.E_Sal FROM employee e, employee b WHERE e.E_Sal > b.E_Sal;
SELECT c.CID, c.CName, o.PID FROM customer c, orders o WHERE c.CID = o.CID;

-- 7. Database Views
-- Simple View
CREATE VIEW Show_Company AS 
SELECT CompanyID AS Company_Sl_No, CompanyName AS Company_Title, CompanyPhn AS Phone_No 
FROM company;

SELECT * FROM Show_Company;

-- Complex View
CREATE VIEW Restore_Product_List AS 
SELECT p.PID AS Product_ID, p.PName AS Product_Name, r.EID AS Employee_ID 
FROM product p, restore r 
WHERE p.PID = r.PID;

SELECT * FROM Restore_Product_List;