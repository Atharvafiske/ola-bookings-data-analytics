select * from booking
-- 1. Retrieve all successful bookings:
select * from booking where "Booking_Status" = 'Success';
-- 2. Find the average ride distance for each vehicle type:
select "Vehicle_Type" , AVG("Ride_Distance")
from booking
group by "Vehicle_Type";
-- 3. Get the total number of cancelled rides by customers:
select count("Booking_Status") from booking
where "Booking_Status" = 'Canceled by Customer';
-- 4. List the top 5 customers who booked the highest number of rides:
select "Customer_ID" , count("Booking_ID") as total_rides
from booking
group by "Customer_ID"
order by "total_rides" desc 
limit 5;
-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count("Booking_ID") from booking
where "Booking_Status" = 'Canceled by Driver' and 
"Canceled_Rides_by_Driver" = 'Personal & Car related issue';
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max("Driver_Ratings") as max_rating ,
min("Driver_Ratings") as min_rating
from booking
where "Vehicle_Type" = 'Prime Sedan';
-- 7. Retrieve all rides where payment was made using UPI:
select * from booking
where "Payment_Method" = 'UPI';
-- 8. Find the average customer rating per vehicle type:
select "Vehicle_Type" , ROUND(AVG("Customer_Rating")::NUMERIC,2)
from booking 
group by "Vehicle_Type";

-- 9. Calculate the total booking value of rides completed successfully:
select SUM("Booking_Value") as total_successful_value from booking where
"Booking_Status" = 'Success';
-- 10. List all incomplete rides along with the reason:
select "Booking_ID", "Incomplete_Rides_Reason" FROM booking WHERE "Incomplete_Rides" =
'Yes';





