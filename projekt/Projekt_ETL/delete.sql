IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'FACT_TRIP'))
BEGIN
    DROP TABLE Pynka.FACT_TRIP
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'DIM_STATION'))
BEGIN
    DROP TABLE Pynka.DIM_STATION
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'DIM_BIKE'))
BEGIN
    DROP TABLE Pynka.DIM_BIKE
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'DIM_CUSTOMER'))
BEGIN
    DROP TABLE Pynka.DIM_CUSTOMER
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'DIM_WEATHER'))
BEGIN
    DROP TABLE Pynka.DIM_WEATHER
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'DIM_TIME'))
BEGIN
    DROP TABLE Pynka.DIM_TIME
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'ENUM_MONTH'))
BEGIN
    DROP TABLE Pynka.ENUM_MONTH
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'ENUM_WEEKDAY'))
BEGIN
    DROP TABLE Pynka.ENUM_WEEKDAY
END;