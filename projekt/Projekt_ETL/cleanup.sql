UPDATE Pynka.DIM_WEATHER SET Precipitation_Inches='Tiny' WHERE Precipitation_Inches='T';
UPDATE Pynka.DIM_WEATHER SET Events='None' WHERE Events IS NULL;
UPDATE Pynka.DIM_WEATHER SET Events='Rain' WHERE Events='rain';
UPDATE Pynka.DIM_CUSTOMER SET Cust_Zip_Code='Unknown' WHERE Cust_Zip_Code IS NULL;
UPDATE Pynka.DIM_CUSTOMER SET Cust_Zip_Code='Incorrect' 
	WHERE ISNUMERIC(Cust_Zip_Code) = 0 OR LEN(Cust_Zip_Code)>5 OR CAST(Cust_Zip_Code AS INT) NOT BETWEEN 501 AND 99950;
UPDATE Pynka.DIM_CUSTOMER SET Cust_Zip_Code=RIGHT('0000' + Cust_Zip_Code,5) WHERE ISNUMERIC(Cust_Zip_Code)=1;
/**
Ka¿dy zip code 5-cyfrowy, najmniejszy 00501, najwiêkszy 99950
*/