# Dimension Table Specification: `Dim_Customer`

## 1. Overview & Purpose
The `Dim_Customer` table deduplicates customer demographic information, enabling segmentation analyses such as purchasing behavior by gender, contact details management, and customer income profiling against vehicle preferences.

* **Table Name:** `Dim_Customer`
* **Table Type:** Dimension Table (Spoke)
* **Grain:** One row per unique customer profile.
* **Primary Key (PK):** `Customer_ID`

---

## 2. Column Schema Definition

| Column Name | Data Type | Key Type | Nullable | Description & Business Rules |
| :--- | :--- | :--- | :--- | :--- |
| **`Customer_ID`** | Text / String | **PK** | No | Unique surrogate identifier assigned to each customer profile. |
| **`Customer_Name`** | Text / String | Attribute | No | Full name of the customer. |
| **`Gender`** | Text / String | Attribute | Yes | Gender classification of the customer (`Male`, `Female`, or unassigned). |
| **`Phone`** | Text / String | Attribute | Yes | Customer contact phone number formatted consistently. |

---

## 3. Relationship Configuration
* **Connected Table:** `Fact_Sales`
* **Relationship Type:** One-to-Many (1 : *)
* **Cardinality Direction:** Single (One-way) filtering from `Dim_Customer` to `Fact_Sales`.
* **Join Key:** `Dim_Customer[Customer_ID] = Fact_Sales[Customer_ID]`