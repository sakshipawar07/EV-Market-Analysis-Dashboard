USE EV_Analytics;

CREATE TABLE ev_sales (
    category VARCHAR(10),
    maker VARCHAR(150),
    Year INT,
    EV_Sales INT
);

select * from ev_sales
limit 5;

CREATE TABLE ev_state_category (
    EV_Maker VARCHAR(150),
    Place VARCHAR(100),
    State VARCHAR(100),
    Total_EV_Registration INT
);

select * from ev_state_category
limit 5;

CREATE TABLE charging_station (
    State VARCHAR(100),
    Operational_PCS INT
);

select * from charging_station
limit 5;

CREATE TABLE vehicle_registration (
    date DATE,
    four_wheeler_invalid_carriage INT,
    heavy_goods_vehicle INT,
    heavy_motor_vehicle INT,
    heavy_passenger_vehicle INT,
    light_goods_vehicle INT,
    light_motor_vehicle INT,
    light_passenger_vehicle INT,
    medium_goods_vehicle INT,
    medium_passenger_vehicle INT,
    medium_motor_vehicle INT,
    other_than_mentioned_above INT,
    three_wheeler_nt INT,
    two_wheeler_invalid_carriage INT,
    three_wheeler_t INT,
    two_wheeler_nt INT,
    two_wheeler_t INT
);
DESC vehicle_registration;

select * from vehicle_registration
limit 5;

CREATE TABLE vehicle_classes_record(
	vehicle_class varchar(100),
    total_registration int
);
select * from vehicle_classes;
-- -------------------------------------------------------------------

-- 1. Display all tables in database
SHOW TABLES;

-- 2. Check table structure
DESC ev_sales;
DESC ev_state_category;
DESC charging_station;
DESC vehicle_registration;

-- 3. Display first 5 records
SELECT * FROM ev_sales
LIMIT 5;

SELECT * FROM ev_state_category
LIMIT 5;

SELECT * FROM charging_station
LIMIT 5;

SELECT * FROM vehicle_registration
LIMIT 5;

-- 4. Find total number of records
SELECT COUNT(*) AS total_records
FROM ev_sales;

SELECT COUNT(*) AS total_records
FROM ev_state_category;

SELECT COUNT(*) AS total_records
FROM charging_station;

SELECT COUNT(*) AS total_records
FROM vehicle_registration;

-- 5. Find date range available in dataset
SELECT 
MIN(Year) AS starting_date,
MAX(Year) AS ending_date
FROM ev_sales;

-- 6. Find unique states
SELECT DISTINCT State
FROM ev_state_category;

-- 7. Count total number of states
SELECT COUNT(DISTINCT state) AS total_states
FROM ev_state_category;

-- 8. Check missing values in important columns
SELECT * FROM ev_sales
WHERE category IS NULL or EV_Sales IS NULL;

SELECT * FROM charging_station
WHERE State IS NULL OR Operational_PCS IS NULL;

-- 9. Check duplicate records
SELECT State, Place, EV_Maker, count(*) AS duplicate_count
FROM ev_state_category
GROUP BY State, Place, EV_Maker
HAVING COUNT(*) > 1;

SELECT category , maker , Year, ev_Sales , count(*) AS Duplicate_count
FROM ev_sales
group by category , maker , Year, ev_Sales
HAVING COUNT(*) > 1;

-- 10. Find total EV registrations
SELECT 
SUM(four_wheeler_invalid_carriage +
heavy_goods_vehicle +
heavy_motor_vehicle +
heavy_passenger_vehicle +
light_goods_vehicle +
light_motor_vehicle +
light_passenger_vehicle +
medium_goods_vehicle +
medium_passenger_vehicle + 
medium_motor_vehicle +
other_than_mentioned_above + 
three_wheeler_nt + 
two_wheeler_invalid_carriage + 
three_wheeler_t +
two_wheeler_nt + 
two_wheeler_t) AS total_EV
FROM vehicle_registration;





