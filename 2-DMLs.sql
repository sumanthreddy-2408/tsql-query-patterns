
-- SWITCH TO DARSHILDB
USE DarshilDB;

-- PATTERN-1 [Deduplication]

-- PATTERN-2 [Running Totals]

-- PATTERN-3 [MoM and YoY Growth] 
INSERT INTO P3_Hosts (Country,HostId,HostName,SignupDate) 
VALUES 
	('USA', 1 , 'Alice Johnson' , '2020-01-15'),
	('USA', 2 , 'Bob smith' , '2020-03-22'),
	('Canada', 3 , 'Carol Davis' , '2020-03-22'),
	('USA', 4 , 'David Wilison' , '2021-02-14'),
	('UK', 5 , 'Emma Brown' , '2021-05-20'),
	('USA', 6 , 'Frank MIller' , '2021-08-30'),
	('Canada', 7 , 'Grace Lee' , '2021-11-05'),
	('USA', 8 , 'Henry Jones' , '2022-01-10')
;

-- PATTERN-4 [Gaps and Islands]
INSERT INTO P4_Logins (UserId,LoginId,LoginDate) 
VALUES 
	(1,1,'2024-01-01'),
	(1,2,'2024-01-02'),
	(1,3,'2024-01-03'),
	(2,4,'2024-01-01'),
	(2,5,'2024-01-02'),
	(3,6,'2024-01-05'),
	(3,7,'2024-01-06'),
	(3,8,'2024-01-07')
;

-- PATTERN-5 [Sessionization]
INSERT INTO P5_Events (EventId,UserId,EventType,EventTimestamp) 
VALUES 
	(40001,2001,'view','2024-01-01 10:00:00'),
	(40002,2001,'click','2024-01-01 10:31:00'),
	(40003,2001,'view','2024-01-01 10:55:00'),
	(40004,2001,'view','2024-01-01 11:06:00'),
	(40005,2001,'view','2024-01-01 11:12:00'),
	(40006,2001,'view','2024-01-01 11:44:00'),
	(40015,2004,'view','2024-01-01 10:00:00'),
	(40016,2004,'click','2024-01-01 10:30:00'),
	(40017,2004,'purchase','2024-01-01 10:43:00')
;

-- PATTERN-6 [Funnel Analysis]
INSERT INTO P6_EVENTS (EventId,UserId,EventType,EventDate) 
VALUES 
('E001','U001','login','2024-01-02'),
('E002','U001','view','2024-01-05'),
('E003','U001','view','2024-01-08'),
('E004','U001','view','2024-01-12'),
('E005','U001','purchase','2024-01-20'),
('E006','U002','login','2024-01-03'),
('E007','U002','view','2024-01-06'),
('E008','U002','view','2024-01-08'),
('E009','U002','view','2024-01-10'),
('E010','U002','view','2024-01-12'),
('E011','U003','purchase','2024-01-07') 
;

INSERT INTO P6_Users (UserId,SignupDate) 
VALUES 
('U001','2024-01-01'),
('U002','2024-01-02'),
('U003','2024-01-03'),
('U004','2024-01-05')
;

-- PATTERN-7 [Retention Cohorts]
INSERT INTO P7_Transactions ([UserId],[TransactionDate],[Amount])
VALUES
(20240100,'2024-01-08',88.28),
(20240100,'2024-02-08',21.66),
(20240100,'2024-03-12',95.95),
(20240101,'2024-01-21',56.86),
(20240101,'2024-01-31',70.68),
(20240101,'2024-03-25',73.34),
(20240102,'2024-01-07',62.99),
(20240200,'2024-02-25',49.5),
(20240200,'2024-03-09',27.74),
(20240201,'2024-02-27',31.53)
;

-- PATTERN-8 [Top-N per Group]

-- PATTERN-9 [Pivot & Cross-Tab]
INSERT INTO P9_Sales ([SaleId],[Product],[Region],[Amount])
VALUES 
(1,'Apple','North',100),
(2,'Apple','South',200),
(3,'Orange','North',150),
(4,'Orange','East',250),
(5,'Apple','North',50),
(6,'Banana','West',75),
(7,'Banana','North',25),
(8,'Orange','South',100)
;

-- PATTERN-10 [Self Joins]

-- PATTERN-11 [Hierarchy Traversal]

-- PATTERN-12 [Moving Averages]
