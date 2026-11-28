
-- SWITCH TO DARSHILDB
USE DarshilDB;

-- PATTERN-1 [Deduplication]

-- PATTERN-2 [Running Totals]

-- PATTERN-3 [MoM and YoY Growth]
WITH YearlyHosts AS (
	SELECT
		SignupYear,
		COUNT(HostId) AS NewHosts
	FROM (
		SELECT 
			*,
			YEAR(SignupDate) AS SignupYear
		FROM [dbo].[P3_Hosts]
	) T 
	GROUP BY SignupYear
)
SELECT
	*,
	CAST((((NewHosts-PrevYearHosts)*100.0)/NULLIF(PrevYearHosts,0)) AS DECIMAL(38,2)) AS GrowthPCT 
FROM (
	SELECT 
		*,
		LAG(NewHosts) OVER(ORDER BY SignupYear ASC) AS PrevYearHosts 
	FROM YearlyHosts
) T
ORDER BY SignupYear ASC 
;

-- PATTERN-4 [Gaps and Islands]

-- PATTERN-5 [Sessionization]

-- PATTERN-6 [Funnel Analysis]
WITH UserStats AS (
	SELECT 
		U.UserId,
		COUNT(E.EventId) AS TotalEvents,
		SUM(CASE WHEN E.EventType = 'Purchase' THEN 1 ELSE 0 END) AS TotalPurchaseEvents
	FROM [dbo].[P6_Users] U 
	LEFT JOIN [dbo].[P6_Events] E 
		ON U.UserId = E.UserId 
	GROUP BY U.UserId 
), 
Funnel AS (
	SELECT 
		1 AS FunnelStageOrder,
		'signup' AS FunnelStage,
		COUNT(UserId) AS UsersCount  
	FROM UserStats 

	UNION ALL 

	SELECT 
		2 AS FunnelStageOrder,
		'activate' AS FunnelStage,
		SUM(CASE WHEN TotalEvents >= 1 THEN 1 ELSE 0 END) AS UsersCount 
	FROM UserStats 

	UNION ALL 

	SELECT 
		3 AS FunnelStageOrder,
		'engage' AS FunnelStage,
		SUM(CASE WHEN TotalEvents >= 5 THEN 1 ELSE 0 END) AS UsersCount 
	FROM UserStats 

	UNION ALL 

	SELECT 
		4 AS FunnelStageOrder,
		'convert' AS FunnelStage,
		SUM(CASE WHEN TotalPurchaseEvents >= 1 THEN 1 ELSE 0 END) AS UsersCount 
	FROM UserStats 
)
SELECT 
	FunnelStage,
	UsersCount,
	COALESCE((
		CAST(((CAST(UsersCount AS FLOAT)/LAG(UsersCount) OVER(ORDER BY FunnelStageOrder ASC)) * 100) AS DECIMAL(38,2))
	),0.00) AS ConversionFromPrevious,
	(
		CAST(((CAST(UsersCount AS FLOAT)/FIRST_VALUE(UsersCount) OVER(ORDER BY FunnelStageOrder ASC)) * 100) AS DECIMAL(38,2))
	) AS CummulativeConversion  
FROM Funnel  
ORDER BY FunnelStageOrder ASC 
;

-- PATTERN-7 [Retention Cohorts]
WITH UserCohorts AS (
	SELECT 
		UserId,
		DATETRUNC(MONTH,MIN(TransactionDate)) AS CohortMonth
	FROM [dbo].[P7_Transactions]
	GROUP BY UserId
),
CohortSizes AS (
	SELECT 
		CohortMonth,
		COUNT(UserId) AS CohortSize 
	FROM UserCohorts   
	GROUP BY CohortMonth
),
TransactionsWithCohortDetails AS (
	SELECT 
		T.UserId,
		UC.CohortMonth,
		CS.CohortSize,
		DATETRUNC(MONTH,T.TransactionDate) AS TransactionMonth,
		DATEDIFF(MONTH,UC.CohortMonth,DATETRUNC(MONTH,T.TransactionDate)) AS MonthNumber 
	FROM [dbo].[P7_Transactions] T
	INNER JOIN UserCohorts UC 
		ON T.UserId = UC.UserId 
	INNER JOIN CohortSizes CS 
		ON UC.CohortMonth = CS.CohortMonth
)
SELECT 
	FORMAT(CohortMonth,'yyyy-MM') AS CohortMonth,
	MonthNumber,
	COUNT(DISTINCT UserId) AS ActiveUsers,
	CAST( ( (CAST(COUNT(DISTINCT UserId) AS FLOAT) / MAX(CohortSize) ) * 100 ) AS DECIMAL(38,2) ) AS RetentionRate  
FROM TransactionsWithCohortDetails 
GROUP BY CohortMonth, MonthNumber 
ORDER BY CohortMonth ASC, MonthNumber ASC 
;

-- PATTERN-8 [Top-N per Group]

-- PATTERN-9 [Pivot & Cross-Tab]
SELECT 
	[Product],
	SUM(CASE WHEN Region = 'NORTH' THEN Amount ELSE 0.00 END) AS North,
	SUM(CASE WHEN Region = 'SOUTH' THEN Amount ELSE 0.00 END) AS South,
	SUM(CASE WHEN Region = 'EAST' THEN Amount ELSE 0.00 END) AS East,
	SUM(CASE WHEN Region = 'WEST' THEN Amount ELSE 0.00 END) AS West
FROM [dbo].[P9_Sales]
GROUP BY [Product]
ORDER BY [Product] ASC
;

-- PATTERN-10 [Self Joins]

-- PATTERN-11 [Hierarchy Traversal]

-- PATTERN-12 [Moving Averages]
