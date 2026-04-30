# ETL Testing SQL Validation Portfolio

## Overview
This repository contains SQL queries used for validating ETL processes and data warehouse systems.

## Key Validations Covered
- Source vs Target Data Comparison
- Record Count Validation
- Null & Duplicate Checks
- Data Integrity & Referential Validation
- Transformation Logic Testing
- SCD Type 2 Validation

## Tools & Technologies
- SQL Server
- Snowflake (Basic)
- ETL Testing Concepts
- Data Warehouse (DWH)

## Domain
- Banking & Telecom

## File Included
- SQL_Queries.sql → Contains all validation queries

- -- Banking: High-value transaction validation
SELECT *
FROM transactions_target
WHERE amount > 1000000;

## Author
Vijay – ETL Test Engineer
