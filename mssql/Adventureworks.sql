/*
File name: C:/users/rgt/Documents/Adventureworks.sql
Creation date: 06/22/2023
Created by PostgreSQL to MSSQL 3.1 [Demo]
--------------------------------------------------
More conversion tools at http://www.convert-in.com
*/
USE master;
GO

if exists(select * from master.sys.databases where name='Adventureworks') DROP DATABASE [Adventureworks];
CREATE DATABASE [Adventureworks];
GO
USE [Adventureworks];
GO
SET QUOTED_IDENTIFIER ON;
GO
IF NOT EXISTS (SELECT  SCHEMA_NAME FROM    INFORMATION_SCHEMA.SCHEMATA WHERE   SCHEMA_NAME = 'person' ) BEGIN EXEC sp_executesql N'CREATE SCHEMA [person]' END
GO

/*
Table structure for table '[person].[person]'
*/

IF OBJECT_ID ('[person].[person]', 'U') IS NOT NULL
DROP TABLE [person].[person];
GO
CREATE TABLE [person].[person] (
	[businessentityid] INT NOT NULL,
	[persontype] NVARCHAR(2)  NOT NULL,
	[namestyle] BIT NOT NULL DEFAULT 0,
	[title] NVARCHAR(8) ,
	[firstname] NVARCHAR(50)  NOT NULL,
	[middlename] NVARCHAR(50) ,
	[lastname] NVARCHAR(50)  NOT NULL,
	[suffix] NVARCHAR(10) ,
	[emailpromotion] INT NOT NULL DEFAULT 0,
	[additionalcontactinfo] NVARCHAR(MAX),
	[demographics] NVARCHAR(MAX),
	[rowguid]  uniqueidentifier NOT NULL DEFAULT 'uuid_generate_v1()',
	[modifieddate] DATETIME2 NOT NULL DEFAULT CURRENT_TIMESTAMP
)
GO

/*
Dumping data for table '[person].[person]'
*/

SET IDENTITY_INSERT [person].[person] ON;
GO
INSERT INTO [person].[person] ([businessentityid], [persontype], [namestyle], [title], [firstname], [middlename], [lastname], [suffix], [emailpromotion], [additionalcontactinfo], [demographics], [rowguid], [modifieddate]) VALUES (1, N'EM', 0, NULL, N'Ken', N'J', N'Sánchez', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '92c4279f-1207-48a3-8448-4636514eb7e2', '2009-01-07'), (2, N'EM', 0, NULL, N'Terri', N'Lee', N'Duffy', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'd8763459-8aa8-47cc-aff7-c9079af79033', '2008-01-24'), (3, N'EM', 0, NULL, N'Roberto', NULL, N'Tamburello', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'e1a2555e-0828-434b-a33b-6f38136a37de', '2007-11-04'), (4, N'EM', 0, NULL, N'Rob', NULL, N'Walters', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'f2d7ce06-38b3-4357-805b-f4b6b71c01ff', '2007-11-28'), (5, N'EM', 0, N'Ms.', N'Gail', N'A', N'Erickson', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'f3a3f6b4-ae3b-430c-a754-9f2231ba6fef', '2007-12-30'), (6, N'EM', 0, N'Mr.', N'Jossef', N'H', N'Goldberg', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '0dea28fd-effe-482a-afd3-b7e8f199d56f', '2013-12-16'), (7, N'EM', 0, NULL, N'Dylan', N'A', N'Miller', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'c45e8ab8-01be-4b76-b215-820c8368181a', '2009-02-01'), (8, N'EM', 0, NULL, N'Diane', N'L', N'Margheim', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'a948e590-4a56-45a9-bc9a-160a1cc9d990', '2008-12-22'), (9, N'EM', 0, NULL, N'Gigi', N'N', N'Matthew', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '5fc28c0e-6d36-4252-9846-05caa0b1f6c5', '2009-01-09'), (10, N'EM', 0, NULL, N'Michael', NULL, N'Raheem', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'ca2c740e-75b2-420c-9d4b-e3cbc6609604', '2009-04-26'), (11, N'EM', 0, NULL, N'Ovidiu', N'V', N'Cracium', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'd2cc2577-ef6b-4408-bd8c-747337fe5645', '2010-11-28')
GO

