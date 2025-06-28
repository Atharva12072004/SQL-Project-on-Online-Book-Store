CREATE TABLE employee(
	employee_id SERIAL primary key,
	name varchar(100) NOT NULL,
	position varchar(50),
	department varchar(50),
	hire_date DATE,
	salary NUMERIC(10,2)
);

SELECT * FROM employee;

INSERT INTO employee(employee_id, emp_name, position, department, hire_date, salary)
	VALUES ('1','Ajit Sharma','DA','DS','2022-03-15',65000.00),
			('2','Aji trma','DA','DS','2022-07-25',75000.00),
			('3','A Sharma','DA','DS','2022-04-5',6000.00),
			('4','Ajit ma','DA','DS','2022-08-1',5000.00);

SELECT * FROM employee;	

ALTER TABLE employee
RENAME COLUMN name TO emp_name;

SELECT * FROM employee;	

TRUNCATE TABLE employee RESTART IDENTITY;
SELECT * FROM employee;	

DELETE FROM employee
WHERE employee_id=3;

ALTER TABLE employee
DROP COLUMN salary;

DROP TABLE employee;
DROP TABLE IF EXISTS employee2;
DROP DATABASE company;
DROP DATABASE IF EXISTS company;

CREATE TABLE events (
	event_id SERIAL PRIMARY KEY,
	event_name VARCHAR(20),
	event_date TIMESTAMP,
	duration INTERVAL
);

INSERT INTO events (event_name, event_date, duration) 
VALUES 
  ('Tech Talk', '2025-07-10 10:00:00','2 hours'),
  ('Hackathon', '2025-07-15 09:00:00','8 hours'),
  ('Workshop', '2025-07-20 14:30:00','3 hours 30 minutes');

SELECT * FROM events;

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(30),
	is_active BOOLEAN
);

INSERT INTO users (username, is_active)
VALUES 
  ('atharva_sharma', TRUE),
  ('priya_kapoor', FALSE),
  ('rahul_verma', TRUE);

SELECT * FROM users;

