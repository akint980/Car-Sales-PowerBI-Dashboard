# Dimension Table Specification: `Dim_Dealer`

## 1. Overview & Purpose
The `Dim_Dealer` table organizes dealership locations and administrative territories, allowing regional sales comparison and top-performing store tracking.

* **Table Name:** `Dim_Dealer`
* **Table Type:** Dimension Table (Spoke)
* **Grain:** One row per unique dealership location.
* **Primary Key (PK):** `Dealer_No`

---

## 2. Column Schema Definition

| Column Name | Data Type | Key Type | Nullable | Description & Business Rules |
| :--- | :--- | :--- | :--- | :--- |
| **`Dealer_No`** | Text / String | **PK** | No | Unique dealership identification number / store code. |
| **`Dealer_Name`** | Text / String | Attribute | No | Formal business name or branch title of the dealership. |
| **`Dealer_Region`** | Text / String | Attribute | No | Geographic sales region or territory (e.g., `North`, `South`, `East`, `West`). |

---

## 3. Relationship Configuration
* **Connected Table:** `Fact_Sales`
* **Relationship Type:** One-to-Many (1 : *)
* **Cardinality Direction:** Single (One-way) filtering from `Dim_Dealer` to `Fact_Sales`.
* **Join Key:** `Dim_Dealer[Dealer_No] = Fact_Sales[Dealer_No]`