INSERT INTO [person].[person] ([businessentityid], [persontype], [namestyle], [title], [firstname], [middlename], [lastname], [suffix], [emailpromotion], [additionalcontactinfo], [demographics], [rowguid], [modifieddate]) VALUES (12, N'EM', 0, NULL, N'Thierry', N'B', N'D''Hers', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'fa263c7f-600d-4e89-8dcd-0978f3530f5f', '2007-12-04'), (13, N'EM', 0, N'Ms.', N'Janice', N'M', N'Galvin', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '34eb99e0-7042-4dc1-a2fd-bda290ff0e07', '2010-12-16'), (14, N'EM', 0, NULL, N'Michael', N'I', N'Sullivan', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '9a7501de-5caf-4700-ab07-cc81102bb696', '2010-12-23'), (15, N'EM', 0, NULL, N'Sharon', N'B', N'Salavaria', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'beba63cb-13f1-4b76-a3de-fe9ac283a94c', '2011-01-11'), (16, N'EM', 0, NULL, N'David', N'M', N'Bradley', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '2cc8ba72-5dbb-497f-b941-775517993638', '2007-12-13'), (17, N'EM', 0, NULL, N'Kevin', N'F', N'Brown', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '9ee4713e-b3d8-4409-bc5e-dec62497f43a', '2007-01-19'), (18, N'EM', 0, NULL, N'John', N'L', N'Wood', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'fe21bda7-9327-4d13-89cc-8ca5cee8f21e', '2011-01-31'), (19, N'EM', 0, NULL, N'Mary', N'A', N'Dempsey', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '36f04305-6769-4e61-9143-048b2b7afa20', '2011-02-07'), (20, N'EM', 0, NULL, N'Wanida', N'M', N'Benshoof', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '1e7e56f4-a583-4e3f-a3fe-ba8a71096d10', '2010-12-31'), (21, N'EM', 0, NULL, N'Terry', N'J', N'Eminhizer', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '6a288fe0-d9cb-4da2-beea-51370220490c', '2009-02-23'), (22, N'EM', 0, NULL, N'Sariya', N'E', N'Harnpadoungsataya', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '276e0eb5-0ce7-443f-987f-b7ef293c0930', '2008-12-05')
GO

INSERT INTO [person].[person] ([businessentityid], [persontype], [namestyle], [title], [firstname], [middlename], [lastname], [suffix], [emailpromotion], [additionalcontactinfo], [demographics], [rowguid], [modifieddate]) VALUES (23, N'EM', 0, NULL, N'Mary', N'E', N'Gibson', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'b10cf8eb-5589-4a81-b1bd-051c5759ce06', '2009-01-05'), (24, N'EM', 0, N'Ms.', N'Jill', N'A', N'Williams', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '3f605060-96ad-4201-9be2-bfe7a3c4e468', '2009-01-11'), (25, N'EM', 0, NULL, N'James', N'R', N'Hamilton', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '423fe59b-7975-4a7e-b8d2-87105c286d4c', '2009-01-27'), (26, N'EM', 0, NULL, N'Peter', N'J', N'Krebs', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '6f32f507-290e-4a96-a045-f445eae4337f', '2008-11-24'), (27, N'EM', 0, NULL, N'Jo', N'A', N'Brown', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'edd8add6-f7fd-4086-bfdc-b4fd3e6ad8d7', '2008-02-20'), (28, N'EM', 0, NULL, N'Guy', N'R', N'Gilbert', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'd366a33a-8ede-42bd-bf79-3e7fb9713fe1', '2006-06-23'), (29, N'EM', 0, NULL, N'Mark', N'K', N'McArthur', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '667fa3ba-b877-4bcc-a752-e461040e2ddd', '2009-01-16'), (30, N'EM', 0, NULL, N'Britta', N'L', N'Simon', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '5090c9a8-e39e-4a4d-9133-14e7cf07998b', '2009-01-22'), (31, N'EM', 0, NULL, N'Margie', N'W', N'Shoop', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '5ea8a3da-7bea-4adc-85f5-c934e2033825', '2008-12-28'), (32, N'EM', 0, NULL, N'Rebecca', N'A', N'Laszlo', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '686bd5af-6f30-4633-944b-3c1916cb4ca2', '2008-12-22'), (33, N'EM', 0, NULL, N'Annik', N'O', N'Stahl', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'bfa2bdc8-208a-447b-8a4e-72a215e9e134', '2008-12-10')
GO

