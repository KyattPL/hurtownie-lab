ALTER TABLE Pynka.DIM_BIKE
ADD CONSTRAINT dim_bike_pk PRIMARY KEY (BIKE_ID);

ALTER TABLE Pynka.DIM_CUSTOMER
ADD CONSTRAINT dim_cust_pk PRIMARY KEY (CUSTOMER_ID);

ALTER TABLE Pynka.DIM_STATION
ADD CONSTRAINT dim_station_pk PRIMARY KEY (STATION_ID);

ALTER TABLE Pynka.DIM_TIME
ADD CONSTRAINT dim_time_pk PRIMARY KEY (PK_TIME);

ALTER TABLE Pynka.DIM_WEATHER
ADD CONSTRAINT dim_weather_pk PRIMARY KEY (WEATHER_ID);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_pk PRIMARY KEY (TRIP_ID);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_start_time FOREIGN KEY (Start_Time) REFERENCES Pynka.DIM_TIME(PK_TIME);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_end_time FOREIGN KEY (End_Time) REFERENCES Pynka.DIM_TIME(PK_TIME);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_start_station FOREIGN KEY (Start_Station) REFERENCES Pynka.DIM_STATION(STATION_ID);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_end_station FOREIGN KEY (End_Station) REFERENCES Pynka.DIM_STATION(STATION_ID);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_customer FOREIGN KEY (Trip_Customer) REFERENCES Pynka.DIM_CUSTOMER(CUSTOMER_ID);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_bike FOREIGN KEY (Trip_Bike) REFERENCES Pynka.DIM_BIKE(BIKE_ID);

ALTER TABLE Pynka.FACT_TRIP
ADD CONSTRAINT fact_trip_fk_weather FOREIGN KEY (Trip_Weather) REFERENCES Pynka.DIM_WEATHER(WEATHER_ID);