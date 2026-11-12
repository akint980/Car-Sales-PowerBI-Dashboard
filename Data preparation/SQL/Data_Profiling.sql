-- 1. Check Row Count and Completeness
SELECT 
    COUNT(*) AS Total_Rows,
    COUNT("Car_id") AS Non_Null_Car_Ids,
    COUNT(DISTINCT "Car_id") AS Unique_Car_Ids
FROM Car_Sales;

-- 2. Profile Numerical Extremes (Income & Price)
SELECT 
    MIN("Price ($)") AS Min_Price,
    MAX("Price ($)") AS Max_Price,
    AVG("Price ($)") AS Avg_Price,
    MIN("Annual Income" ) AS Min_Income,
    MAX("Annual Income" ) AS Max_Income,
    AVG("Annual Income") AS Avg_Income
FROM Car_Sales;

-- 3. Identify Potential Encoding Artifacts / Special Characters
SELECT "Car_id", "Engine"
FROM Car_Sales 
WHSELECT DISTINCT "Engine"
FROM Car_Sales WHERE "Engine" LIKE '%Â';

-- 4. Check Category Distributions (e.g., Gender & Transmission)
SELECT "Gender", COUNT(*) AS Count
FROM Car_Sales
GROUP BY "Gender";
