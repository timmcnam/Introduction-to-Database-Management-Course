# Timothy McNamara
# CIT 21400
# 02/06/2024
# MySQL Homework 2
USE StayWell;

# Q1
# 1. List the owner number, last name, and first name of every property owner.
SELECT Owner_Num, Last_Name, First_Name FROM Owner;

# Q2
# 2. List the complete PROPERTY table (all rows and all columns).
SELECT * from Property;

# Q3
# 3. List the last name and first name of every owner who lives in Seattle.
SELECT Last_Name, First_Name FROM Owner WHERE City = 'Seattle';

# Q4
# 4. List the last name and first name of every owner who does not live in Seattle.
SELECT Last_Name, First_Name FROM Owner WHERE City != 'Seattle';

# Q5
# 5. List the property ID and office number for every property 
# whose square footage is equal to or less than 1,400 square feet.
SELECT Property_ID, Office_Num FROM PROPERTY WHERE SQR_FT <= 1400;

# Q6
# 6. List the office number and address for every property with three bedrooms.
SELECT Office_Num, Address FROM PROPERTY WHERE BDRMS = 3;

# Q7
# 7. List the property ID for every property with two bedrooms 
# that is managed by StayWell-Georgetown.
SELECT Property_ID FROM PROPERTY WHERE BDRMS = 2 AND Office_Num = 2;

# Q8
# 8. List the property ID for every property with a 
# monthly rent that is between $1,350 and $1,750.
SELECT Property_ID FROM PROPERTY WHERE Monthly_Rent BETWEEN 1350 AND 1750;

# Q9
# 9. List the property ID for every property managed by 
# StayWell-Columbia City whose monthly rent is less than $1,500.
SELECT Property_ID FROM PROPERTY WHERE Office_Num = 1 AND Monthly_Rent < 1500;

# Q10
# 10. Labor is billed at the rate of $35 per hour. List the property ID, category number, estimated
# hours, and estimated labor cost for every service request. To obtain the estimated labor cost,
# multiply the estimated hours by 35. Use the column name ESTIMATED_COST for the
# estimated labor cost.
SELECT Property_ID, Category_Number, Est_Hours, Est_Hours * 35 
AS ESTIMATED_COST FROM Service_Request;

# Q11
# 11. List the owner number and last name for all owners who live in Nevada (NV), Oregon (OR),
# or Idaho (ID)
SELECT Owner_Num, Last_Name FROM Owner WHERE State IN ('NV', 'OR', 'ID');

# Q12
# 12. List the office number, property ID, square footage, and monthly rent for all properties. Sort
# the results by monthly rent within the square footage.
SELECT Office_Num, Property_ID, SQR_FT, Monthly_Rent FROM PROPERTY 
ORDER BY SQR_FT, Monthly_Rent;

# Q13
# 13. How many three-bedroom properties are managed by each office?
SELECT Office_Num, COUNT(*) as 'Number of 3-BDRM Properties' FROM PROPERTY 
WHERE BDRMS = 3 GROUP BY Office_Num;

# Q14
# 14. Calculate the total value of monthly rents for all properties.
SELECT SUM(Monthly_Rent) AS 'Total Monthly Rent' FROM PROPERTY;






