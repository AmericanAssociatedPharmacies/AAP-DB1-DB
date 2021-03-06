USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMRejectedClaims]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















-- =============================================
-- Author:		JOSHILA NARAYANANAN
-- Create date: 04/21/09
-- Description:	GENERATE Rejected Claims report for PM clients
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMRejectedClaims]
(
	@pharmid nvarchar(50)
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MIN([BIN Nbr]) as BIN, CASE WHEN MAX([Bill Code]) IS NULL THEN MAX([BIN Nbr]) ELSE MAX([Bill Code]) END AS BillCode, MIN(DrugName) AS DrugName, MIN(NDC) AS NDC, MIN([Rx Nbr]) AS RxNbr, MIN([Rx Date]) AS DateOfService, MAX([Rej Code]) AS RejCode, MIN(ResponseReason) AS Reason, MIN(RPH) AS RPH, MAX([Gross Amt Due]) AS AmountRejected
FROM  v_Rx30Master
WHERE ([Rx Nbr] IS NOT NULL) AND [Pharm ID] = @pharmid AND (RxID > (Select MAX(Rxid) FROM Rx30PmLast Where Type=1))
GROUP BY [Rx Nbr]
HAVING MIN([Tx Response]) = 'R'


END





















GO
