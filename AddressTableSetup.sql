USE master
GO

-- Create a database named "Samples"
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Samples')
  CREATE DATABASE Samples;
GO

USE Samples
GO

-- Create sample Address table
IF OBJECT_ID('dbo.Address') IS NOT NULL
  DROP TABLE dbo.Address;

CREATE TABLE dbo.Address (
  AddressId int NOT NULL IDENTITY(1,1)
  ,StreetAddress nvarchar(500) NULL
  ,City nvarchar(500) NULL
  ,[State] nvarchar(2) NULL
  ,PostalCode nvarchar(50) NULL
  ,[GeocodeStatus] nvarchar(50) NULL
  ,Latitude decimal(9,7) NULL
  ,Longitude decimal(10,7) NULL
  ,Point geography NULL
  CONSTRAINT pkAddress PRIMARY KEY CLUSTERED (AddressId)
);

-- Create table for geocode results
IF OBJECT_ID('dbo.AddressGeocodeResult') IS NOT NULL
  DROP TABLE dbo.AddressGeocodeResult;

CREATE TABLE dbo.AddressGeocodeResult (
   AddressId int NOT NULL
  ,CountryCode nvarchar(2) NULL
  ,County  nvarchar(500) NULL
  ,StateProvince nvarchar(500) NULL
  ,PostalCode nvarchar(500) NULL
  ,PostalCity nvarchar(500) NULL
  ,Municipality nvarchar(500) NULL
  ,MunicipalitySubdivision nvarchar(500) NULL
  ,StreetNumber nvarchar(500) NULL
  ,StreetName nvarchar(500) NULL
  ,Latitude decimal(9,7) NULL
  ,Longitude decimal(10,7) NULL
  ,ResultId nvarchar(500) NULL
  ,Score decimal(5,2) NULL
  ,ResultType nvarchar(50) NULL
  ,GeocodeResponse nvarchar(max)
  CONSTRAINT pkAddressGeocodeResult PRIMARY KEY CLUSTERED (AddressId)
)

-- Insert sample addresses
INSERT INTO dbo.Address (StreetAddress, City, State, PostalCode, GeocodeStatus)
VALUES
  ('50 North Duke Street','Lancaster','PA','17608','Unprocessed'),
  ('124 E Main St','Ephrata','PA','17522','Unprocessed'),
  ('Not an address','','',NULL,'Unprocessed'),
  ('123 No Where Dr','Quarryville','PA','','Unprocessed')