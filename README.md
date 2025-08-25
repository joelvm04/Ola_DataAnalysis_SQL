# Ola_DataAnalysis_SQL

This project focuses on analyzing Ola ride booking data using SQL to derive meaningful insights about ride patterns, cancellations, customer behavior, driver performance, and payment preferences. The dataset is structured around ride details such as booking status, customer and driver interactions, ride distances, payments, and ratings.

# 📌 Project Objectives

>To clean and structure raw Ola ride booking data into a relational database.

>To create SQL views that answer key business questions such as:

>How many rides are successfully completed?

>What is the average ride distance per vehicle type?

>Who are the top customers by number of rides?

>What are the most common cancellation reasons?

>How do customer and driver ratings vary across vehicle types?

>To generate insights that can help Ola improve customer satisfaction, reduce cancellations, and optimize operations.

# 🗂️ Database & Table Structure

Database Name: ola

Table: Bookings

Key Columns:

Booking_ID (Primary Key)

Booking_Status (Success, Canceled by Customer, Canceled by Driver, Incomplete, etc.)

Customer_ID, Vehicle_Type, Pickup_Location, Drop_Location

Booking_Value, Payment_Method, Ride_Distance

Driver_Ratings, Customer_Rating

Canceled_Rides_by_Customer, Canceled_Rides_by_Driver, Incomplete_Rides

# 🔍 Key Analysis (SQL Views Created)

1.Successful_Bookings – All successful ride bookings.

2.Average_Distance – Average ride distance grouped by vehicle type.

3.Number_of_Cancelled_Rides – Total rides canceled by customers.

4.Top5_Customer – Top 5 customers by ride count.

5.Cancel_for_Personal_or_Car_Issue – Driver cancellations due to personal or car-related issues.

6.Ratings_PrimeSedan – Maximum & minimum ratings for Prime Sedan rides.

7.UPI – All rides where payment was made using UPI.

8.Avg_Rating – Average customer rating per vehicle type.

9.Total_Booking_Value – Total booking value of all successful rides.

10.Incomplete_Rides – List of incomplete rides with reasons.

# 🛠️ Tools & Technologies

SQL (MySQL Workbench) – Data storage, cleaning, and analysis.

CSV File Import – Loading raw data into MySQL.

Views – For structured analysis and quick insights.

# 📈 Business Value

Helps identify customer trends (frequent riders, popular payment methods).

Provides insights into ride cancellations to reduce churn.

Highlights driver performance and ratings for quality monitoring.

Supports financial analysis through total booking value and payment tracking.
