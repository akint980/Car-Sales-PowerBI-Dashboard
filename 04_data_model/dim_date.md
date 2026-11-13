# Dimension Table Specification: `Dim_Date`

## 1. Overview & Purpose
The `Dim_Date` table provides a standardized calendar framework spanning the entire date range of the dataset. It enables robust time intelligence calculations (such as Year-to-Date, Month-over-Month growth, and rolling averages) in Power BI DAX.

* **Table Name:** `Dim_Date`
* **Table Type:** Dimension Table (Spoke)
* **Grain:** One row per calendar day.
* **Primary Key (PK):** `Date_ID`

---

## 2. Column Schema Definition

| Column Name | Data Type | Key Type | Nullable | Description & Business Rules |
| :--- | :--- | :--- | :--- | :--- |
| **`Date_ID`** | Integer | **PK** | No | Unique surrogate key formatted as `YYYYMMDD` (e.g., `20230115`). |
| **`Full_Date`** | Date | Attribute | No | Standard calendar date (`YYYY-MM-DD`). |
| **`Year`** | Integer | Attribute | No | Calendar year (e.g., `2023`, `2024`). |
| **`Quarter`** | Text / Integer | Attribute | No | Fiscal or calendar quarter designation (e.g., `Q1`, `Q2`). |
| **`Month_Name`** | Text / String | Attribute | No | Full name of the calendar month (e.g., `January`, `February`). |
| **`Day_Name`** | Text / String | Attribute | No | Name of the day of the week (e.g., `Monday`, `Tuesday`). |

---

## 3. Relationship Configuration
* **Connected Table:** `Fact_Sales`
* **Relationship Type:** One-to-Many (1 : *)
* **Cardinality Direction:** Single (One-way) filtering from `Dim_Date` to `Fact_Sales`.
* **Join Key:** `Dim_Date[Date_ID] = Fact_Sales[Date_ID]`