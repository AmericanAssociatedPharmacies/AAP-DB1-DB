USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_ApiCSReportSummary]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Chris McKinnie
-- Create date: 11/22/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_ApiCSReportSummary]

	@apiaccountno varchar(50)
	, @datefrom datetime
	, @datethrough datetime

AS

BEGIN

SET NOCOUNT ON;
	
	DECLARE @PMID INT

	SELECT @PMID = dt.PMID
	FROM(SELECT PMID
			FROM RXMaster.[dbo].[vwAPIAccount]
			WHERE [APIAccountNo] = @apiaccountno

			UNION

			SELECT PMID
			FROM RXMaster.[dbo].[vwAPIAccount]
			WHERE [APIAccountNumHistorical] = @apiaccountno
			) AS dt



	SELECT s.NDC
	, replace(replace(ItemDescription,'!',''),'*','') as [DescriptionSize]
	, SUM(Qty) as [QuantityShipped]
	from api.dbo.apisalesdetail AS s
	--INNER JOIN RXMaster.dbo.vwAPIAccount AS a ON s.WHAccountID = a.APIAccountNo
	--									AND s.InvDate BETWEEN a.APIEffectiveDate AND a.APIQuitDate
	--where (ItemDescription like '%!%' or ItemDescription like '%*%') -- Removed due to S2K
	WHERE s.ItemGrp IN ('B02', 'G02', 'G03', 'G04')
	and invdate >= @datefrom
	and invdate <= @datethrough
	AND PMID = @PMID
	---and WHAccountID = @apiaccountno
	group by s.NDC, Itemdescription
	order by s.NDC


END


GO
