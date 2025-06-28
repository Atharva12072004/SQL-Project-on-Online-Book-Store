-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'C:\Users\ATHARVA\OneDrive\Desktop\All Excel Practice Files\Books.csv'
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'C:\Users\ATHARVA\OneDrive\Desktop\All Excel Practice Files\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'C:\Users\ATHARVA\OneDrive\Desktop\All Excel Practice Files\Orders.csv'
CSV HEADER;


-- 1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Books
WHERE genre = 'Fiction';



-- 2) Find books published after the year 1950:
SELECT * FROM Books
WHERE Published_Year > 1950;


-- 3) List all customers from the Canada:
SELECT * FROM Customers
WHERE Country = 'Canada';



-- 4) Show orders placed in November 2023:
SELECT * FROM Orders
WHERE Order_Date >= '2023-11-01' AND Order_Date <= '2023-11-30';



-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) FROM Books AS total_stock;





-- 6) Find the details of the most expensive book:
SELECT * FROM Books ORDER BY price DESC LIMIT 1;



-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE Quantity > 1;




-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders
WHERE total_amount > 20;




-- 9) List all genres available in the Books table:
SELECT DISTINCT(genre) FROM Books AS list_genres;


-- 10) Find the book with the lowest stock:
SELECT * FROM Books ORDER BY stock ASC LIMIT 1;


-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) FROM Orders AS total_revenue;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
SELECT b.genre, SUM(o.quantity) AS total_book_sold
FROM Orders o
INNER JOIN Books b ON o.book_id=b.book_id
GROUP BY b.genre;


-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS avg_price FROM Books 
WHERE genre = 'Fantasy';


-- 3) List customers who have placed at least 2 orders:
SELECT c.Customer_id, c.name, o.quantity
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.Customer_id
WHERE o.quantity > 2;



-- 4) Find the most frequently ordered book:
SELECT o.book_id, b.title, COUNT(o.order_id) AS frequent_book 
FROM orders o
INNER JOIN books b ON o.book_id = b.book_id
GROUP BY o.book_id, b.title
ORDER BY frequent_book DESC LIMIT 1; 

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT book_id, title, genre, price
FROM books
WHERE genre = 'Fantasy'
ORDER BY price DESC LIMIT 3;



-- 6) Retrieve the total quantity of books sold by each author:


SELECT b.author, SUM(o.quantity) AS total_quantity_sold
FROM books b
INNER JOIN orders o ON b.book_id = o.book_id
GROUP BY b.author;


-- 7) List the cities where customers who spent over $30 are located:
SELECT c.name, c.city, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.total_amount > 30
ORDER BY o.total_amount ASC;


-- 8) Find the customer who spent the most on orders:
SELECT c.name, c.phone, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.total_amount DESC LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS total_orders_quantity, 
	b.stock - COALESCE(SUM(o.quantity),0) AS remainning_stock 
FROM books b
LEFT JOIN orders o ON b.book_id = o.book_id
GROUP BY b.book_id
ORDER BY b.book_id ASC;




