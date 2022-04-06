UPDATE Pynka.DIM_PRODUCT SET Color='Unknown' WHERE Color IS NULL;
UPDATE Pynka.DIM_PRODUCT SET SubCategoryName='Unknown' WHERE SubCategoryName IS NULL;

UPDATE Pynka.DIM_CUSTOMER SET CountryRegionCode='000' WHERE CountryRegionCode IS NULL;
UPDATE Pynka.DIM_CUSTOMER SET [Group]='Unknown' WHERE [Group] IS NULL;

UPDATE Pynka.DIM_SALESPERSON SET CountryRegionCode='000' WHERE CountryRegionCode IS NULL;
UPDATE Pynka.DIM_SALESPERSON SET [Group]='Unknown' WHERE [Group] IS NULL;