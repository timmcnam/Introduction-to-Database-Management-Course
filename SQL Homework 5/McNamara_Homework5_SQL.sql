# Timothy McNamara
# 4/21/2024
# SQL HW 5

use staywell;

## 1. Create a view named SMALL_PROPERTY. It consists of the property ID, office number,
# bedrooms, floor, monthly rent, and owner number for every property whose square footage is
# less than 1,250 square feet.

# a. Write and execute the CREATE VIEW command to create the SMALL_PROPERTY
# view.
CREATE VIEW SMALL_PROPERTY AS
SELECT p.property_id, office_num, bdrms, floors, monthly_rent, o.owner_num
FROM property p, owner o
WHERE sqr_ft < '1250' and p.owner_num = o.owner_num;

# b. Write and execute the command to retrieve the office number, property ID, and monthly
# rent for every property in the SMALL_PROPERTY view with a monthly rent of $1150 or
# more.
SELECT office_num, property_id, monthly_rent
FROM SMALL_PROPERTY
WHERE monthly_rent >= 1150;

# c. Write and execute the query that the DBMS actually executes.
SELECT office_num, property_id, monthly_rent
FROM (
	SELECT p.property_id, office_num, bdrms, floors, monthly_rent, o.owner_num
    FROM property p, owner o
    WHERE sqr_ft < 1250 and p.owner_num = o.owner_num 
) AS SMALL_PROPERTY
WHERE monthly_rent >= 1150;


# d. Does updating the database through this view create any problems? If so, what are they? 
# If not, why not?
# Updating the database through this view could potentially create problems. 
# The issues depend on the DBMS and the specific updates. For example, if you 
# try to update a field that was not included in the view (like sqr_ft), 
# the DBMS would not know how to handle it. If the updates are 
# only related to the fields included in the view and the view is based on a single table, 
# then there should not be any problems.

## 2. Create a view named PROPERTY_OWNERS. It consists of the property ID, office 
# number, square footage, bedrooms, floors, monthly rent, and owner’s last name 
# for every property in which the number of bedrooms is three.

# a. Write and execute the CREATE VIEW command to create the
# PROPERTY_OWNERS view.
CREATE VIEW PROPERTY_OWNERS AS
SELECT p.property_id, p.office_num, p.sqr_ft, p.bdrms, 
p.floors, p.monthly_rent, o.last_name
FROM property p
JOIN owner o ON p.owner_num = o.owner_num
WHERE p.bdrms = 3;

# b. Write and execute the command to retrieve the property ID, office number, monthly
# rent, square footage, and owner’s last name for every property in the PROPERTY_
# OWNERS view with a monthly rent of less than $1675
SELECT property_id, office_num, monthly_rent, sqr_ft, last_name
FROM PROPERTY_OWNERS
WHERE monthly_rent < 1675;

# c. Write and execute the query that the DBMS actually executes.
SELECT property_id, office_num, monthly_rent, sqr_ft, last_name
FROM (
    SELECT p.property_id, p.office_num, p.sqr_ft, p.bdrms,
    p.floors, p.monthly_rent, o.last_name
    FROM property p
    JOIN owner o ON p.owner_num = o.owner_num
    WHERE p.bdrms = 3
) AS PROPERTY_OWNERS
WHERE monthly_rent < 1675;

# d. Does updating the database through this view create any problems? If so, what 
# are they? If not, why not?
# Again, you shouldn't update a table through a view. The table uses joins and this can
# be problematic causing data inconsistentcy. The changes may not go across all tables.

## 3. Create a view named MONTHLY_RENTS. It consists of two columns: The first is the number
# of bedrooms, and the second is the average monthly rent for all properties in the PROPERTY
# table that have that number of bedrooms. Use AVERAGE_RENT as the column name for the
# average monthly rent. Group and order the rows by number of bedrooms.

# a. Write and execute the CREATE VIEW command to create the MONTHLY_RENTS
# view.
CREATE VIEW MONTHLY_RENTS AS
SELECT bdrms, AVG(monthly_rent) AS AVERAGE_RENT
FROM property
GROUP BY bdrms
ORDER BY bdrms;

# b. Write and execute the command to retrieve the square footage and average fee for each
# square footage for which the average fee is greater than $1,100.
SELECT p.sqr_ft, average_rent
FROM monthly_rents, property p
WHERE average_rent > '1100';

# c. Write and execute the query that the DBMS actually executes.
SELECT p.sqr_ft, average_rent
FROM property p, (
	SELECT bdrms, AVG(monthly_rent) AS AVERAGE_RENT
	FROM property 
	GROUP BY bdrms
	ORDER BY bdrms
) AS MONTHLY_RENTS
WHERE average_rent > '1100';

## 4. Write, but do not execute, the commands to grant the following privileges:

# a. User Oliver must be able to retrieve data from the PROPERTY table.
GRANT SELECT ON PROPERTY TO Oliver;

# b. Users Crandall and Perez must be able to add new owners and properties to the
# database.
GRANT INSERT ON OWNERS, PROPERTIES TO Crandall, Perez;

# c. Users Johnson and Klein must be able to change the monthly rent of any unit.
GRANT UPDATE(monthly_rent) ON PROPERTIES TO Johnson, Klein;

# d. All users must be able to retrieve the office number, monthly rent, and owner number
# for every property.
GRANT SELECT(office_number, monthly_rent, owner_number) 
ON PROPERTIES TO PUBLIC;

# e. User Klein must be able to add and delete service categories.
GRANT INSERT, DELETE ON SERVICE_CATEGORIES TO Klein;

# f. User Adams must be able to create an index on the SERVICE_REQUEST table.
GRANT INDEX ON SERVICE_REQUEST TO Adams;

# g. Users Adams and Klein must be able to change the structure of the PROPERTY table.
GRANT ALTER ON PROPERTY TO Adams, Klein;

# h. User Klein must have all privileges on the OFFICE, OWNER, and PROPERTY tables.
GRANT ALL PRIVILEGES ON OFFICE, OWNER, PROPERTY TO Klein;

## 5. Write, but do not execute, the command to revoke all privileges from user Adams
REVOKE ALL PRIVILEGES FROM Adams;

## 6. Create the following indexes:

# a. Create an index named OWNER_INDEX1 on the STATE column in the OWNER
# table.
CREATE INDEX OWNER_INDEX1 ON OWNER (STATE);

# b. Create an index named OWNER_INDEX2 on the LAST_NAME column in the
# OWNER table.
CREATE INDEX OWNER_INDEX2 ON OWNER (LAST_NAME);

# c. Create an index named OWNER_INDEX3 on the STATE and CITY columns in the
# OWNER table. List the states in descending order.
CREATE INDEX OWNER_INDEX3 ON OWNER (STATE DESC, CITY);

## 7. Delete the OWNER_INDEX 3 index from the OWNER table
DROP INDEX OWNER_INDEX3 on Owner;

