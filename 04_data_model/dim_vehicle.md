# Dimension Table Specification: `Dim_Vehicle`

## 1. Overview & Purpose
The `Dim_Vehicle` table stores descriptive attributes regarding the automobiles sold across dealerships. By extracting these attributes from the raw transactional log into a dedicated dimension table, we eliminate text redundancy, reduce memory consumption in Power BI's VertiPaq engine, and enable clean multi-attribute slicing.

* **Table Name:** `Dim_Vehicle`
* **Table Type:** Dimension Table (Spoke)
* **Grain:** One row per unique vehicle configuration profile.
* **Primary Key (PK):** `Vehicle_ID`

---

## 2. Source-to-Target Mapping
* **Source Fields:** Derived from `staging_car_sales` (`Company`, `Model`, `Engine`, `Transmission`, `Color`, `Body_Style`).
* **Transformation Rule:**
  1. Select distinct combinations of vehicle attributes.
  2. Generate a unique surrogate key (`Vehicle_ID`) using an incremental index or hash function (e.g., `VEH_00001`).
  3. Ensure all text values are trimmed, title-cased, and free of encoding artifacts (e.g., mojibake `Â`).

---

## 3. Column Schema Definition

| Column Name | Data Type | Key Type | Nullable | Description & Business Rules |
| :--- | :--- | :--- | :--- | :--- |
| **`Vehicle_ID`** | Text / String | **PK** | No | Unique surrogate identifier for each vehicle configuration (Format: `VEH_#####`). |
| **`Company`** | Text / String | Attribute | No | Automotive manufacturer (e.g., `Toyota`, `Ford`, `Chevrolet`). |
| **`Model`** | Text / String | Attribute | No | Specific model designation (e.g., `Camry`, `F-150`). |
| **`Engine`** | Text / String | Attribute | Yes | Engine configuration layout (cleaned of mojibake encoding artifacts). |
| **`Transmission`** | Text / String | Attribute | Yes | Transmission type (`Automatic` or `Manual`). |
| **`Color`** | Text / String | Attribute | Yes | Exterior vehicle paint color. |
| **`Body_Style`** | Text / String | Attribute | Yes | Vehicle classification category (e.g., `SUV`, `Sedan`, `Coupe`). |

---

## 4. Relationship Configuration
* **Connected Table:** `Fact_Sales`
* **Relationship Type:** One-to-Many (1 : *)
* **Cardinality Direction:** Single (One-way) filtering from `Dim_Vehicle` to `Fact_Sales`.
* **Join Key:** `Dim_Vehicle[Vehicle_ID] = Fact_Sales[Vehicle_ID]`