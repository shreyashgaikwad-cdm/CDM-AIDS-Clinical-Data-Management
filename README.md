# CDM-AIDS-Clinical-Data-Management
Clinical Data Management portfolio project demonstrating data cleaning, validation, query management, SQL, Excel analysis, and clinical data quality checks.

A end-to-end **Clinical Data Management (CDM)** portfolio project on a simulated AIDS clinical trial dataset, covering data cleaning, validation, query management, SQL verification, and a final simulated database lock.

**Protocol:** AIDS-CDM-2026-001 | **Version:** 1.0 | **Author:** Shreyash Gaikwad, B.Pharm | **Use:** Academic only

---

## Project Overview

- **Dataset:** 2,139 subjects, 19 clinical variables, 5 sites (SITE001-SITE005)
- **Design:** Simulated randomised controlled trial with 4 treatment arms
- **Timeline:** 4-week CDM cycle
- **Goal:** Demonstrate a complete, industry-aligned CDM workflow from raw data to database lock

## CDM Workflow

Raw Data → Dirty Data → Validation Checks → Query Log → Cleaned Data → SQL Validation → Final Database

1. **Raw data:** structured into a standard 19-variable format
2. **Dirty data:** 164 controlled errors introduced
3. **Validation checks:** 164 checks (VAL001-VAL164)
4. **Query management:** 164 queries raised and closed (Q001-Q164)
5. **Data cleaning:** imputation, de-duplication, range and coding fixes
6. **SQL validation:** verified in MariaDB using HeidiSQL
7. **Database lock:** all lock criteria met

## Error Categories

| Category | Count | Resolution |
|---|---|---|
| Missing values | 50 | Median imputation |
| Logical errors | 49 | Logical rules re-applied |
| Range errors | 29 | Replaced with valid medians |
| Coding errors | 21 | Recoded to 0/1 standard |
| Duplicate records | 15 | Duplicate rows removed |
| **Total** | **164** | **All resolved** |

## Key Results

- 164/164 queries resolved (**100% resolution rate**), 0 open queries
- Records: 2,154 (with duplicates) → **2,139 clean records**
- Missing values, duplicates, and coding errors in the final dataset: **0**
- Data completeness: **100%**
- Simulated database lock completed on May 26, 2026

## Repository Contents

| File / Folder | Description |
|---|---|
| `PROJECT AIDS DATA.xlsx` | Main project workbook (data, validation, query log, dashboard) |
| `DIRTY AIDS DATA.xlsx` | Dataset with 164 introduced errors |
| `CLEANED AIDS DATA.csv` | Final cleaned and validated dataset |
| `CDM_Final_Report_AIDS_2026.pdf` | Full final report (23 pages) |
| `AIDS_DataValidation_Workflow.pptx` | Presentation of the validation workflow |
| `sql/` | SQL validation scripts |
| `data/` | Supporting data files |

## Tools Used

- **Microsoft Excel:** data entry, validation checks, error simulation, dashboard
- **HeidiSQL + MariaDB:** database validation with SQL queries
- **Python (pandas):** data analysis and statistical verification

## Sample SQL Validation Checks

```sql
-- Duplicate check
SELECT subject_id, COUNT(*) FROM cleaned_data
GROUP BY subject_id HAVING COUNT(*) > 1;

-- Range check (age)
SELECT subject_id, age_years FROM cleaned_data
WHERE age_years < 18 OR age_years > 100;

-- Coding check (gender)
SELECT subject_id, gender_code FROM cleaned_data
WHERE gender_code NOT IN (0, 1);
