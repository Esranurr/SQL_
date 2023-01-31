-- SQL ASSIGNMENT-04


-- CREATE


CREATE DATABASE Manufacturer

USE Manufacturer


-- Create Tables

-- Create Component table

CREATE TABLE [Component](
    [comp_id]       INT PRIMARY KEY NOT NULL,
    [comp_name]     VARCHAR(50) NOT NULL,
    [description]   VARCHAR(50) NOT NULL,
    [quantity_comp] INT NOT NULL
    );


-- Create Product table

CREATE TABLE [Product](
    [prod_id]   INT IDENTITY(1,1) NOT NULL,
    [prod_name] VARCHAR(50),
    [quantity]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([prod_id] ASC)
    );


-- Create Suppiler table

CREATE TABLE [Supplier](
    [supp_id]       INT PRIMARY KEY NOT NULL,
    [supp_name]     VARCHAR(50) NULL,
    [supp_location] VARCHAR(50) NOT NULL,
    [supp_country]  VARCHAR(50) NOT NULL,
    [is_active]     BIT NOT NULL
    );


-- Create Prod_Comp table

CREATE TABLE [Prod_Comp](
    [prod_id]       INT,
    [comp_id]       INT,
    [quantity_comp] INT,
    FOREIGN KEY ([prod_id]) REFERENCES [Product]([prod_id]),
    FOREIGN KEY ([comp_id]) REFERENCES [Component]([comp_id])
    );


-- Create Comp_Sump table

CREATE TABLE [Comp_Sump](
    [supp_id]       INT NOT NULL,
    [comp_id]       INT NOT NULL,
    [order_date]    DATE NOT NULL,
    [quantity]      INT NOT NULL,
    FOREIGN KEY ([supp_id]) REFERENCES [Supplier]([supp_id]),
    FOREIGN KEY ([comp_id]) REFERENCES [Component]([comp_id])
    );

