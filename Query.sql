CREATE DATABASE Hotel_Reservation;
USE Hotel_Reservation;

RENAME TABLE `hotel reservation dataset` TO hotel_reservation_dataset;

SELECT * FROM hotel_reservation_dataset;

-- 1. What is the total number of reservations in the dataset?  
SELECT COUNT(Booking_ID) FROM hotel_reservation_dataset;
