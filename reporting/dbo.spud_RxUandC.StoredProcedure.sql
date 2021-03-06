USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_RxUandC]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 07/01/2009
-- Description:	CLAIMS PAID AT SUBMITTED COST RX30 DATA
-- =============================================
CREATE PROCEDURE [dbo].[spud_RxUandC]
	(
		@RxFrom datetime,
		@RxTo	datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 

Select [Pharm ID],[Bin Nbr], PCN, [Group Nbr], NDC,DrugName,
		CASE 
			WHEN NDCGI1 = 1 AND GNI=1 THEN 'MULTI-SOURCE GENERIC' 
			WHEN NDCGI1 = 2 AND GNI=2 THEN 'SINGLE-SOURCE BRAND'
			WHEN NDCGI1 = 1 AND GNI=2 THEN 'MULTI-SOURCE BRAND' 
			WHEN GMI = 0 AND GNI=0 AND GTI = 0 THEN 'NON-DRUG ITEM' 
		END
		as BrandType,
		DAW,[Day Supply],[Qty Dispensed],BB * [Qty Dispensed] as TotalAWP,[Patient Paid] as PatientPaid,[Plan Amount] as PlanAmount,[Fee Paid],[U and C]
	  from v_Rx30Master Where  [BIN Nbr] <> '' AND [Bin Nbr] <> '000000' AND GNI <> 0 
AND ([Cost Submitted] = [Plan Amount] + [Patient Paid]) --AND ([Rx Date] >= @RxFrom and [Rx Date] <= @RxTo)

ORDER BY [BIN NBR]


END
GO
