INSERT INTO Pynka.DIM_CUSTOMER VALUES(11242, 'Josh', 'Test', NULL, 'Baltimore', 'Central', 'US', 'North America');
INSERT INTO Pynka.DIM_PRODUCT VALUES(710, 'TEST', 123.40, 'Silver', NULL, NULL, 3.50, 40, 1);
INSERT INTO Pynka.DIM_SALESPERSON VALUES(280, 'John', 'Brooks', 'Mr.', 'M', 'US', 'North America');

INSERT INTO Pynka.FACT_SALES VALUES(NULL, 11185, NULL, 20160220, 20160323, 2, 34.90, 0.00, 34.90);
INSERT INTO Pynka.FACT_SALES VALUES(707, NULL, NULL, 20160123, 20160131, 2, 34.90, 0.00, 34.90);
INSERT INTO Pynka.FACT_SALES VALUES(1500, 11185, NULL, 20150404, 20150416, 2, 34.90, 0.00, 34.90);
INSERT INTO Pynka.FACT_SALES VALUES(707, 40000, NULL, 20130712, 20130720, 2, 34.90, 0.00, 34.90);