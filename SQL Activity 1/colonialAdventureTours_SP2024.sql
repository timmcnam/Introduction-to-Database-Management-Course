create database ColonialAdventureTours24;
USE ColonialAdventureTours24;
show tables;

create table ADVENTURE_TRIP
	(
	TRIP_ID decimal(3,0),
    TRIP_NAME varchar(75),
    START_LOCATION char(50),
    STATE char(2),
    DISTANCE decimal(4),
    MAX_DRP_SIZE decimal(4),
    TYPE char(20),
    Season char(20),
    constraint advTrip_tripID_pk primary key(TRIP_ID) 
    );
    
insert into ADVENTURE_TRIP values('45', 'Jay Peak', 'Jay', 'VT', '8', '8', 'Summer');

show tables;
describe ADVENTURE_TRIP;
drop table adventure_trip;

create table Guide
(
	Guide_Num char(4),
    Last_Name char(15),
    First_Name char(15),
    Address char(25),
    City char(25),
    State char(2),
    Postal_Code char(5),
    Phone_Num char(12),
    Hire_Date date,
    Constraint guide_guideNum_pk primary key (Guide_Num)
);

create table Customer
(
	Customer_Num char(4),
    Last_Name char(30),
    First_Name char(30),
    Address char(35),
    City char(35),
    State char(2),
    Postal_Code char(5),
    Phone char(12),
    constraint customer_CustomerNum_pk primary key(Customer_Num)
);

Create Table Trip
(
	Trip_ID decimal(3,0),
    Trip_Name char(75),
    Start_Location char(50),
    State char(2),
    Distance decimal(4,0),
    Max_GRP_Size Decimal(4,0),
    type char(20),
    Season char(20),
    constraint trip_TripID_pk primary key(Trip_ID)
);

create table Reservation
(
	Reservation_ID char(7),
    Trip_ID decimal(3,0),
    Trip_Date date,
    Num_Persons Decimal(3,0),
    Trip_Price decimal(6,2),
    Other_Fees decimal(6,2),
    Customer_Num char(4),
    constraint reservation_reservID_pk primary key(Reservation_ID),
    CONSTRAINT reservation_tripID_fk foreign key(Trip_ID) references TRIP(TRIP_ID),
	CONSTRAINT reservation_custNum_fk foreign key(Customer_Num) references Customer(customer_num)
);

select * from guide;

create table Trip_Guides
(
	Trip_ID DECIMAL(3,0),
	Guide_Num CHAR(4),
	constraint trGuide_tripID_guideNum_PK primary key(Trip_ID, Guide_Num)
);