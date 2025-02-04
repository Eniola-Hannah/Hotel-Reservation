CREATE DATABASE Hotel_Reservation;
USE Hotel_Reservation;

RENAME TABLE `hotel reservation dataset` TO hotel_reservation_dataset;

SELECT * FROM hotel_reservation_dataset;

-- 1. What is the total number of reservations in the dataset?  
SELECT COUNT(Booking_ID) AS total_reservations FROM hotel_reservation_dataset;

-- 2. Which meal plan is the most popular among guests?  
SELECT MAX(type_of_meal_plan) FROM hotel_reservation_dataset;     -- 'Not selected' has the highest count.

SELECT MAX(type_of_meal_plan) FROM hotel_reservation_dataset
WHERE type_of_meal_plan IN ("Meal Plan 1", "Meal Plan 2");

-- 3. What is the average price per room for reservations involving children?  
SELECT avg_price_per_room FROM hotel_reservation_dataset
WHERE no_of_children != 0;

-- SELECT no_of_children, SUM(avg_price_per_room) FROM hotel_reservation_dataset
-- WHERE no_of_children != 0
-- GROUP BY no_of_children;


-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?  
SET SQL_SAFE_UPDATES =0;

UPDATE hotel_reservation_dataset
SET arrival_date = STR_TO_DATE(arrival_date, "%d-%m-%YYYY");
ALTER TABLE hotel_reservation_dataset
MODIFY COLUMN arrival_date DATE;

ALTER TABLE hotel_reservation_dataset
ADD COLUMN Reservation_Date DATE;
UPDATE hotel_reservation_dataset
SET Reservation_Date = DATE_SUB(arrival_date, INTERVAL lead_time DAY);

-- Number of reservation in 2017 using the left string method
SELECT COUNT(Reservation_Date) AS 2017_reservation FROM hotel_reservation_dataset
WHERE LEFT(Reservation_Date, 4) = 2017;
-- Number of reservation in 2018 using the Year method in DateTime
SELECT COUNT(Reservation_Date) AS 2018_reservation FROM hotel_reservation_dataset
WHERE YEAR(Reservation_Date) = 2018;

-- 5. What is the most commonly booked room type?  
SELECT MAX(room_type_reserved) AS Commonly_booked_room FROM hotel_reservation_dataset;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT COUNT(no_of_week_nights) AS weekend_reservation FROM hotel_reservation_dataset
WHERE no_of_week_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?  
SELECT MAX(lead_time) AS highest_leadtime, MIN(lead_time) AS lowest_leadtime FROM hotel_reservation_dataset;

-- 8. What is the most common market segment type for reservations?  
SELECT MAX(market_segment_type) AS common_market_segment FROM hotel_reservation_dataset;

-- 9. How many reservations have a booking status of "Confirmed"?  
SELECT COUNT(booking_status) AS confirmed_booking_status FROM hotel_reservation_dataset
WHERE booking_status = "Confirmed";

-- SELECT COUNT(booking_status) AS confirmed_booking_status FROM hotel_reservation_dataset
-- WHERE booking_status = "Canceled";

-- 10. What is the total number of adults and children across all reservations?  
SELECT SUM(no_of_adults) AS total_no_adults, SUM(no_of_children) AS total_no_children FROM hotel_reservation_dataset;

-- 11. What is the average number of weekend nights for reservations involving children?  
SELECT AVG(no_of_week_nights) AS avg_weekend_nights FROM hotel_reservation_dataset
WHERE no_of_children > 0;

SELECT * FROM hotel_reservation_dataset;