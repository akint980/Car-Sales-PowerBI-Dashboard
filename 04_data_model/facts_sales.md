# Fact Table Specification: `Fact_Sales`

## 1. Overview & Purpose
The `Fact_Sales` table sits at the center of the star schema hub-and-spoke model. It captures the numerical and transactional grain of car sales, storing quantitative measures alongside foreign keys that link back to each descriptive dimension.

* **Table Name:** `Fact_Sales`
* **Table Type:** Fact Table (Hub)
* **Grain:** One row per individual vehicle sale transaction.
* **Primary Key (PK):** `Sale_ID` (Derived from raw `Car_id`)

---

## 2. Column Schema Definition

| Column Name | Data Type | Key Type | Nullable | Description & Business Rules |
| :--- | :--- | :--- | :--- | :--- |
| **`Sale_ID`** | Text / String | **PK** | No | Unique transaction identifier for each car sale (mapped from `Car_id`). |
| **`Date_ID`** | Integer / Text | **FK** | No | Foreign key linking to `Dim_Date` (Format: `YYYYMMDD` or surrogate index). |
| **`Customer_ID`** | Text / String | **FK** | No | Foreign key linking to `Dim_Customer` representing the buyer. |
| **`Vehicle_ID`** | Text / String | **FK** | No | Foreign key linking to `Dim_Vehicle` identifying the vehicle configuration. |
| **`Dealer_No`** | Text / String | **FK** | No | Foreign key linking to `Dim_Dealer` specifying the selling dealership. |
| **`Price`** | Currency / Decimal | Measure | No | Final transactional sale price of the vehicle ($0/invalid values cleaned). |
| **`Annual_Income`** | Currency / Decimal | Measure | Yes | Reported annual income of the purchasing customer at the time of sale. |

---

## 3. Relationships to Dimensions
* **`Fact_Sales[Date_ID]`** -> `Dim_Date[Date_ID]` (* : 1)
* **`Fact_Sales[Customer_ID]`** -> `Dim_Customer[Customer_ID]` (* : 1)
* **`Fact_Sales[Vehicle_ID]`** -> `Dim_Vehicle[Vehicle_ID]` (* : 1)
* **`Fact_Sales[Dealer_No]`** -> `Dim_Dealer[Dealer_No]` (* : 1)