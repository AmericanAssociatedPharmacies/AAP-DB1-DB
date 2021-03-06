USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMUnderBilledClaims]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

















-- =============================================
-- Author:		JOSHILA NARAYANANAN
-- Create date: 04/23/09
-- Description:	GENERATE UNDERBILLED Claims report for PM clients
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMUnderBilledClaims]
(
	@pharmid nvarchar(50)
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT    MAX([Bill Code]) AS BillCode, MIN(DrugName) AS DrugName, MIN(NDC) AS NDC, MIN([Rx Nbr]) AS RxNbr, MIN([Rx Date]) AS DateOfService, MAX([Qty Dispensed]) AS qtydisp, MIN([Total Price]) AS ECSTotal, MIN([Gross Amt Due]) AS AmountBilled
FROM  v_Rx30Master
WHERE   ([Total Price] = [Gross Amt Due]) AND [Pharm ID] = @pharmid AND DrugName is not null AND RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=1) AND [Tx Response] <> 'R'
GROUP BY [Rx Nbr]


END





















GO
