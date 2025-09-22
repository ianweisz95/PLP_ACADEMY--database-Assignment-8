Library Management System Database

Overview
This repository contains the MySQL database schema for a Library Management System developed to fulfill the requirements of building a complete database management system.

The database manages essential entities such as Authors, Categories (Genres), Books, Library Members, Librarians, and Borrowing (Loan) records. It enforces proper relational integrity through structured tables, keys, and constraints to ensure reliability and data consistency.

Features
Well-organized relational schema with clearly defined primary keys and foreign keys

Relationship constraints implementing realistic one-to-many and many-to-many associations

Data validation using NOT NULL, UNIQUE, and CHECK constraints

Default values for date fields using CURRENT_DATE expressions (requires MySQL 8.0.13+)

Sample Kenyan context in the data to reflect real-world local authors, places, and contacts

Files Included
library_management.sql — A single SQL script containing all database creation statements, including tables, constraints, and relationships.

Sample data is included within the same SQL file to facilitate testing and demonstration.

How to Run
Ensure MySQL Server version 8.0.13 or higher is installed on your machine.

Clone or download this repository.

Import the database schema and sample data by running:

bash
mysql -u [username] -p < library_management.sql
Log into MySQL and use the database:

bash
mysql -u [username] -p
USE LibraryManagement;
Run queries to verify:

sql
SELECT * FROM Books;
SELECT * FROM Members;
Notes
The database uses DATE columns with default values set to the current date via (CURRENT_DATE), which requires MySQL version 8.0.13 or later.

Foreign key constraints ensure data integrity, for example, preventing deletion of referenced authors or categories.

The Borrowing table models the many-to-many relationship between Books and Members, tracking loan dates and returns.
