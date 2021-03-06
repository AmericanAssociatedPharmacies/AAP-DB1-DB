USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMBrandforGen]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


















-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/30/2009
-- Description:	BRAND DISPENSED WHEN GENERIC AVAILABLE REPORT FOR STORES
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMBrandforGen]
	(
		@pharmid nvarchar(50)
	)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT   MIN(DAW) as DAW,[RX Nbr], MIN([Rx Date]) as RxDate, MIN(v_Rx30Master.NDC)as NDC,  MIN(DrugName) as DrugName, MIN (PS) AS PS, MIN(UNIT_COST) as UnitCost,
	 MIN([Qty Dispensed]) as qty, MIN([Bill Code]) as BillCode, MIN(v_Rx30Master.Doctor) as Doctor, MIN([Total Price]) as SellPrice, 
	Convert(decimal(30,2),((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)) as TotalAcqCost, 
	Convert(decimal(30,2),MIN([Total Price]) - ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)) as profit,
	Convert(decimal(30,2),((MIN([Total Price]) - ((MIN([Qty Dispensed])/MIN(CSP))/MIN(PS)) * MIN(UNIT_COST)))/MIN([Total Price]) * 100) as GP
	FROM    v_Rx30Master LEFT OUTER JOIN CHPH_1 ON v_Rx30Master.ACCT_NO = CHPH_1.Store AND v_Rx30Master.NDC = CHPH_1.NDC  
	WHERE     ([Pharm ID] = @pharmid AND DateDiff(dd,CHPH_1.INV_DATE,getdate()) < 30) AND NDCGI1 = 1 AND Brand = 'N' AND GMI=2
	AND (GTI = 3 OR GTI=4) AND [Qty Dispensed] <> 0 AND ((UNIT_COST/PS) * [Qty Dispensed]) > 0 AND RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=1) 
--AND (Month([Rx Date]) = Month(getdate()) AND Year([Rx Date]) =  Year(getdate()))
	GROUP BY [Rx Nbr]
	ORDER by DAW

END


















GO
