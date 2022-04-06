IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'FACT_SALES'))
BEGIN
    DROP TABLE Pynka.FACT_SALES
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
                 AND  TABLE_NAME = 'ENUM_MONTHS'))
BEGIN
    DROP TABLE Pynka.ENUM_MONTHS
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'ENUM_WEEKDAYS'))
BEGIN
    DROP TABLE Pynka.ENUM_WEEKDAYS
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
                 AND  TABLE_NAME = 'DIM_PRODUCT'))
BEGIN
    DROP TABLE Pynka.DIM_PRODUCT
END;

IF (EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'Pynka' 
                 AND  TABLE_NAME = 'DIM_SALESPERSON'))
BEGIN
    DROP TABLE Pynka.DIM_SALESPERSON
END;