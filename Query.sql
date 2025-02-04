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



SELECT * FROM hotel_reservation_dataset;