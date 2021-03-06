USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMAnalysisStoresUpd]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 06/30/2009
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spud_GMAnalysisStoresUpd]
	(
		@AnalysisID int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update GMAnalysis Set Stores = (Select Count(distinct NABP) from tmp_MagmaClaims)
	Where AnalysisID = @AnalysisID
END
GO
