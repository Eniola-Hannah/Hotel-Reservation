CREATE DATABASE Hotel_Reservation;
USE Hotel_Reservation;

RENAME TABLE `hotel reservation dataset` TO hotel_reservation_dataset;

SELECT * FROM hotel_reservation_dataset;

-- 1. What is the total number of reservations in the dataset?  
SELECT COUNT(*) AS total_reservations FROM hotel_reservation_dataset;

-- 2. Which meal plan is the most popular among guests?  
SELECT type_of_meal_plan, COUNT(type_of_meal_plan) AS most_popular_meal_plan FROM hotel_reservation_dataset
WHERE booking_status = "Not_Canceled" GROUP BY type_of_meal_plan ORDER BY most_popular_meal_plan DESC LIMIT 1;

-- 3. What is the average price per room for reservations involving children?  
SELECT CONCAT("$", round(avg(avg_price_per_room), 2)) AS avg_price_per_room FROM hotel_reservation_dataset
WHERE no_of_children != 0;

-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?  
SET SQL_SAFE_UPDATES = 0;

UPDATE hotel_reservation_dataset
SET arrival_date = STR_TO_DATE(arrival_date, "%d-%m-%YYYY");
ALTER TABLE hotel_reservation_dataset
MODIFY COLUMN arrival_date DATE;

ALTER TABLE hotel_reservation_dataset
ADD COLUMN Reservation_Date DATE;
UPDATE hotel_reservation_dataset
SET Reservation_Date = DATE_SUB(arrival_date, INTERVAL lead_time DAY);

-- Number of reservation in 2017 using the left string method
SELECT YEAR(Reservation_Date) AS year_2017, COUNT(Reservation_Date) AS reservation FROM hotel_reservation_dataset
WHERE LEFT(Reservation_Date, 4) = 2017
GROUP BY YEAR(Reservation_Date);

-- Number of reservation in 2018 using the Year method in DateTime
SELECT YEAR(Reservation_Date) AS year_2018, COUNT(Reservation_Date) AS reservations FROM hotel_reservation_dataset
WHERE YEAR(Reservation_Date) = 2018
GROUP BY YEAR(Reservation_Date);

-- 5. What is the most commonly booked room type?  
SELECT room_type_reserved, COUNT(room_type_reserved) AS total_reservations FROM hotel_reservation_dataset
GROUP BY room_type_reserved ORDER  BY total_reservations DESC LIMIT 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT COUNT(no_of_weekend_nights) AS weekend_reservation FROM hotel_reservation_dataset
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?  
SELECT MAX(lead_time) AS highest_leadtime, MIN(lead_time) AS lowest_leadtime FROM hotel_reservation_dataset;

-- 8. What is the most common market segment type for reservations?  
SELECT market_segment_type, COUNT(market_segment_type) AS common_market_segment FROM hotel_reservation_dataset
GROUP BY market_segment_type ORDER  BY common_market_segment DESC LIMIT 1;

-- 9. How many reservations have a booking status of "Confirmed"?  
SELECT COUNT(booking_status) AS confirmed_booking_status FROM hotel_reservation_dataset
WHERE booking_status = "Not_Canceled";

-- 10. What is the total number of adults and children across all reservations?  
SELECT SUM(no_of_adults) AS Total_no_adult, SUM(no_of_children) AS Total_no_choldren, SUM(no_of_adults + no_of_children) AS Total_Adult_and_Children FROM hotel_reservation_dataset;

-- 11. What is the average number of weekend nights for reservations involving children?  
SELECT ROUND(AVG(no_of_weekend_nights), 2) AS avg_weekend_nights FROM hotel_reservation_dataset
WHERE no_of_children > 0;

-- 12. How many reservations were made in each month of the year? 
SELECT MONTH(Reservation_Date) AS mnt_number, MONTHNAME(Reservation_Date) AS mnt_name, COUNT(Reservation_Date) FROM hotel_reservation_dataset
GROUP BY mnt_name, mnt_number
ORDER BY mnt_number;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
SELECT room_type_reserved,  ROUND(AVG(no_of_week_nights + no_of_weekend_nights), 2) AS avg_number_of_nights FROM hotel_reservation_dataset
WHERE booking_status= "Not_Canceled"
GROUP BY room_type_reserved ORDER BY avg_number_of_nights;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 
SELECT room_type_reserved, COUNT(room_type_reserved) AS total_reservation, CONCAT("$", ROUND(AVG(avg_price_per_room), 2)) AS avg_price
FROM hotel_reservation_dataset
WHERE no_of_children > 0
GROUP BY room_type_reserved ORDER BY total_reservation DESC LIMIT 1;

-- 15. Find the market segment type that generates the highest average price per room.  
SELECT market_segment_type, CONCAT("$", ROUND(AVG(avg_price_per_room), 2)) AS highest_avg_price FROM hotel_reservation_dataset
GROUP BY market_segment_type
ORDER BY highest_avg_price DESC LIMIT 1;

SELECT * FROM hotel_reservation_dataset;