USE aw_quality;
-- 1. Show all data columns and rows in the table
SELECT*FROM airwater_data;

-- 2. Show city, air quality and water pollution columns only
SELECT City, AirQuality, WaterPollution FROM airwater_data;

-- 3. Selecting city and country which have highest value of air quality index (bad air quality)
SELECT City, Country, AirQuality FROM airwater_data
ORDER BY AirQuality DESC LIMIT 1;

-- 4. Selecting area with good air quality but high water pollution
SELECT * FROM airwater_data WHERE AirQuality < 50
AND WaterPollution BETWEEN 51 AND 100;

-- 5. Calculate the average of air quality in each country
SELECT Country, AVG(AirQuality) AS "Average AirQuality"
FROM airwater_data
GROUP BY Country;

-- 6. Show top 5 country with high water pollution & high air quality
SELECT Country, AVG(WaterPollution) AS "Avg Water Pollution", AVG(AirQuality) AS "Avg Air Quality" 
FROM airwater_data 
WHERE WaterPollution > 75 AND AirQuality > 50
GROUP BY Country LIMIT 5;

-- 7. Delete Country rows that has 0 air quality value
DELETE FROM airwater_data WHERE AirQuality = 0 AND WaterPollution = 0;
SELECT * FROM airwater_data;

-- 8. Selecting top 5 country that have good air quality
SELECT Country, AVG(AirQuality) AS "Avg AirQuality" FROM airwater_data
WHERE AirQuality < 50
GROUP BY Country LIMIT 5;

-- 9. Show air quality and water pollution index of all city in Indonesia country
SELECT City, Country, AirQuality, WaterPollution
FROM airwater_data WHERE Country LIKE '%Indonesia%';

-- 10. List the cities that has high value to low value air quality index in Indonesia
SELECT City, Region, Country, AirQuality FROM airwater_data
WHERE Country LIKE '%Indonesia%'
ORDER BY AirQuality DESC;

