create database zomato_db;
USE zomato_db;
-- 1. View the Country Map (Zomato_DataC)
SELECT 
    zd.RestaurantName, 
    zd.City, 
    zd_c.Countryname
FROM Zomato_Data zd
LEFT JOIN Zomato_DataC zd_c ON zd.CountryCode = zd_c.CountryID;

-- 2. Build a Calendar Table using Datekey_Opening

CREATE TABLE Calendar_Table AS
SELECT DISTINCT 
    Datekey_Opening AS Datekey,
    YEAR(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Year,
    MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Monthno,
    MONTHNAME(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Monthfullname,
    CONCAT('Q', QUARTER(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d'))) AS Quarter,
    DATE_FORMAT(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d'), '%Y-%b') AS YearMonth,
    DAYOFWEEK(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Weekdayno,
    DAYNAME(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Weekdayname,
    CASE 
        WHEN MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) >= 4 THEN CONCAT('FM', MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) - 3)
        ELSE CONCAT('FM', MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) + 9)
    END AS FinancialMonth,
    CASE 
        WHEN MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) BETWEEN 4 AND 6 THEN 'FQ1'
        WHEN MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) BETWEEN 7 AND 9 THEN 'FQ2'
        WHEN MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) BETWEEN 10 AND 12 THEN 'FQ3'
        ELSE 'FQ4'
    END AS FinancialQuarter
FROM Zomato_Data
WHERE Datekey_Opening IS NOT NULL;

-- 3. Find the Numbers of Restaurants based on City and Country

SELECT 
    zd_c.Countryname, 
    zd.City, 
    COUNT(zd.RestaurantID) AS Number_of_Restaurants
FROM Zomato_Data zd
LEFT JOIN Zomato_DataC zd_c ON zd.CountryCode = zd_c.CountryID
GROUP BY zd_c.Countryname, zd.City
ORDER BY zd_c.Countryname, zd.City;

-- 4. Numbers of Restaurants opening based on Year, Quarter, Month

SELECT 
    YEAR(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Year,
    QUARTER(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Quarter,
    MONTH(STR_TO_DATE(Datekey_Opening, '%Y_%m_%d')) AS Month,
    COUNT(RestaurantID) AS Number_of_Restaurants_Opened
FROM Zomato_Data
WHERE Datekey_Opening IS NOT NULL
GROUP BY Year, Quarter, Month
ORDER BY Year, Quarter, Month;

-- 5. Count of Restaurants based on Average Ratings

SELECT 
    Rating, 
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM Zomato_Data
GROUP BY Rating
ORDER BY Rating DESC;

-- 6. Create buckets based on Average Price 

SELECT 
    CASE 
        WHEN CAST(Average_Cost_for_two AS UNSIGNED) <= 500 THEN '0 - 500 (Low)'
        WHEN CAST(Average_Cost_for_two AS UNSIGNED) > 500 AND CAST(Average_Cost_for_two AS UNSIGNED) <= 1000 THEN '501 - 1000 (Medium)'
        WHEN CAST(Average_Cost_for_two AS UNSIGNED) > 1000 AND CAST(Average_Cost_for_two AS UNSIGNED) <= 2000 THEN '1001 - 2000 (High)'
        ELSE '2000+ (Very High)'
    END AS Price_Bucket,
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM Zomato_Data
GROUP BY Price_Bucket
ORDER BY Price_Bucket;

-- 7. Percentage of Restaurants based on "Has_Table_booking"

SELECT 
    Has_Table_booking,
    COUNT(RestaurantID) AS Total_Restaurants,
    ROUND((COUNT(RestaurantID) * 100.0) / (SELECT COUNT(RestaurantID) FROM Zomato_Data), 2) AS Percentage
FROM Zomato_Data
GROUP BY Has_Table_booking;

-- 8. Percentage of Restaurants based on "Has_Online_delivery"

SELECT 
    Has_Online_delivery,
    COUNT(RestaurantID) AS Total_Restaurants,
    ROUND((COUNT(RestaurantID) * 100.0) / (SELECT COUNT(RestaurantID) FROM Zomato_Data), 2) AS Percentage
FROM Zomato_Data
GROUP BY Has_Online_delivery;

-- 9. Data Preparation for Charts (Cuisines, City, Ratings)

SELECT 
    City, 
    Cuisines, 
    Rating, 
    COUNT(RestaurantID) AS Number_of_Restaurants
FROM Zomato_Data
GROUP BY City, Cuisines, Rating;


SELECT COUNT(*) FROM zomato_db.Zomato_Data;