INSERT INTO [person].[person] ([businessentityid], [persontype], [namestyle], [title], [firstname], [middlename], [lastname], [suffix], [emailpromotion], [additionalcontactinfo], [demographics], [rowguid], [modifieddate]) VALUES (34, N'EM', 0, NULL, N'Suchitra', N'O', N'Mohan', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '7e239d8b-00bf-42d6-ac6b-4ea718dbc2b3', '2009-02-09'), (35, N'EM', 0, NULL, N'Brandon', N'G', N'Heidepriem', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '4cc8edc2-5502-4550-8089-9b3cc6006490', '2009-02-01'), (36, N'EM', 0, NULL, N'Jose', N'R', N'Lugo', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '54655e98-b81a-4041-8fa4-9349c018521f', '2009-02-03'), (37, N'EM', 0, NULL, N'Chris', N'O', N'Okelberry', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '5b16ca18-703b-48e8-ab3e-ca158c854808', '2009-02-28'), (38, N'EM', 0, NULL, N'Kim', N'B', N'Abercrombie', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '9a2163b3-2f4d-4f9a-91bd-07d326140f9c', '2010-01-09'), (39, N'EM', 0, NULL, N'Ed', N'R', N'Dudenhoefer', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '83c88383-9c3e-42c5-ae09-965b5f9ef5b1', '2010-01-29'), (40, N'EM', 0, NULL, N'JoLynn', N'M', N'Dobney', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'e8e5c9da-f808-4439-bf5c-b28236bb8467', '2007-12-19'), (41, N'EM', 0, NULL, N'Bryan', NULL, N'Baker', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'a32e8274-08dc-4596-ab1f-ba6263cbc676', '2009-01-14'), (42, N'EM', 0, NULL, N'James', N'D', N'Kramer', NULL, 2, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'f4f040e0-02a0-4905-b964-2e894d0f0b94', '2008-12-20'), (43, N'EM', 0, NULL, N'Nancy', N'A', N'Anderson', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '0681c8f9-d2ec-47d9-9bd4-751b14eaed50', '2008-12-26'), (44, N'EM', 0, NULL, N'Simon', N'D', N'Rapier', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'ff8edbfc-a9a3-4c5d-8aff-df4d6f18daff', '2008-12-01')
GO

INSERT INTO [person].[person] ([businessentityid], [persontype], [namestyle], [title], [firstname], [middlename], [lastname], [suffix], [emailpromotion], [additionalcontactinfo], [demographics], [rowguid], [modifieddate]) VALUES (45, N'EM', 0, NULL, N'Thomas', N'R', N'Michaels', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '2caf9adc-7a33-48cf-b4b7-3c57d9de39c4', '2009-02-19'), (46, N'EM', 0, NULL, N'Eugene', N'O', N'Kogan', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'fb0068ea-49d4-4e82-9895-2680cf59385e', '2009-02-01'), (47, N'EM', 0, NULL, N'Andrew', N'R', N'Hill', NULL, 1, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'b6439f4f-e57d-4293-b0c8-8919591055a3', '2009-02-15'), (48, N'EM', 0, NULL, N'Ruth', N'Ann', N'Ellerbrock', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', '9be35b50-2024-4785-9393-7c7ab8d9634d', '2007-12-30'), (49, N'EM', 0, NULL, N'Barry', N'K', N'Johnson', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'cb28be2e-de93-4409-bace-df6042d04815', '2013-11-29'), (50, N'EM', 0, NULL, N'Sidney', N'M', N'Higa', NULL, 0, NULL, N'<IndividualSurvey xmlns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey"><TotalPurchaseYTD>0</TotalPurchaseYTD></IndividualSurvey>', 'a20bb9f5-3bbb-4ab6-9bfa-6aed32c30204', '2008-01-26')
GO

SET IDENTITY_INSERT [person].[person] OFF;
GO
ALTER TABLE [person].[person] ADD PRIMARY KEY([businessentityid]) 
GO
DROP SEQUENCE IF EXISTS [dbo].[businessentity_businessentityid_seq]
GO
CREATE SEQUENCE [dbo].[businessentity_businessentityid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
DROP SEQUENCE IF EXISTS [dbo].[stateprovince_stateprovinceid_seq]
GO
CREATE SEQUENCE [dbo].[stateprovince_stateprovinceid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
DROP SEQUENCE IF EXISTS [dbo].[address_addressid_seq]
GO
CREATE SEQUENCE [dbo].[address_addressid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
DROP SEQUENCE IF EXISTS [dbo].[addresstype_addresstypeid_seq]
GO
CREATE SEQUENCE [dbo].[addresstype_addresstypeid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
DROP SEQUENCE IF EXISTS [dbo].[contacttype_contacttypeid_seq]
GO
CREATE SEQUENCE [dbo].[contacttype_contacttypeid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
DROP SEQUENCE IF EXISTS [dbo].[emailaddress_emailaddressid_seq]
GO
CREATE SEQUENCE [dbo].[emailaddress_emailaddressid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
DROP SEQUENCE IF EXISTS [dbo].[phonenumbertype_phonenumbertypeid_seq]
GO
CREATE SEQUENCE [dbo].[phonenumbertype_phonenumbertypeid_seq] START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647
GO
