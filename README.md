📚 Library Management System Database
📖 Overview

This repository contains a MySQL database schema for a Library Management System, created as part of a full database management system project.

The database models the core operations of a library, including managing Authors, Categories (Genres), Books, Library Members, Librarians, and Borrowing Records. It enforces data integrity through proper constraints and relationships.

✨ Features

Well-structured relational schema with proper PRIMARY KEY and FOREIGN KEY constraints.

One-to-Many and Many-to-Many relationships implemented (e.g., Books–Categories, Members–Books).

Data validation with NOT NULL, UNIQUE, and CHECK constraints.

Default date values using CURRENT_DATE (MySQL 8.0.13+).

Kenyan context in sample data (authors, locations, contacts).

📂 Files Included

library_management.sql – Contains all database creation statements (tables, constraints, relationships, and sample data).

✅ Both schema and sample data are combined into a single SQL file for easy execution.

🚀 How to Run
1️⃣ Prerequisites

MySQL Server 8.0.13 or higher

2️⃣ Setup Steps

Clone or download this repository:

git clone https://github.com/your-username/library-management-system-db.git
cd library-management-system-db


Import the schema and data:

mysql -u [username] -p < library_management.sql


Connect to MySQL and select the database:

mysql -u [username] -p
USE LibraryManagement;


Run sample queries to verify:

SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrowing;

📝 Note:

MySQL Version: The schema uses CURRENT_DATE as a default value, which requires MySQL 8.0.13+.

Data Integrity: Foreign key constraints ensure cascading rules (e.g., deleting a Category does not leave orphaned Books).

Borrowing Table: Implements the many-to-many relationship between Books and Members, tracking loan dates and return status.
