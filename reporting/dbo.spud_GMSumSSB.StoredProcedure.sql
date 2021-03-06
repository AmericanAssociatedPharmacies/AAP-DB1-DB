USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMSumSSB]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 03/30/2009
-- Description:	GM Summary Totals
-- =============================================
CREATE PROCEDURE [dbo].[spud_GMSumSSB]
	(
		@intAb int
	)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
if @intAb = 1
	Begin
		SELECT COUNT(NDC11) AS NDCCount, SUM([TRx Count]) AS TotalPrescription, SUM([Patient Paid Amount]) AS PatientPaid, SUM([Total Paid Amount]) AS TotalPlanPaid, SUM([Total  AWP]) AS TotalAWP, SUM(NPT_PRICEX * [TRx Quantity Dispensed]) AS TotalWAC FROM v_ClaimsFDB 
		WHERE ([Brand Type] = 'SINGLE-SOURCE BRAND') AND (NPT_PRICEX <> '0.000')
	End

if @intAb = 0
	Begin
		SELECT COUNT(NDC11) AS NDCCount, SUM([TRx Count]) AS TotalPrescription, SUM([Patient Paid Amount]) AS PatientPaid, SUM([Total Paid Amount]) AS TotalPlanPaid, SUM([Total  AWP]) AS TotalAWP, SUM(NPT_PRICEX * [TRx Quantity Dispensed]) AS TotalWAC FROM v_ClaimsFDB 
		WHERE  TotalWAC < ([Total Paid Amount] + [Patient Paid Amount] ) AND ([Brand Type] = 'SINGLE-SOURCE BRAND') AND (NPT_PRICEX <> '0.000')
	End





END

GO
