USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMBrandLowGP]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO














-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/28/2009
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMBrandLowGP]
	(
		@pharmid nvarchar(50)
	)
AS
BEGIN
	-- BRAND WITH GP Under 5%
	SET NOCOUNT ON;

SELECT     MAX([Bill Code]) as BillCode, MIN(DrugName) as DrugName, MIN(v_Rx30Master.NDC) as NDC,MIN (PS) AS PS, MIN(UNIT_COST) as UnitCost,MIN(BB) as AWP,MIN(CSP) as CSP,
[RX Nbr], MIN([Rx Date]) as RxDate, MAX([Qty Dispensed]) as qty, MIN([Total Price]) as TotalPrice, 
Convert(decimal(30,2),((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)) as TotalAcqCost, 
Convert(decimal(30,2),MIN([Total Price]) - ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)) as profit,
Convert(decimal(30,2),((MIN([Total Price]) - ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)))/MIN([Total Price]) * 100) as GP
FROM         v_Rx30Master LEFT OUTER JOIN CHPH_1 ON v_Rx30Master.ACCT_NO = CHPH_1.Store AND v_Rx30Master.NDC = CHPH_1.NDC  
WHERE     ([Pharm ID] = @pharmid AND DateDiff(dd,CHPH_1.INV_DATE,getdate()) < 360) AND NDCGI1=2 AND [Qty Dispensed] <> 0 AND ((UNIT_COST/PS) * [Qty Dispensed]) > 0
AND ([Total Price] - ((([Qty Dispensed]/CSP)/PS) * [UNIT_COST]))/[Total Price] * 100 < 5 AND RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=1)
GROUP BY [Rx Nbr]
ORDER BY ((MIN([Total Price]) - ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST))/(MIN([Total Price]))) * 100 
END


























GO
