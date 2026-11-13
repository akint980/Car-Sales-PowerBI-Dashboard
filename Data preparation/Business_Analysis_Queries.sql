--Purpose: Runs baseline exploratory queries to cross-verify sales aggregations before building the Power BI star schema and DAX measures.
-- 1. Total Sales and Revenue by Vehicle Company (Maker)
SELECT 
    "Company",
    COUNT("Car_id") AS Total_Cars_Sold,
    SUM("Price ($)") AS Total_Revenue,
    ROUND(AVG("Price ($)"), 2) AS Average_Car_Price
FROM Car_sales
GROUP BY "Company"
ORDER BY Total_Revenue DESC;

-- 2. Sales Performance by Dealer Region
SELECT 
    "Dealer_Region",
    COUNT("Car_id") AS Units_Sold,
    SUM("Price ($)") AS Regional_Revenue,
    ROUND(AVG("Annual Income"), 2) AS Avg_Customer_Income
FROM Car_sales
GROUP BY "Dealer_Region"
ORDER BY Regional_Revenue DESC;

-- 3. Revenue Breakdown by Body Style and Transmission
SELECT 
    "Body_Style",
    "Transmission",
    COUNT("Car_id") AS Units_Sold,
    SUM("Price ($)") AS Total_Revenue
FROM Car_sales
GROUP BY "Body_Style", "Transmission"
ORDER BY "Body_Style", Total_Revenue DESC;,

-- 4. Top 5 Best-Selling Dealers by Total Revenue
SELECT 
    "Dealer_Name",
    "Dealer_Region",
    COUNT("Car_id") AS Cars_Sold,
    SUM("Price ($)") AS Total_Revenue
FROM Car_sales
GROUP BY "Dealer_Name","Dealer_Region"
ORDER BY Total_Revenue desc
limit 5;