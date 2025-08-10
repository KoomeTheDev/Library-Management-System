# Library Management System

## Project Title
Library Management System - Relational Database Design and Implementation using MySQL

## Description
This project implements a robust relational database schema for managing a library’s core operations. It handles data related to books, authors, members, and loan transactions. The schema demonstrates key database concepts such as:

- Proper table design with constraints (primary keys, foreign keys, unique, not null)
- Modeling relationships including one-to-many and many-to-many using junction tables
- Enforcing data integrity through constraints and cascading actions
- Tracking book loans with due dates and return dates for library members

This database is designed to be the backend foundation for a full-fledged library management application or as an educational tool to practice advanced SQL.

## How to Set Up / Run

1. Ensure you have MySQL installed on your system.
2. Open your MySQL client (e.g., MySQL Workbench, phpMyAdmin, or command line).
3. Import or run the SQL script `library_management_system.sql` located in this repository:
   ```bash
   mysql -u your_username -p your_database_name < library_management_system.sql
