📚 Library Management System Database
Overview

This repository contains the MySQL database schema for a Library Management System, developed to meet the requirements of building a complete database management system.

The database manages key entities such as Authors, Categories (Genres), Books, Library Members, Librarians, and Borrowing Records. It enforces proper relational integrity through well-structured tables, primary/foreign keys, and constraints to ensure reliability and data consistency.

Features

Organized relational schema with clearly defined PRIMARY KEY and FOREIGN KEY constraints

One-to-Many and Many-to-Many relationships accurately modeled

Data validation using NOT NULL, UNIQUE, and CHECK constraints

Automatic date tracking with CURRENT_DATE (requires MySQL 8.0.13+)

Sample Kenyan context in data for realistic local relevance

Files Included

library_management.sql – Single SQL script containing:

Database creation statement

Table definitions

Relationship constraints

Sample data for testing and demonstration

How to Run

Prerequisites:

Install MySQL Server version 8.0.13+

Setup:
Clone or download this repository, then import the schema and data:

mysql -u [username] -p < library_management.sql


Access Database:
Log into MySQL and use the database:

mysql -u [username] -p
USE LibraryManagement;


Verify with Sample Queries:

SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrowing;

Notes

Requires MySQL 8.0.13+ for CURRENT_DATE default values.

Foreign key constraints maintain integrity, preventing accidental deletion of referenced records.

The Borrowing table models a many-to-many relationship between Members and Books, tracking loan and return dates.
