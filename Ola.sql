create database ola;
use ola;
CREATE TABLE Bookings (
    Date DATE,
    Time TIME,
    Booking_ID VARCHAR(50) PRIMARY KEY,
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT INT,
    C_TAT INT,
    Canceled_Rides_by_Customer TEXT,
    Canceled_Rides_by_Driver TEXT,
    Incomplete_Rides TEXT,
    Incomplete_Rides_Reason TEXT,
    Booking_Value DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    Ride_Distance DECIMAL(10, 2),
    Driver_Ratings DECIMAL(3, 2),
    Customer_Rating DECIMAL(3, 2),
    Vehicle_Images TEXT
);

drop table Bookings;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bookings.csv'
INTO TABLE Bookings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
IGNORE 1 LINES
(@Date, @Time, @Booking_ID, @Booking_Status, @Customer_ID, @Vehicle_Type, @Pickup_Location, @Drop_Location, 
 @V_TAT, @C_TAT, @Canceled_Rides_by_Customer, @Canceled_Rides_by_Driver, 
 @Incomplete_Rides, @Incomplete_Rides_Reason, @Booking_Value, @Payment_Method, 
 @Ride_Distance, @Driver_Ratings, @Customer_Rating, @Vehicle_Images)
SET
    Date = @Date,
    Time = @Time,
    Booking_ID = @Booking_ID,
    Booking_Status = @Booking_Status,
    Customer_ID = @Customer_ID,
    Vehicle_Type = @Vehicle_Type,
    Pickup_Location = @Pickup_Location,
    Drop_Location = @Drop_Location,
    V_TAT = NULLIF(@V_TAT, 'null'),
    C_TAT = NULLIF(@C_TAT, 'null'),
    Canceled_Rides_by_Customer = NULLIF(@Canceled_Rides_by_Customer, 'null'),
    Canceled_Rides_by_Driver = NULLIF(@Canceled_Rides_by_Driver, 'null'),
    Incomplete_Rides = NULLIF(@Incomplete_Rides, 'null'),
    Incomplete_Rides_Reason = @Incomplete_Rides_Reason,
    Booking_Value = NULLIF(@Booking_Value, 'null'),
    Payment_Method = @Payment_Method,
    Ride_Distance = NULLIF(@Ride_Distance, 'null'),
    Driver_Ratings = NULLIF(@Driver_Ratings, 'null'),
    Customer_Rating = NULLIF(@Customer_Rating, 'null'),
    Vehicle_Images = @Vehicle_Images;


select * from number_of_cancelled_rides;

#1. Retrieve all successful bookings:
create view Successful_Bookings as
select * from Bookings where Booking_Status='Success';


#2. Find the average ride distance for each vehicle type:
create view Average_Distance as
select Vehicle_Type,avg(Ride_Distance) as Average_Distance from Bookings group by Vehicle_Type;


#3. Get the total number of cancelled rides by customers:
create view number_of_cancelled_rides as
select count(*) as number_of_cancelled_rides from Bookings where Booking_Status='Canceled by Customer';


#4. List the top 5 customers who booked the highest number of rides:
create view Top5_Customer as
select Customer_ID, count(Booking_ID) as total_rides from Bookings group by Booking_ID order by total_rides desc limit 5;


#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view Cancel_for_personal_or_Car_related_issue as 
 select  count(Canceled_Rides_by_Driver) as Cancel_for_personal_or_Car_related_issue from Bookings where Canceled_Rides_by_Driver='Personal & Car related issue';


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view Ratings_PrimeSudan as
select max(Customer_Rating) as max_rating,min(Customer_Rating) as min_rating from Bookings where Vehicle_Type='Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
create view UPI as
select * from Bookings where Payment_Method='UPI';

#8. Find the average customer rating per vehicle type:
create view Avg_Rating as
select Vehicle_Type,avg(Customer_Rating) as Avg_Rating from Bookings group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
create view Total_Booking_Value as
select sum(Booking_Value) as Total_Booking_Value from Bookings where Booking_Status='success';

#10. List all incomplete rides along with the reason:
create view incomplete_rides as
select Booking_ID,Incomplete_Rides_Reason from Bookings where Incomplete_Rides='Yes'; 