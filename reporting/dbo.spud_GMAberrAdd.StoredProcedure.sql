USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMAberrAdd]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spud_GMAberrAdd]
/*	(
		@Type nvarchar(5),
		@ID	nvarchar(20),
		@Description nvarchar(max), 
		@RxCount int, 
		@QtyDispensed int, 
		@TotalAWP numeric(20,3), 
		@TotalWAC numeric(20,3), 
		@PatientPaid numeric(18,3), 
		@TotalPaid numeric(18,3), 
		@TotalRetail numeric(18,3), 
		@AnalysisID int 
	)*/

	(
		@AnalysisID int 
	)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--   Insert into GMAberrations Values(@Type, @ID, @Description, @RxCount, @QtyDispensed, @TotalAWP, @TotalWAC, @PatientPaid, @TotalPaid, @TotalRetail, @AnalysisID)

Insert into GMAberrations SELECT *,@AnalysisID FROM v_ClaimsAberSSBMSB 

Insert into GMAberrations SELECT *,@AnalysisID FROM dbo.v_ClaimsAbberGEN


END
GO