CREATE TABLE profile (
	user_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE,
	age INT CHECK (age >= 18),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM profile;

INSERT INTO profile (user_id, name, email, age)
VALUES
	(1, 'Atharva Sharma', 'atharva.sharma@example.com', 21),
  (2, 'Priya Kapoor', 'priya.kapoor@example.com', 23),
  (3, 'Rahul Verma', 'rahul.verma@example.com', 25),
  (4, 'Sneha Joshi', 'sneha.joshi@example.com', 22),
  (5, 'Arjun Mehta', 'arjun.mehta@example.com', 24);

-- this is comments in SQL
SELECT user_id FROM profile;

UPDATE profile
SET age=50
WHERE name='Sneha Joshi';
SELECT * FROM profile;

UPDATE profile
SET age=27
WHERE name='Atharva Sharma';
SELECT * FROM profile;

SELECT * FROM PROFILE ORDER BY USER_ID ASC;

update profile
SET age=age+1
WHERE email LIKE '%@example.com';

ALTER TABLE profile
RENAME COLUMN name TO full_name;

ALTER TABLE profile
ALTER COLUMN age TYPE SMALLINT;
SELECT * FROM profile;

ALTER TABLE profile
ALTER COLUMN reg_date SET NOT NULL;
SELECT * FROM PROFILE ORDER BY USER_ID ASC;

ALTER TABLE profile
DROP CONSTRAINT age;

ALTER TABLE profile
ADD CONSTRAINT age CHECK(age>=18);

ALTER TABLE profile
RENAME TO students;

SELECT * FROM students ORDER BY USER_ID ASC;

CREATE TABLE csv_file (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    branch VARCHAR(50),
    age INT CHECK (age >= 17),
    marks DECIMAL(5,2) CHECK (marks >= 0 AND marks <= 100),
    admission_date DATE NOT NULL
);
SELECT * FROM csv_file;

COPY csv_file (student_id, first_name, last_name, branch, age, marks, admission_date)
FROM 'C:\Users\ATHARVA\OneDrive\Desktop\csv_file.csv'
DELIMITER ','
CSV HEADER;


SELECT first_name, last_name, marks, (marks*0.10) AS extra_marks FROM csv_file

SELECT * FROM users;


DROP TABLE IF EXISTS students_2023;
CREATE TABLE students_2023 (
	student_id INT PRIMARY KEY,
	student_name VARCHAR(100),
	course VARCHAR(50)
);

INSERT INTO students_2023 (student_id,student_name, course)
VALUES (1,'Aarav Sharma','Computer Science'),
(2,'Ishita Verma','Mechanical Engineering'),
(3,'Kabir Patel','Electronics'),
(4,'Ananya Desai','Civil Engineering'),
(5,'Rahul Gupta','Computer Science');

SELECT * FROM students_2023;

DROP TABLE IF EXISTS students_2024;
CREATE TABLE students_2024 (
	student_id INT PRIMARY KEY,
	student_name VARCHAR(100),
	course VARCHAR(50)
);

INSERT INTO students_2024 (student_id, student_name, course) 
VALUES 
	(3,'Kabir Patel','Electronics'),
(4,'Ananya Desai','Civil Engineering'),
(6,'Meera Rao','Computer Science'),
(7,'Vikram Singh','Mathematics'),
(8,'Sanya Kapoor','Physics');

SELECT * FROM students_2024;

SELECT student_name, course
FROM students_2023
UNION
SELECT student_name, course
FROM students_2024;  


SELECT student_name, course
FROM students_2023
UNION ALL
SELECT student_name, course
FROM students_2024;

SELECT student_name, course
FROM students_2023
INTERSECT
SELECT student_name, course
FROM students_2024;

SELECT student_name, course
FROM students_2023
EXCEPT
SELECT student_name, course
FROM students_2024;

-- Drop the table if it exists
DROP TABLE IF EXISTS products;

-- Create the table with proper column definitions
CREATE TABLE products (
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(100),
	category VARCHAR(50),
	price NUMERIC(10,2), -- added price column
	quantity INT,
	added_date DATE,
	discount_rate NUMERIC(5,2)
);

-- Insert data
INSERT INTO products (product_name, category, price, quantity, added_date, discount_rate)
VALUES 
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8908.66, 15, '2023-11-20', 12.00),
('Morster', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.58, 5, '2024-02-01', 7.50),
('House', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.09, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

-- View the table
SELECT * FROM products;

SELECT SUM(quantity) AS total_quantity FROM products;

SELECT SUM(quantity) AS quantity_of_ele
FROM products
WHERE category= 'Electronics' AND price > 20000;

SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_phones FROM products
WHERE product_name LIKE  '%phone%';

SELECT AVG(price) AS avg_price FROM products;

SELECT AVG(price) AS avg_price FROM products
WHERE category= 'Accessories' OR added_date > '2024-02-01';

SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM products;

SELECT * FROM products;

SELECT UPPER(category) AS Category_capital FROM products;

SELECT LOWER(category) AS Category_lower FROM products;

SELECT CONCAT(product_name,'-',category) AS product_details FROM products;

SELECT SUBSTRING(product_name, 1,5) AS short_name FROM products;

SELECT product_name,LENGTH(product_name) AS COUNT_OF_CHARACTER FROM products;

SELECT LENGTH(TRIM('  Monitor         ')) AS Trimmed_text;

SELECT REPLACE(product_name,'phone','device') AS updated FROM products;

SELECT LEFT(category, 3) AS left_char FROM products;
SELECT RIGHT (category, 2) AS right_char FROM products;


SELECT NOW() AS CURRENT_DATE_TIME;
SELECT CURRENT_DATE AS today;
SELECT added_date, Current_Date, (CURRENT_DATE-added_date) AS date_difference FROM products;
SELECT product_name,
	EXTRACT (YEAR FROM added_date) AS year_added,
	EXTRACT (MONTH FROM added_date) AS month_added,
	EXTRACT (DAY FROM added_date) AS day_added
FROM products;
SELECT product_name,
	AGE (CURRENT_DATE, added_date) AS age_since_added 
FROM products; 

SELECT AGE(CURRENT_DATE,'2004-06-19') AS achal_age;
SELECT AGE(CURRENT_DATE,'2004-07-12') AS athu_age;

SELECT product_name,
	TO_CHAR(added_date,'DD-Mon-YYYY') AS formatted_date 
FROM products;

SELECT DATE '2004-07-12' - DATE '2004-06-19' AS difference;

SELECT product_name, added_date,
      DATE_PART('DOW', added_date) AS date_of_week
FROM products;

SELECT product_name, added_date,
      DATE_PART('YEAR', added_date) AS date_of_week
FROM products;

SELECT product_name, added_date,
      DATE_PART('MONTH', added_date) AS date_of_week
FROM products;

SELECT product_name,added_date,
       DATE_TRUNC('month',added_date) AS month_start
FROM products;

SELECT product_name,added_date,
	added_date + INTERVAL '6 days' AS new_date
FROM products;

/*SELECT CURRENT_TIME AS current_time;
SELECT TO_DATE('28-11-2024','DD-MM-YYYY') AS coverted_date;
*/  --THIS IS MULTILINE COMMENT

SELECT product_name,price,
	   CASE
			WHEN price >= 50000 THEN 'Expensive'
			WHEN price >= 10000 AND price <= 49999 THEN 'Moderate'
			ELSE 'Affordable'
		END AS price_category FROM products;


CREATE TABLE Employee3 (
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	department_id INT
);
INSERT INTO Employee3 (first_name, last_name, department_id)
VALUES
	('Rahul','Sharma', 101),
	('Priya','Mehta', 102),
	('Ankit','Verma', 103),
	('Simran','Kaur', NULL),
	('Aman','Singh', 101);

SELECT * FROM Employee3;


CREATE TABLE Departments (
	department_id INT PRIMARY KEY,
	department_name VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name)
VALUES
	(101,'Sales'),
	(102,'Marketing'),
	(103,'IT'),
	(104,'HR');

SELECT * FROM Departments;

SELECT e.employee_id, e.first_name, e.last_name, 
	   d.department_id, d.department_name
FROM Employee3 e
INNER JOIN
Departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, e.last_name, 
	   d.department_id, d.department_name
FROM Employee3 e
LEFT JOIN
Departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, e.last_name, 
	   d.department_id, d.department_name
FROM Employee3 e
RIGHT JOIN
Departments d
ON e.department_id = d.department_id;


SELECT e.employee_id, e.first_name, e.last_name, 
	   d.department_id, d.department_name
FROM Employee3 e
FULL OUTER JOIN
Departments d
ON e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, e.last_name, 
	   d.department_id, d.department_name
FROM Employee3 e
RIGHT JOIN
Departments d
ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
FROM Employee3 e
CROSS JOIN
Departments d;

SELECT e1.first_name AS Employee_name1,
	   e2.first_name AS Employee_name2,
	d.department_name
FROM employee3 e1 JOIN employee3 e2
ON e1.department_id = e2.department_id AND e1.employee_id != e2.employee_id 

JOIN
departments d
ON
e1.department_id = d.department_id;

