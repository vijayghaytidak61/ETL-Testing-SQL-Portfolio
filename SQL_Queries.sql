/* =========================================================
   PROJECT: ETL Testing SQL Validation Queries
   AUTHOR: Vijay
   DESCRIPTION:
   This script contains SQL queries used for validating
   ETL processes including data quality, integrity,
   transformation, and consistency checks.
   ========================================================= */

/* ===============================
   1. Record Count Validation
   =============================== */
SELECT COUNT(*) AS source_count FROM source_table;
SELECT COUNT(*) AS target_count FROM target_table;

/* ===============================
   2. Source vs Target Comparison
   =============================== */
SELECT s.*
FROM source_table s
LEFT JOIN target_table t
ON s.id = t.id
WHERE t.id IS NULL;

/* ===============================
   3. Duplicate Check
   =============================== */
SELECT id, COUNT(*) AS duplicate_count
FROM target_table
GROUP BY id
HAVING COUNT(*) > 1;

/* ===============================
   4. NULL Value Check
   =============================== */
SELECT *
FROM target_table
WHERE important_column IS NULL;

/* ===============================
   5. Data Type Validation
   =============================== */
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'target_table';

/* ===============================
   6. Primary Key Integrity
   =============================== */
SELECT id, COUNT(*) AS pk_violation
FROM target_table
GROUP BY id
HAVING COUNT(*) > 1;

/* ===============================
   7. Aggregate Validation
   =============================== */
SELECT SUM(amount) AS source_total FROM source_table;
SELECT SUM(amount) AS target_total FROM target_table;

/* ===============================
   8. Date Range Validation
   =============================== */
SELECT *
FROM target_table
WHERE transaction_date < '2024-01-01'
   OR transaction_date > GETDATE();

/* ===============================
   9. Referential Integrity Check
   =============================== */
SELECT t.*
FROM target_table t
LEFT JOIN reference_table r
ON t.ref_id = r.ref_id
WHERE r.ref_id IS NULL;

/* ===============================
   10. Transformation Validation
   =============================== */
-- Example: Salary Increment Validation (10%)
SELECT id, salary, salary * 1.10 AS expected_salary
FROM source_table;

/* ===============================
   11. Trim & Data Cleanliness Check
   =============================== */
SELECT *
FROM target_table
WHERE column_name <> LTRIM(RTRIM(column_name));

/* ===============================
   12. Negative Value Check
   =============================== */
SELECT *
FROM target_table
WHERE amount < 0;

/* ===============================
   13. Sample Data Validation
   =============================== */
SELECT TOP 10 *
FROM target_table;

/* ===============================
   14. Data Consistency Check
   =============================== */
SELECT s.id, s.name AS source_name, t.name AS target_name
FROM source_table s
JOIN target_table t
ON s.id = t.id
WHERE s.name <> t.name;

/* ===============================
   15. SCD Type 2 Validation
   =============================== */
SELECT *
FROM dimension_table
WHERE current_flag = 'Y'
AND end_date IS NOT NULL;

/* ===============================
   16. Banking Use Case Validation
   =============================== */
-- Check invalid transactions
SELECT *
FROM transactions_target
WHERE amount <= 0;

/* ===============================
   END OF FILE
   =============================== */