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