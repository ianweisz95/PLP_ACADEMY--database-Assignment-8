Library Management System Database
Overview
This repository contains the MySQL database schema for a Library Management System designed as to build a complete database management system.

The database manages key entities such as Authors, Categories (Genres), Books, Library Members, Librarians, and Borrowing (Loan) records. It enforces proper relationships and constraints to ensure data integrity and reliability.

Features
Well-structured relational schema with appropriate primary keys and foreign keys

Relationship constraints implementing one-to-many and many-to-many associations

Data validation using NOT NULL, UNIQUE, and CHECK constraints

Default values for dates using CURRENT_DATE for date fields (MySQL 8.0.13+)

Sample Kenyan context used in sample data (authors, places, contacts)

Files included
library_management.sql — SQL script containing all database creation statements including tables, constraints, and relationships.

sample_data.sql — SQL script with sample Kenyan-based data inserts to test the schema. 
both are combine into one.

How to Run
Ensure you have MySQL Server version 8.0.13 or higher installed.

Clone or download this repository.

Import the database schema:

bash
mysql -u [username] -p < library_management.sql
(Optional) Insert sample data:

bash
mysql -u [username] -p LibraryManagement < sample_data.sql
Connect to the MySQL server and use the database:

bash
mysql -u [username] -p
USE LibraryManagement;
Query tables to verify:

sql
SELECT * FROM Books;
SELECT * FROM Members;
Note:
The schema uses DATE columns with default values set to the current date using (CURRENT_DATE), which requires MySQL 8.0.13 or later.

Foreign key constraints are designed to maintain integrity, for example, when authors or categories are deleted.

The Borrowing table models the many-to-many relationship between Books and Members with Loan date tracking.
