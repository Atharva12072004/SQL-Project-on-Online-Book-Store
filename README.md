# SQL-Project-on-Online-Book-Store
The Online Book Store is a database management project that uses SQL to store, manage, and retrieve data related to books, customers, orders and quantity sold 
Here’s a clean and professional **README** file for your **SQL Project on Online Book Store**:

---

# 📚 Online Book Store Management System – SQL Project

## 📌 Project Description

This project is a SQL-based **Online Book Store Management System** that manages books, customers, and orders using relational database concepts. It demonstrates how to structure and query data efficiently to simulate a real-world e-commerce system for selling books.

---
![image](https://github.com/user-attachments/assets/7a4ad79e-5ce0-4132-aded-e26c8106598a)
---

## 🛠 Technologies Used

* **Database:** PostgreSQL
* **Language:** SQL
* **Data Import:** CSV files using `COPY` command
* **File Paths:** Adjusted for local environment (change paths as needed)

---

## 🗃️ Database Schema

### Tables:

1. **Books**

   * Book\_ID (PK)
   * Title
   * Author
   * Genre
   * Published\_Year
   * Price
   * Stock

2. **Customers**

   * Customer\_ID (PK)
   * Name
   * Email
   * Phone
   * City
   * Country

3. **Orders**

   * Order\_ID (PK)
   * Customer\_ID (FK → Customers)
   * Book\_ID (FK → Books)
   * Order\_Date
   * Quantity
   * Total\_Amount

---

## 📥 Data Import

CSV files are imported using the `COPY` command.

> 📍 Make sure the CSV file paths are correctly set to your local environment.

```sql
COPY Books(...) FROM 'C:/.../Books.csv' CSV HEADER;
COPY Customers(...) FROM 'C:/.../Customers.csv' CSV HEADER;
COPY Orders(...) FROM 'C:/.../Orders.csv' CSV HEADER;
```

---

## 🔍 SQL Queries Included

### 📄 Basic Queries

1. Retrieve all books in the "Fiction" genre
2. Find books published after 1950
3. List customers from Canada
4. Show orders placed in November 2023
5. Calculate total stock of books available
6. Find the most expensive book
7. Show orders with quantity > 1
8. Retrieve orders with total amount > \$20
9. List all unique genres
10. Find book with the lowest stock
11. Calculate total revenue

---

### 🧠 Advanced Queries

1. Total books sold per genre
2. Average price of Fantasy books
3. Customers who placed at least 2 orders
4. Most frequently ordered book
5. Top 3 most expensive Fantasy books
6. Total quantity of books sold per author
7. Cities of customers who spent over \$30
8. Customer who spent the most
9. Remaining stock after all orders

---

## 📊 Sample Output

Each query returns meaningful insights like:

* Most sold books
* Revenue stats
* Customer spending behavior
* Inventory tracking

---

## ✅ How to Run

1. Set up PostgreSQL.
2. Create tables using the given SQL.
3. Import CSV data using the `COPY` command.
4. Run the queries as required.

---

## 📌 Notes

* Ensure that PostgreSQL has permission to access the CSV file directory.
* Use `SELECT * FROM table_name;` to verify imported data.

---

## 📁 File Structure

```
📂 SQL Project - Online Book Store/
│
├── Books.csv
├── Customers.csv
├── Orders.csv
├── bookstore_schema.sql
└── bookstore_queries.sql
```

---

## 📧 Author

**Atharva Harane**
SQL Developer & Data Analysis Enthusiast
I also provided my Handwritten notes, practice files, and solved assignments 
Also visit my portfolio website 
https://atharvaharane.netlify.app/
📍 India

---

