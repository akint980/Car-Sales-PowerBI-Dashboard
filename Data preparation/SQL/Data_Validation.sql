
-- 1. Table Volume & Completeness Check

SELECT 
    "Car_id", 
    COUNT(*) AS duplicate_count
FROM car_sales
GROUP BY "Car_id"
HAVING COUNT(*) > 1;


-- 2. Identify Invalid or Zero Pricing
SELECT 
    "Car_id", 
    "Date", 
    "Company", 
    "Model", 
    "Price ($)"
FROM car_sales
WHERE "Price ($)" IS NULL OR "Price ($)" <= 0;

SELECT 
    COUNT(CASE WHEN "Price ($)" = 0 THEN 1 END) AS Zero_Price_Count,
    COUNT(CASE WHEN "Price ($)" < 0 THEN 1 END) AS Negative_Price_Count
FROM Car_Sales;

-- 3. Detect Uncleaned Text Encoding Artifacts ('Â' check)
SELECT 
    "Car_id",
    "Engine",
    "Transmission",
    "Color"
FROM car_sales
WHERE "Engine" LIKE '%Â%' 
   OR "Transmission" LIKE '%Â%' 
   OR "Color" LIKE '%Â%';

- 4. Verify Date Range Coverage
SELECT 
    MIN("Date") AS earliest_sale,
    MAX("Date") AS latest_sale,
    COUNT(*) AS total_transactions
FROM car_sales;

-- 5. Quick Revenue Breakdown by Region / Category
SELECT 
    "Dealer_Region",
    COUNT("Car_id") AS total_units_sold,
    SUM("Price ($)") AS total_revenue,
    AVG("Price ($)") AS average_sale_price
FROM Car_sales
GROUP BY "Dealer_Region" 
ORDER BY total_revenue DESC;