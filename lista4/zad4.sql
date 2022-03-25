ALTER TABLE Pynka.DIM_CUSTOMER
ADD CONSTRAINT dim_cust_pk PRIMARY KEY (CustomerID);

ALTER TABLE Pynka.DIM_PRODUCT
ADD CONSTRAINT dim_prod_pk PRIMARY KEY (ProductID);

ALTER TABLE Pynka.DIM_SALESPERSON
ADD CONSTRAINT dim_salespers_pk PRIMARY KEY (SalesPersonID);

ALTER TABLE Pynka.FACT_SALES
ADD CONSTRAINT fact_sales_fk_prod FOREIGN KEY (ProductID) REFERENCES Production.Product(ProductID);

ALTER TABLE Pynka.FACT_SALES
ADD CONSTRAINT fact_sales_fk_cust FOREIGN KEY (CustomerID) REFERENCES Sales.Customer(CustomerID);

ALTER TABLE Pynka.FACT_SALES
ADD CONSTRAINT fact_sales_fk_salesper FOREIGN KEY (SalesPersonID) REFERENCES Sales.SalesPerson(BusinessEntityID);