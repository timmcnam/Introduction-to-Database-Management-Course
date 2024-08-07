# MySQL STAYWELL SCHEMA

# Create OWNER table
DROP TABLE IF EXISTS OWNER;
CREATE TABLE OWNER (
    OWNER_NUM CHAR(5) PRIMARY KEY NOT NULL,
    LAST_NAME VARCHAR(20) NOT NULL,
    FIRST_NAME VARCHAR(20) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE CHAR(2) NOT NULL,
    ZIP_CODE CHAR(5) NOT NULL
);



# Create PROPERTY table  
DROP TABLE IF EXISTS PROPERTY;    
CREATE TABLE PROPERTY (
    PROPERTY_ID SMALLINT PRIMARY KEY NOT NULL,
    OFFICE_NUM TINYINT NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    SQR_FT SMALLINT NOT NULL,
    BDRMS TINYINT NOT NULL,
    FLOORS TINYINT NOT NULL,
    MONTHLY_RENT SMALLINT,
    OWNER_NUM CHAR(5) NOT NULL
);



# Create OFFICE table
DROP TABLE IF EXISTS OFFICE;
CREATE TABLE OFFICE (
    OFFICE_NUM TINYINT PRIMARY KEY NOT NULL,
    OFFICE_NAME VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    AREA VARCHAR(50) NOT NULL,
    CITY VARCHAR(20) NOT NULL,
    STATE CHAR(2) NOT NULL,
    ZIP_CODE CHAR(5) NOT NULL
);


# Create SERVICE_CATEGORY table 
DROP TABLE IF EXISTS SERVICE_CATEGORY;
CREATE TABLE SERVICE_CATEGORY (
    CATEGORY_NUM TINYINT PRIMARY KEY NOT NULL,
    CATEGORY_DESCRIPTION VARCHAR(100) NOT NULL
);


# Create SERVICE_REQUEST table  
DROP TABLE IF EXISTS SERVICE_REQUEST; 
CREATE TABLE SERVICE_REQUEST (
    SERVICE_ID SMALLINT PRIMARY KEY NOT NULL,
    PROPERTY_ID SMALLINT NOT NULL,
    CATEGORY_NUMBER TINYINT NOT NULL,
    OFFICE_ID TINYINT NOT NULL,
    DESCRIPTION VARCHAR(200) NOT NULL,
    STATUS VARCHAR(200) NOT NULL,
    EST_HOURS TINYINT NOT NULL,
    SPENT_HOURS TINYINT NOT NULL,
    NEXT_SERVICE_DATE DATE
);
        
# Create RESIDENTS  table   
DROP TABLE IF EXISTS RESIDENTS;
CREATE TABLE RESIDENTS (
    RESIDENT_ID SMALLINT PRIMARY KEY NOT NULL,
    FIRST_NAME VARCHAR(20) NOT NULL,
    SURNAME VARCHAR(20) NOT NULL,
    PROPERTY_ID SMALLINT NOT NULL
);

