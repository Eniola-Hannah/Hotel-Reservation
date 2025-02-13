# Hotel Reservation Analysis with SQL
---
![hotel booking](https://github.com/user-attachments/assets/ac558fe5-17a2-4017-bfe9-3cdf5405991a)

## Table Of Contents
- [Introduction](#Introduction)
- [Project Overview](#Project-Overview)
- [Project Objective](#Project-Objective)
- [Data Cleaning](#Data-Cleaning-and-Transformation)
- [Data Exploration and Insights](#Data-Exploration-and-Insights)
- [Recommendation](#Recommendation)
- [Files Details](#Files-Details)
- [Conclusion](#Conclusion)

## Introduction
This project involves analyzing a hotel reservation dataset to gain insights into guest preferences, booking trends, and other key factors impacting the hotel's operations. Using SQL, the dataset was queried to answer specific business questions, enhancing data analysis skills in a practical context.


## Project-Overview
•	Dataset Description: The dataset provides information about hotel reservations, including guest details, booking specifics, and pricing.

•	Number of Rows & Columns Before Cleaning:
-	Rows: 700
-	Columns: 12
  
•	Columns Included:
- Booking_ID: Unique identifier for each reservation.
-	no_of_adults: Number of adults in the reservation.
-	no_of_children: Number of children in the reservation.
-	no_of_weekend_nights: Nights falling on weekends.
-	no_of_week_nights: Nights falling on weekdays.
-	type_of_meal_plan: Meal plan chosen by guests.
-	room_type_reserved: Type of room reserved.
-	lead_time: Days between booking and arrival.
-	arrival_date: The date of arrival.
-	market_segment_type: Market segment of the reservation.
-	avg_price_per_room: Average price per room.
-	booking_status: Status of the booking (Confirmed/Canceled).

<img width="931" alt="aaaa" src="https://github.com/user-attachments/assets/89cbee18-9fef-4727-9dfb-4a7f11ef1ec0" />


## Project-Objectives
- Problem Statement: The hotel industry relies on data-driven decisions to enhance guest experience and optimize operations.
This project aims to provide insights into guest preferences, booking trends, and revenue-generating segments using SQL analysis on the hotel reservation dataset.
- Task To Do
1.	Determine the total number of reservations.
2.	Identify the most popular meal plan.
3.	Calculate the average price per room for reservations involving children.
4.	Analyze yearly reservation trends.
5.	Find the most commonly booked room type.
6.	Investigate weekend booking patterns.
7.	Determine the highest and lowest lead times.
8.	Identify the most common market segment type.
9.	Count the reservations with a confirmed booking status.
10.	Calculate the total number of adults and children across all reservations.
11.	Find the average number of weekend nights for reservations with children.
12.	Analyze monthly booking trends.
13.	Calculate the average number of nights spent per room type.
14.	Determine the most common room type for reservations with children and its average price.
15.	Identify the market segment generating the highest average room price.



## Data-Cleaning-and-Transformation
- Renaming the Table
```sql
RENAME TABLE `hotel reservation dataset` TO hotel_reservation_dataset;
```
- Changing the arrival_date format
```sql
UPDATE hotel_reservation_dataset
SET arrival_date = STR_TO_DATE(arrival_date, "%d-%m-%YYYY");
```
- Modifying The arrival_date datatype
```sql
ALTER TABLE hotel_reservation_dataset
MODIFY COLUMN arrival_date DATE;
```
- Adding a new column ~ Reservation_date
```sql
ALTER TABLE hotel_reservation_dataset
ADD COLUMN Reservation_Date DATE;
```
- Populating the column by Subtracting the Lead Time from the Arrival date
```sql
UPDATE hotel_reservation_dataset
SET Reservation_Date = DATE_SUB(arrival_date, INTERVAL lead_time DAY);
```


## Data-Exploration-and-Insights
1.	Total Reservations: 700
2.	Most Popular Meal Plan among guest: Meal Plan 1 ~ 377 in number
3.	Average Price Per Room (With Children): $144.57
4.	(a) Reservation made in 2017: 194
    (b) Reservation made in 2018: 501
5.	Most Booked Room Type: Room Type 1
6.	Weekend Reservation: 383
7.	Lead Time Analysis:
- Highest Lead Time: 443 days (A year, 2 month and about 18 days)
-	Lowest Lead Time: 0 day (Same-day booking)
8.	Most Common Market Segment: Online Booking
9.	Confirmed Bookings: 493
10.	Total Adults and Children:
-	Adults: 1316
-	Children: 69
-	Sum of Adult and Children: 1385
11.	Average Weekend Nights (With Children): 1.0 (a night)
12.	Monthly Booking Trends: Lowest in December and Peak in January
13.	Average Nights Spent (Per Room Type):
-	Room Type 1:  2.79
-	Room Type 2:  3.17
-	Room Type 4:  3.45
-	Room Type 2:  2.50
-	Room Type 6:  3.11
-	Room Type 7:  2.60
14.	Common Room Type (With Children): Room Type 1 with an average price of $123.12
15.	Highest Revenue Market Segment: Offline bookings with an average price of $89.98


## Recommendation
-	Promotional Strategy: Target Room Type A with family packages to maximize bookings involving children.
-	Revenue Optimization: Focus on the Corporate segment for premium pricing strategies.
-	Seasonal Campaigns: Increase marketing efforts in January to capitalize on peak booking periods.


## Files-Details
-	Hotel Reservation Dataset.csv: The dataset used for analysis
-	Problem Statement - Hotel Reservation Analysis.pdf: Project overview and objectives
-	Query.sql: SQL queries used to extract and analyze the data
-	README.md: Documentation for the project


## Conclusion
This analysis provides actionable insights for the hotel to enhance guest experiences, optimize pricing strategies, and improve overall operational efficiency.
