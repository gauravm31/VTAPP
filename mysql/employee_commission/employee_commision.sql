CREATE TABLE Departments(
  ID int(5) AUTO_INCREMENT,
  NAME CHAR(20),
  PRIMARY KEY(ID)
  );
--Query OK, 0 rows affected (0.42 sec)

INSERT INTO Departments(NAME) VALUES("Banking");
--Query OK, 1 row affected (0.34 sec)

INSERT INTO Departments(NAME) VALUES("Insurance");
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Departments(NAME) VALUES("Services");
--Query OK, 1 row affected (0.00 sec)

SELECT * FROM departments;
+----+-----------+
| ID | NAME      |
+----+-----------+
|  1 | Banking   |
|  2 | Insurance |
|  3 | Services  |
+----+-----------+
3 rows in set (0.00 sec)

CREATE TABLE Employees(
 ID int(10) AUTO_INCREMENT,
 NAME CHAR(20), SALARY int(10), 
 DEPARTMENT_ID int(10), 
 PRIMARY KEY(ID), 
 FOREIGN KEY(DEPARTMENT_ID) REFERENCES departments(ID)  );
--Query OK, 0 rows affected (0.11 sec)

INSERT INTO Employees(NAME,SALARY,DEPARTMENT_ID) VALUES("Chris Gayle",1000000,1);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Employees(NAME,SALARY,DEPARTMENT_ID) VALUES("Michael Clarke",800000,2);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Employees(NAME,SALARY,DEPARTMENT_ID) VALUES("Rahul Dravid",700000,1);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Employees(NAME,SALARY,DEPARTMENT_ID) VALUES("Rickey Ponting",600000,2);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Employees(NAME,SALARY,DEPARTMENT_ID) VALUES("Albie Morkel",650000,2);
--Query OK, 1 row affected (0.01 sec)

INSERT INTO Employees(NAME,SALARY,DEPARTMENT_ID) VALUES("Wasim Akram",750000,3);
--Query OK, 1 row affected (0.00 sec)

SELECT * FROM Employees;
+----+----------------+---------+---------------+
| ID | NAME           | SALARY  | DEPARTMENT_ID |
+----+----------------+---------+---------------+
|  1 | Chris Gayle    | 1000000 |             1 |
|  2 | Michael Clarke |  800000 |             2 |
|  3 | Rahul Dravid   |  700000 |             1 |
|  4 | Rickey Ponting |  600000 |             2 |
|  5 | Albie Morkel   |  650000 |             2 |
|  6 | Wasim Akram    |  750000 |             3 |
+----+----------------+---------+---------------+
6 rows in set (0.00 sec)

CREATE TABLE Commissions(
  ID int(20) AUTO_INCREMENT,
  EMPLOYEE_ID int(20),
  COMMISSION_AMOUNT int(10),
  PRIMARY KEY(ID),
  FOREIGN KEY(EMPLOYEE_ID) REFERENCES Employees(ID)
  );
--Query OK, 0 rows affected (0.40 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(1,5000);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(2,3000);
--Query OK, 1 row affected (0.01 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(3,4000);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(1,4000);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(2,3000);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(4,2000);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(5,1000);
--Query OK, 1 row affected (0.00 sec)

INSERT INTO Commissions(EMPLOYEE_ID,COMMISSION_AMOUNT) VALUES(6,5000);
--Query OK, 1 row affected (0.00 sec)

SELECT * FROM Commissions;
+----+-------------+--------+
| ID | EMPLOYEE_ID | AMOUNT |
+----+-------------+--------+
|  1 |           1 |   5000 |
|  2 |           2 |   3000 |
|  3 |           3 |   4000 |
|  4 |           1 |   4000 |
|  5 |           2 |   3000 |
|  6 |           4 |   2000 |
|  7 |           5 |   1000 |
|  8 |           6 |   5000 |
+----+-------------+--------+
8 rows in set (0.00 sec)

--creating index
CREATE INDEX commissions_amount_index on commissions(amount);
--Query OK, 0 rows affected (0.05 sec)
--Records: 0  Duplicates: 0  Warnings: 0


--Queries

-- Employee who gets highest total commission

SELECT GROUP_CONCAT(employee_commissions.name) AS employee
FROM (
  SELECT e.name, SUM(amount) AS total_commission
  FROM employees AS e
  INNER JOIN commissions AS c
  ON e.id = c.employee_id
  GROUP BY c.employee_id
) AS employee_commissions
GROUP BY total_commission
ORDER BY total_commission DESC
LIMIT 1;

-- Find employee with 4th Highest salary from employee table.

SELECT GROUP_CONCAT(name) AS name
FROM employees
GROUP BY salary
ORDER BY salary DESC
LIMIT 3,1;

-- Find department that is giving highest commission.
SELECT GROUP_CONCAT(departments.name) AS department
FROM departments
INNER JOIN  (
  SELECT e.department_id, SUM(amount) AS total_commission
  FROM employees AS e
  INNER JOIN commissions AS c
  ON e.id = c.employee_id
  GROUP BY e.department_id ) AS department_commissions
ON (departments.id = department_commissions.department_id)
GROUP BY total_commission
ORDER BY total_commission
DESC LIMIT 1;

--Find employees getting commission more than 3000
SELECT GROUP_CONCAT(e.name) AS EMPLOYEES, c.amount
FROM employees AS e
INNER JOIN commissions AS c ON e.id = c.employee_id
GROUP BY c.amount
HAVING c.amount > 3000;
