USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GM90Analysis]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 06/18/2009
-- Description:	GM Analysis sorted by BIN for 90 days supply
-- =============================================
CREATE PROCEDURE [dbo].[spud_GM90Analysis]
	(
		@DF numeric(10,2)
	)
AS
BEGIN
	SET NOCOUNT ON;


SELECT    BIN, Case [Brand Type] WHEN 'SINGLE-SOURCE BRAND' THEN 'SSB' WHEN 'MULTI-SOURCE BRAND' THEN 'MSB' WHEN 'MULTI-SOURCE GENERIC' THEN 'GEN' END as [Brand Type], 
SUM([TRx Count]) AS TotalPresc, SUM([Total  AWP]) AS TotalAWP, SUM([Patient Paid Amount]) AS PatientPaid, 
                      SUM([Total Paid Amount]) AS PlanPaid, SUM([Patient Paid Amount]) + SUM([Total Paid Amount]) AS Sales, SUM(TotalWAC) AS TotalWAC, 
                      SUM([Patient Paid Amount]) + SUM([Total Paid Amount]) - SUM(TotalWAC) AS GMDollars, 
((SUM([Patient Paid Amount]) + SUM([Total Paid Amount])) - SUM(TotalWAC))/SUM([TRx Count]) As MarginDollarsPerRx,
(1-(((SUM([Patient Paid Amount]) + SUM([Total Paid Amount])) - (SUM([TRx Count]) * @DF/100)) / SUM([Total  AWP])))*100 as EffectAWPDiscount
FROM         tmp_MagmaClaims
WHERE TotalWAC <> 0
GROUP BY BIN, [Brand Type]
ORDER BY BIN,[Brand Type] DESC

END


GO
