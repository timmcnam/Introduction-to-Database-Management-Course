# Timothy McNamara
# MySQL Homework 4
# 4/4/2024

use staywell;

# 1. For every property, list the management office number, address, 
# monthly rent, owner number, owner’s first name, and owner’s last name.
select p.office_num, p.address, p.monthly_rent, p.owner_num, 
o.first_name, o.last_name from property p, owner o
where p.owner_num = o.owner_num;

# 2. For every completed or open service request, list the property ID, 
# description, and status.
select sr.property_id, sr.description, sr.status from property p, service_request sr
where p.property_id = sr.property_id and status = 'open' or 'completed';

# 3. For every service request for furniture replacement, list the property ID, 
# management office number, address, estimated hours, spent hours, owner number, 
# and owner’s last name.
select sr.property_id, sr.property_id, sc.category_num, sr.office_id, p.address,
sr.est_hours, sr.spent_hours, o.owner_num, o.last_name 
from service_request sr, owner o, property p, service_category sc 
where p.property_id = sr.property_id and category_num = '6';

# 4. List the first and last names of all owners who own a two-bedroom property. 
# Use the IN operator in your query.
select o.first_name, o.last_name
from owner o
where o.owner_num in 
(
    select p.owner_num
    from Property p
    where bdrms = '2'
);

# 5. Repeat Exercise 4, but this time use the EXISTS operator in your query
select o.first_name, o.last_name
from owner o
where exists 
(
    select 1
    from Property p
    where bdrms = '2' and p.owner_num = o.owner_num
);

#6. List the property IDs of any pair of properties that have the same number of bedrooms. For
# example, one pair would be property ID 2 and property ID 6, because they both have four
# bedrooms. The first property ID listed should bde the major sort key and the second property
# ID should be the minor sort key.
SELECT DISTINCT A.PROPERTY_ID, B.PROPERTY_ID, A.BDRMS
FROM PROPERTY A, PROPERTY B
WHERE A.BDRMS = B.BDRMS and A. PROPERTY_ID > B. PROPERTY_ID
ORDER BY A.PROPERTY_ID, B.PROPERTY_ID;

# 7. List the square footage, owner number, owner last name, and owner first name 
# for each property managed by the Columbia City office.
select p.sqr_ft, p.owner_num, o.last_name, o.first_name, p.office_num, off.area
from owner o, property p, office off
where p.owner_num = o.owner_num and p.office_num = off.office_num and area != 'Georgetown';

# 8. Repeat Exercise 7, but this time include only those properties with 
# three bedrooms.
select p.sqr_ft, p.owner_num, o.last_name, o.first_name, p.office_num, off.area,
p.bdrms from owner o, property p, office off
where p.owner_num = o.owner_num and p.office_num = off.office_num
and area != 'Georgetown' and bdrms = '3';

# 9. List the office number, address, and monthly rent for properties 
# whose owners live in Washington state or own two-bedroom properties.
select p.office_num, p.address, p.monthly_rent, p.owner_num, o.state, p.bdrms
from property p, owner o where p.owner_num = o.owner_num 
and state = 'WA' or bdrms = '2';

# 10. List the office number, address, and monthly rent for properties 
# whose owners live in Washington state and own a two-bedroom property.
select p.office_num, p.address, p.owner_num, p.monthly_rent, o.state, p.bdrms
from property p, owner o where p.owner_num = o.owner_num
and state = 'WA' and bdrms = '2';

# 11. List the office number, address, and monthly rent for properties 
# whose owners live in Washington state but do not own two-bedroom properties.
select p.address, p.monthly_rent, p.bdrms, p.office_num, p.owner_num, o.state
from property p, owner o where p.owner_num = o.owner_num
and state = 'WA' and bdrms != '2';


# 12. Find the service ID and property ID for each service request whose estimated 
# hours are greater than the number of estimated hours of at least one service request
# on which the category number is 5.
select sr1.service_id, sr1.property_id
from service_request sr1
where sr1.est_hours > 
(
    select MIN(sr2.est_hours)
    from service_request sr2
    where sr2.category_number = 5
);

# 13. Find the service ID and property ID for each service request whose estimated
# hours are greater than the number of estimated hours on every service request 
# on which the cat-egory number is 5.
select sr1.service_id, sr1.property_id
from service_request sr1
where sr1.est_hours > all 
(
    select sr2.est_Hours
    from service_request sr2
    where sr2.category_number = 5
);


# 14. List the address, square footage, owner number, service ID, number of estimated hours,
# and number of spent hours for each service request on which the category number is 4.
select p.property_id, p.sqr_ft, p.owner_num,  p.address, sr.service_id,
sr.est_hours, sr.spent_hours, sr.category_number, sr.property_id
from property p, service_request sr where p.property_id =sr.property_id
and category_number = '4';


# 15. Repeat Exercise 14, but this time be sure each property is included regardless of 
# whether the property currently has any service requests for category 4.
SELECT PROPERTY.ADDRESS, PROPERTY.SQR_FT, PROPERTY.OWNER_NUM,
SERVICE_REQUEST.SERVICE_ID, SERVICE_REQUEST.EST_HOURS,
SERVICE_REQUEST.SPENT_HOURS
FROM PROPERTY LEFT JOIN SERVICE_REQUEST ON (PROPERTY.PROPERTY_ID =
SERVICE_REQUEST.PROPERTY_ID)
AND SERVICE_REQUEST.CATEGORY_NUMBER = 4;


# 16. Repeat Exercise 15 using a different SQL command to obtain the same result.
# What is the difference between the two commands?
SELECT PROPERTY.ADDRESS, PROPERTY.SQR_FT, PROPERTY.OWNER_NUM,
SERVICE_REQUEST.SERVICE_ID, SERVICE_REQUEST.EST_HOURS,
SERVICE_REQUEST.SPENT_HOURS
FROM SERVICE_REQUEST RIGHT JOIN PROPERTY ON (PROPERTY.PROPERTY_ID
= SERVICE_REQUEST.PROPERTY_ID)
AND SERVICE_REQUEST.CATEGORY_NUMBER = 4;


