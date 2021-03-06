USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_Rx30Outdated]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 07/06/2009
-- Description:	OUT OF DATE NDCs
-- =============================================
CREATE PROCEDURE [dbo].[spud_Rx30Outdated]
	(
		@RxFrom datetime,
		@RxTo	datetime,
		@PharmID int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select BIN, BrandType, 
	Count(*) AS TotalPresc,SUM([Patient Paid]) as PatientPaid,SUM([Plan Amount]) as PlanAmount, SUM([TotalAWP]) AS TotalAWP, SUM([Patient Paid]) + SUM([Plan Amount]) AS Sales
		  from v_Rx30MasterSel Where ([Rx Date] >= @RxFrom and [Rx Date] <= @RxTo) AND [Pharm ID] = @PharmID
	GROUP BY [Bin],BrandType
	ORDER BY [BIN]



END
GO
