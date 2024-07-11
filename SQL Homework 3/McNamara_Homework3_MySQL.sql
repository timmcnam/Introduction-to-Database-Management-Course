# TIMOTHY MCNAMARA
# MySQL HOMEWORK 3
# 2/15/2024

# Q1
# Create a LARGE_PROPERTY table with the structure shown in Picture
use staywell;

create table LARGE_PROPERTY
(
	OFFICE_NUM DECIMAL(2,0) NOT NULL,
    ADDRESS CHAR(25) NOT NULL,
    BDRMS DECIMAL(2,0), 
    FLOORS DECIMAL(2,0),
    MONTHLY_RENT DECIMAL (6,2),
    OWNER_NUM CHAR(5),
    CONSTRAINT largeproperty_ADDRESS_pk primary key (ADDRESS)
);

# Q2
# insert into the LARGE_PROPERTY table the office number, address, bedrooms, 
# floors, monthly rent, and owner number for those properties whose square 
# footage is greater than 1,500 square feet
select * from LARGE_PROPERTY;
insert into LARGE_PROPERTY select OFFICE_NUM, ADDRESS, 
BDRMS, FLOORS, MONTHLY_RENT, OWNER_NUM from property 
where SQR_FT > 1500; 

# Q3
# StayWell has increased the monthly rent of each large property by $150. 
# Update the monthly rents in the LARGE_PROPERTY table accordingly.
update LARGE_PROPERTY set MONTHLY_RENT = MONTHLY_RENT + 150;

# Q4
# After increasing the monthly rent of each large property by $150 (Exercise 3), StayWell
# decides to decrease the monthly rent of any property whose monthly fee is more than 
# $1750 by 1 percent. Update the monthly rents in the LARGE_PROPERTY table accordingly.
update LARGE_PROPERTY set MONTHLY_RENT = MONTHLY_RENT * 1.01 
where MONTHLY_rENT > 1750;

# Q5
# Insert a row into the LARGE_PROPERTY table for a new property. The office number is 1,
# the address is 2643 Lugsi Dr, the number of bedrooms is 3, the number of floors is 2, 
# the monthly rent is $775, and the owner number is MA111.
insert into large_property values
(1, '2643 Lugsi Dr', 3, 2, 775, 'MA111');

# Q6
# Delete all properties in the LARGE_PROPERTY table for which the owner number is BI109.
delete from large_property where OWNER_NUM = 'BI109';

# Q7
# The property in managed by Columbia City with the address 105 North Illinois Rd is 
# in the process of being remodeled and the number of bedrooms is unknown. Change the 
# bedrooms value in the LARGE_PROPERTY table to null.
update large_property set BDRMS = null;

# Q8
# Add to the LARGE_PROPERTY table a new character column named OCCUPIED that is one
# character in length. (This column indicates whether the property is currently occupied.) 
# Set the value for the OCCUPIED column on all rows to Y.
alter table large_property add OCCUPIED char(1);
update large_property set OCCUPIED = 'Y';

# Q9 
# Change the OCCUPIED column in the LARGE_PROPERTY table to N for OWNER NUM KO104.
update large_property set OCCUPIED = 'N' where OWNER_NUM = 'KO104';

# Q10
# Change the MONTHLY_RENT column in the LARGE_PROPERTY table to reject nulls.
alter table large_property modify MONTHLY_RENT decimal(6,2) not null;

# Q11 Delete the LARGE_PROPERTY table from the database.
drop table large_property;    