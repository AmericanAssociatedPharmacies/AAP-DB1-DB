USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMSumGEN]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 03/30/2009
-- Description:	GM Summary Totals
-- =============================================
CREATE PROCEDURE [dbo].[spud_GMSumGEN]
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
		SELECT COUNT(*) AS NDCCount,SUM(RxCount) AS TotalPrescription, SUM(TotalAWP) AS TotalAWP, SUM(PatientPaid) AS PatientPaid, SUM(TotalPaid) AS TotalPlanPaid, SUM(CardPrice * QtyDisp) AS TotalWAC 
		FROM v_ClaimsGCNCAHGEN
	End

if @intAb = 0
	Begin
		SELECT COUNT(*) AS NDCCount,SUM(RxCount) AS TotalPrescription, SUM(TotalAWP) AS TotalAWP, SUM(PatientPaid) AS PatientPaid, SUM(TotalPaid) AS TotalPlanPaid, SUM(CardPrice * QtyDisp) AS TotalWAC 
		FROM v_ClaimsGCNCAHGEN WHERE TotalWAC < ([TotalPaid] + [PatientPaid] ) 
	END
END

GO
