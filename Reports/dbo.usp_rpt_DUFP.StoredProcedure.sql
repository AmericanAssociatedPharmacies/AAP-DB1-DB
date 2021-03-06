USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_rpt_DUFP]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:	 <David Bohler>
-- Original Create date: <08/29/2017>
-- Description: <Days Until Forst Purchase Report>
-- Updated:	 <03/22/2018> 
-- =============================================
CREATE PROCEDURE [dbo].[usp_rpt_DUFP]

-- Add the parameters for the stored procedure here
@TM        VARCHAR(1000)
, @StartDate DATETIME      = NULL
, @EndDate   DATETIME      = NULL
, @APIStatus VARCHAR(500)  = NULL
AS
     SET NOCOUNT ON;
         BEGIN

	--Set default time values so that query will pull back a valid result set
             SET @StartDate = ISNULL(@StartDate, '19000101');
             SET @EndDate = ISNULL(@EndDate, DATEADD(dd, DATEDIFF(dd, 0, GETDATE()), 0));
    	
	--Split the multi-valued parameter
             DECLARE @T TABLE
(TM VARCHAR(5)
 PRIMARY KEY CLUSTERED
);
             INSERT INTO @T(TM)
                    SELECT DISTINCT
                           Item
                    FROM [dbo].[DelimitedSplit8K](@TM, ',');


	--Split the multi-valued parameter
             DECLARE @S TABLE
(APIStatus VARCHAR(10)
 PRIMARY KEY CLUSTERED
);
             INSERT INTO @S(APIStatus)
                    SELECT DISTINCT
                           Item
                    FROM [dbo].[DelimitedSplit8K](@APIStatus, ',');

	--Result set

             SELECT [TM]
                  , [PMID]
                  , [AccountName]
                  , [City]
                  , [State]
                  , [APIAccountNo]
                  , [APIStatus]
                  , [Email]
                  , [DateOpened]
                  , [FirstPurchaseDate]
                  , [Days Before First Purchase]
                  , [LastPurchaseDate]
             FROM [dbo].[v_TimeToMakeFirstPurchase] AS A
             WHERE EXISTS
(
    SELECT 1
    FROM @T AS t
    WHERE t.TM = A.TM
)
                   AND EXISTS
(
    SELECT 1
    FROM @S AS s
    WHERE s.APIStatus = a.APIStatus
)
                   AND [DateOpened] >= @StartDate
                   AND [DateOpened] < DATEADD(dd, 1, @EndDate); -- Changed to add a day 03/22/2018

         END;
GO
