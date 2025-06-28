-- Drop the table if it already exists
DROP TABLE IF EXISTS employees;

-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    department VARCHAR(50), 
    salary DECIMAL(10, 2) CHECK (salary > 0), 
    joining_date DATE NOT NULL, 
    age INT CHECK (age >= 18)
);

-- Insert data into employees table
INSERT INTO employees (first_name, last_name, department, salary, joining_date, age) 
VALUES
    ('Amit', 'Sharma', 'IT', 60000.00, '2022-05-01', 29), 
    ('Neha', 'Patel', 'HR', 55000.00, '2021-08-15', 32),     
    ('Ravi', 'Kumar', 'Finance', 70000.00, '2020-03-10', 35), 
    ('Anjali', 'Verma', 'IT', 65000.00, '2019-11-22', 28),
    ('Suresh', 'Reddy', 'Operations', 50000.00, '2023-01-10', 26);

SELECT * FROM employees;

-- retrive all employee first name and dept
SELECT first_name, department FROM employees;
-- update salary of all employyes in IT department by increasing by 10 %
UPDATE employees
SET salary = salary + (salary*0.1)
WHERE department = 'IT';
--Delete all employees who are older than 34 yr
DELETE FROM employees
WHERE age>34;
-- Add new column email in table
ALTER TABLE employees
ADD COLUMN email VARCHAR(100);
-- Rename department as dept_name
ALTER TABLE employees
RENAME department TO dept_name;
-- Retrive name of employees who join after jan 1 2021
SELECT * FROM employees
WHERE joining_date > '2021-01-01';
-- Change datatype of salary colum to integer
ALTER TABLE employees
ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER;
-- list all employees with their age and salary in descending order of salary
SELECT first_name, last_name, age, salary FROM employees ORDER BY salary DESC; 
-- Insert a new employee with some details
INSERT INTO employees (first_name, last_name, dept_name, salary, joining_date, age)
VALUES ('Raj','Singh','Marketing','60000','2023-09-15','30');
-- Update age of employee +1 to every employee
UPDATE employees
SET age=age+1;


-- assignment 2 on CASE statement

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

/* Q1) In Stock if quantity is 10 or more
       Limited Stock if quantity is b/w 5 and 9 
       Out of Stock soon if quantity is less than 5
*/

SELECT product_name,quantity,
		CASE
			WHEN quantity >= 10 THEN 'In Stock'
			WHEN quantity >= 5 AND quantity <= 9 THEN 'Limited Stock' --WHEN quantity BETWEEN 5 AND 9 THEN 'Limited Stock'
			ELSE 'Out Of Stock Soon'
		END AS availability FROM products;


SELECT product_name, category,
		CASE
			WHEN category LIKE 'Electronics%' THEN 'Electronic_Item'
			WHEN category LIKE 'Accessories%' THEN 'Accessory_Item'
			ELSE 'Furniture_Item'
		END AS caregory_type FROM products;

SELECT * FROM products;

ALTER TABLE products
ADD COLUMN discount_price NUMERIC(10,2)

UPDATE products
SET discount_price = NULL
WHERE product_name IN('Laptop','Desk');

UPDATE products
SET discount_price = price * 0.9  -- We gives 10 percent discount
WHERE product_name NOT IN('Laptop','Desk');

SELECT product_name,price,
	COALESCE(discount_price, price) AS Final_Price
FROM products;

SELECT product_name, category,price,
		ROW_NUMBER() OVER(PARTITION BY category ORDER BY price DESC) AS row_num
FROM products;


SELECT product_name, category,price,
	DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS row_num
FROM products;

SELECT product_name, category,price,
	SUM(price) OVER(ORDER BY price DESC) AS runnung_total
FROM products;

SELECT product_name, category,price,
	SUM(price) OVER(PARTITION BY category ORDER BY price DESC) AS runnung_total
FROM products;

