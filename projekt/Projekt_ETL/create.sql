CREATE TABLE Pynka.FACT_TRIP (
	TRIP_ID INTEGER NOT NULL,
	Start_Time VARCHAR(12) NOT NULL,
	End_Time VARCHAR(12) NOT NULL,
	Start_Station INTEGER NOT NULL,
	End_Station INTEGER NOT NULL,
	Start_Station_Name VARCHAR(45) NOT NULL,
	End_Station_Name VARCHAR(45) NOT NULL,
	Trip_Customer INTEGER NOT NULL,
	Trip_Bike INTEGER NOT NULL,
	Trip_Weather INTEGER NOT NULL,
	Duration INTEGER NOT NULL
);

CREATE TABLE Pynka.DIM_BIKE (
	BIKE_ID INTEGER NOT NULL
);

CREATE TABLE Pynka.DIM_STATION (
	STATION_ID INTEGER NOT NULL,
	Name VARCHAR(45) NOT NULL,
	Lat FLOAT(24) NOT NULL,
	Long FLOAT(24) NOT NULL,
	Dock_Count INTEGER NOT NULL,
	City VARCHAR(13) NOT NULL,
	Installation_Date VARCHAR(12) NOT NULL
);

CREATE TABLE Pynka.DIM_CUSTOMER (
	CUSTOMER_ID INTEGER IDENTITY(1,1),
	Cust_Zip_Code VARCHAR(11),
	Subscription_Type VARCHAR(10) NOT NULL
);

CREATE TABLE Pynka.DIM_TIME (
	PK_TIME VARCHAR(12) NOT NULL,
	Year INTEGER NOT NULL,
	Month INTEGER NOT NULL,
	Month_Name VARCHAR(9) NOT NULL,
	Day INTEGER NOT NULL,
	Week_Day VARCHAR(9) NOT NULL,
	Hour INTEGER,
	Minute INTEGER
);

CREATE TABLE Pynka.DIM_WEATHER (
	WEATHER_ID INTEGER IDENTITY(1,1),
	Measure_Date VARCHAR(12) NOT NULL,
	Measure_City VARCHAR(13) NOT NULL,
	Max_Temperature INTEGER,
	Mean_Temperature INTEGER,
	Min_Temperature INTEGER,
	Max_Humidity INTEGER,
	Mean_Humidity INTEGER,
	Min_Humidity INTEGER,
	Max_Pressure FLOAT(24),
	Mean_Pressure FLOAT(24),
	Min_Pressure FLOAT(24),
	Max_Visibility INTEGER,
	Mean_Visibility INTEGER,
	Min_Visibility INTEGER,
	Precipitation_Inches VARCHAR(4),
	Cloud_Cover INTEGER,
	Events VARCHAR(17)
);