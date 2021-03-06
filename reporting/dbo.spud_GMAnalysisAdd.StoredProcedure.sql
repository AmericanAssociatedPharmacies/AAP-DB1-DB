USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMAnalysisAdd]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 03/18/09
-- Description:	Add History Analysis
-- =============================================
CREATE PROCEDURE [dbo].[spud_GMAnalysisAdd]

(
	@dataid int,
	@filename nvarchar(200),
	@pricefiledate datetime,
	@fdbfiledate datetime,
	@discount numeric(10,2),
	@df	numeric(10,2),
	@fromdate datetime,
	@todate datetime,
	@days int,
	@daytype int,
	@stores int,
	@createdby nvarchar(50)
)
	
AS

	BEGIN

		SET NOCOUNT ON;
			Declare @scount int			
			
			

			Insert into GMAnalysis (DataID, FileName,PriceFileDate, FDBDate, Discount, Stores, DispensingFee, CreatedOn,fromdt, todt,days, daytype, CreatedBy) VALUES
				(@dataid, @filename, @pricefiledate, @fdbfiledate, @discount, @stores, @df, getdate(), @fromdate, @todate, @days, @daytype, @CreatedBy)

			Declare @AnalysisID int
			Select @AnalysisID=Max(AnalysisID) from GMAnalysis

			Insert into GMOutput (Brand,AnalysisID) VALUES
				('SSB',@AnalysisID)

			Insert into GMOutput (Brand,AnalysisID) VALUES
				('MSB',@AnalysisID)

			Insert into GMOutput (Brand,AnalysisID) VALUES
				('GEN',@AnalysisID)

			Insert into GMOutput (Brand,AnalysisID) VALUES
				('TOTAL',@AnalysisID)

			Select @AnalysisID as AnalysisID

	END					

			









GO
