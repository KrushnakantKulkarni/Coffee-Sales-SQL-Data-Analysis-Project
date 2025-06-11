# Coffee-Sales-SQL-Data-Analysis-Project
This repository contains SQL-based analysis on a coffee sales dataset. The purpose of the project is to explore sales, revenue, population-based insights, and customer behavior using structured SQL queries across multiple tables.
🗂️ Table of Contents
📌 Overview

🧮 Database Schema

📋 Business Questions Solved

📦 Dataset Structure

🔧 SQL Queries

🚀 Getting Started

📎 License

📌 Overview
This project provides in-depth insights into coffee consumption across cities by analyzing:

Customer behavior

Sales patterns

Product demand

City-level demographics

Quarterly revenue generation

🧮 Database Schema
The analysis uses the following four relational tables:

city

| Column Name     | Data Type   | Description              |
| --------------- | ----------- | ------------------------ |
| city\_id        | INT (PK)    | Unique ID for city       |
| city\_name      | VARCHAR(15) | Name of the city         |
| population      | BIGINT      | Population of the city   |
| estimated\_rent | FLOAT       | Average rent in the city |
| city\_rank      | INT         | Rank of the city         |

customers

| Column Name    | Data Type   | Description            |
| -------------- | ----------- | ---------------------- |
| customer\_id   | INT (PK)    | Unique ID for customer |
| customer\_name | VARCHAR(25) | Name of the customer   |
| city\_id       | INT (FK)    | Links to city table    |

products

| Column Name   | Data Type   | Description           |
| ------------- | ----------- | --------------------- |
| product\_id   | INT (PK)    | Unique ID for product |
| product\_name | VARCHAR(35) | Coffee product name   |
| price         | FLOAT       | Price of the product  |

sales

| Column Name  | Data Type | Description                |
| ------------ | --------- | -------------------------- |
| sale\_id     | INT (PK)  | Unique sale transaction ID |
| sale\_date   | DATE      | Date of the sale           |
| product\_id  | INT (FK)  | Links to products table    |
| customer\_id | INT (FK)  | Links to customers table   |
| total        | FLOAT     | Total sale amount          |
| rating       | INT       | Customer rating (1-5)      |


📋 Business Questions Solved
📊 Count of coffee consumers (25% of city population)

💰 Total revenue generated in Q4 of 2023

☕ Sales count for each coffee product

🏙️ Average sales amount per customer by city

🌆 Population vs. estimated coffee consumers by city

📦 Dataset Structure
Relational Structure: 4 connected tables using foreign keys

Synthetic/Realistic Sample: Cities, Customers, Products, and Sales data

Key Focus Areas: Quarterly performance, product demand, customer engagement

🔧 SQL Queries
All queries are written in standard SQL syntax, designed for compatibility with PostgreSQL, MySQL, and SQLite (minor changes may apply).

Data exploration includes:

NULL checks

Joins and aggregations

Date-based filtering (quarter, year)

City-level breakdowns

