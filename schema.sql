-- =============================================
-- SuperTechIT: Database Schema & Data Insertion
-- Database Engine: Oracle Database Express Edition
-- =============================================

-- 1. Create Tables (DDL)

CREATE TABLE employee (
    EID NUMBER PRIMARY KEY,
    EName VARCHAR2(50) NOT NULL,
    E_Sal DECIMAL(10, 2) NOT NULL,
    E_Phn VARCHAR2(15)
);

CREATE TABLE customer (
    CID NUMBER PRIMARY KEY,
    CName VARCHAR2(50) NOT NULL,
    C_Phn VARCHAR2(15),
    membership VARCHAR2(50),
    CONSTRAINT check_member CHECK (membership IN ('Gold', 'Sliver', 'Bronze'))
);

CREATE TABLE product (
    PID NUMBER PRIMARY KEY,
    PName VARCHAR2(50) NOT NULL,
    P_price DECIMAL(10, 2) NOT NULL,
    quantity NUMBER
);

CREATE TABLE orders (
    PID NUMBER PRIMARY KEY,
    CID NUMBER,
    CONSTRAINT fk_costomer FOREIGN KEY (CID) REFERENCES customer(CID)
);

CREATE TABLE handle (
    CID NUMBER PRIMARY KEY,
    CName VARCHAR2(50) NOT NULL,
    membership VARCHAR2(50),
    CONSTRAINT handle_member CHECK (membership IN ('Gold', 'Sliver', 'Bronze')),
    EID NUMBER,
    CONSTRAINT fk_handle_employee FOREIGN KEY (EID) REFERENCES employee(EID)
);

CREATE TABLE restore (
    PID NUMBER PRIMARY KEY,
    EID NUMBER,
    CONSTRAINT fk_restore FOREIGN KEY (EID) REFERENCES employee(EID)
);

CREATE TABLE company (
    CompanyID NUMBER PRIMARY KEY,
    CompanyName VARCHAR2(50) NOT NULL,
    CompanyPhn VARCHAR2(50) NOT NULL
);

CREATE TABLE supply (
    PID NUMBER PRIMARY KEY,
    CompanyID NUMBER,
    CONSTRAINT fk_supply FOREIGN KEY (CompanyID) REFERENCES company(CompanyID)
);

CREATE TABLE category (
    CaID NUMBER PRIMARY KEY,
    CaName VARCHAR2(50) NOT NULL
);

CREATE TABLE list (
    PID NUMBER PRIMARY KEY,
    CaID NUMBER,
    CONSTRAINT fk_list FOREIGN KEY (CaID) REFERENCES category(CaID)
);

-- 2. Insert Data (DML)

-- Employee Inserts
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1001, 'Taiyeb Tausif Dhrubo', 70000, '23517202');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1002, 'Sanjida Affrin Bristi', 65000, '23517882');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1003, 'Shreya Chakraborty', 60000, '23517562');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1004, 'Montarin Rahman Jousti', 55000, '23526872');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1005, 'Mr. Chowdhury', 50000, '16111111');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1006, 'Ms. Tasnim', 45000, '17222222');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1007, 'Mr. Khan', 40000, '191111000');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1008, 'Mr. Uddin', 30000, '13001111');
INSERT INTO employee (EID, EName, E_Sal, E_Phn) VALUES (1009, 'Ms. Mina', 20000, '18000001');

-- Customer Inserts
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (101, 'Dhrubo', '023517202', 'Gold');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (102, 'Bristy', '023517882', 'Gold');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (103, 'Shreya', '023517562', 'Gold');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (104, 'Jousti', '023516872', 'Gold');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (105, 'Kabir', '012000019', 'Bronze');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (106, 'Rahima', '013440001', 'Bronze');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (107, 'Raju', '014005504', 'Sliver');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (108, 'Tom', '017909300', 'Bronze');
INSERT INTO customer (CID, CName, C_Phn, membership) VALUES (109, 'Jerry', '019789099', 'Gold');

-- Product Inserts
INSERT INTO product (PID, PName, P_price, quantity) VALUES (1, 'ASUS Laptop', 70000, 10);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (2, 'HP Laptop', 80000, 15);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (3, 'Dell Laptop', 55000, 20);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (4, 'Apple MacBook', 120000, 5);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (5, 'Keyboard', 2000, 30);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (6, 'Printer', 4000, 20);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (7, 'Mouse', 1500, 30);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (8, 'Monitor', 10000, 20);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (9, 'Camera', 70000, 15);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (10, 'Headphone', 1000, 35);
INSERT INTO product (PID, PName, P_price, quantity) VALUES (11, 'Pendrive', 500, 25);

-- Company Inserts
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (100, 'HP', '0023517202');
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (101, 'ASUS', '0023517222');
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (102, 'Dell', '0023517212');
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (103, 'Apple', '0023517112');
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (104, 'Canon', '023051799');
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (105, '4Tech', '023501700');
INSERT INTO company (CompanyID, CompanyName, CompanyPhn) VALUES (106, 'Logitech', '10235172');

-- Category Inserts
INSERT INTO category (CaID, CaName) VALUES (1, 'Laptop');
INSERT INTO category (CaID, CaName) VALUES (2, 'Printer');
INSERT INTO category (CaID, CaName) VALUES (3, 'Keyboard');
INSERT INTO category (CaID, CaName) VALUES (4, 'Mouse');
INSERT INTO category (CaID, CaName) VALUES (5, 'Headphone');
INSERT INTO category (CaID, CaName) VALUES (6, 'Camera');
INSERT INTO category (CaID, CaName) VALUES (7, 'Monitor');