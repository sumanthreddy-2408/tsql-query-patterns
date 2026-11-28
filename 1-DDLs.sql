
-- CREATE A DATABASE CALLED DARSHILDB TO HOLD ALL THE DATASETS
CREATE DATABASE DarshilDB;
GO

-- SWITCH TO DARSHILDB
USE DarshilDB;

-- PATTERN-1 [Deduplication]

-- PATTERN-2 [Running Totals]

-- PATTERN-3 [MoM and YoY Growth]
CREATE TABLE P3_Hosts (
	Country VARCHAR(50),
	HostId INT,
	HostName VARCHAR(50),
	SignupDate DATE 
)
;

-- PATTERN-4 [Gaps and Islands]
CREATE TABLE P4_Logins (
	UserId INT,
	LoginId INT,
	LoginDate DATE 
)
;

-- PATTERN-5 [Sessionization]

-- PATTERN-6 [Funnel Analysis]
CREATE TABLE P6_Events (
	EventId VARCHAR(50),
	UserId VARCHAR(50),
	EventType VARCHAR(50),
	EventDate DATE 
);

CREATE TABLE P6_Users (
	UserId VARCHAR(50),
	SignupDate DATE 
)
;

-- PATTERN-7 [Retention Cohorts]
CREATE TABLE P7_Transactions (
	[UserId] INT,
	[TransactionDate] DATE,
	[Amount] FLOAT
);

-- PATTERN-8 [Top-N per Group]

-- PATTERN-9 [Pivot & Cross-Tab]
CREATE TABLE P9_Sales (
	[SaleId] INT,
	[Product] VARCHAR(100),
	[Region] VARCHAR(100),
	[Amount] INT 
)
;

-- PATTERN-10 [Self Joins]

-- PATTERN-11 [Hierarchy Traversal]

-- PATTERN-12 [Moving Averages]
