USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMLGenAvail]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN	
-- Create date: 05/01/09
-- Description:	LESS EXPENSIVE GENERIC ALTERNATIVE AVAILABLE
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMLGenAvail]
	(
		@pharmid nvarchar(50)
	)


AS
BEGIN
	SET NOCOUNT ON;
		SELECT
        ITEM_DESCR, 
		SHIP_QTY, 
		EXT_Cost as PurchasePrice, 
		Invoice_no,
		PS,		
		BestNDC as NDC,
		Convert(decimal(30,2),PricePerUnit * PS * SHIP_QTY ) as BestPrice, 
		v_CHPHNABPGCN.GCN,
		Convert(decimal(30,2),EXT_Cost - (PricePerUnit * PS * SHIP_QTY)) as MoneyLost
		FROM v_CHPHNABPGCN --GETS THE LOWEST PRICED GCN OF THAT NDC IN CHPH INVOICE FOR THAT STORE
		WHERE SHIP_QTY > 0 
		AND  ([NABP] = @pharmid AND DateDiff(dd,INV_DATE,getdate()) < 30 AND INV_DATE < getdate()) 
		AND (GTI = 3 OR GTI=4) 
		AND NDCGI1 = 1 	
		AND Brand='N' 		
		AND EXT_Cost > (PricePerUnit * PS * SHIP_QTY)
		--AND Convert(decimal(30,2),EXT_Cost - (PricePerUnit * PS * SHIP_QTY)) > '0.10'
		AND INVOICE_No = (Select Max(Invoice_No) as Inv FROM v_CHPHNABPGCN ch WHERE ch.GCN = v_CHPHNABPGCN.GCN AND ch.NDC = v_CHPHNABPGCN.NDC AND SHIP_QTY > 0 AND (NABP = @pharmid AND INV_DATE < getdate() AND DateDiff(dd,INV_DATE,getdate()) < 30) AND Brand ='N' AND (GTI = 3 OR GTI=4) 
		AND NDCGI1 = 1 	AND EXT_COST > (PricePerUnit * PS * SHIP_QTY) GROUP BY NDC)
		ORDER BY Convert(decimal(30,2),EXT_Cost - (PricePerUnit * PS * SHIP_QTY)) DESC


END










GO
