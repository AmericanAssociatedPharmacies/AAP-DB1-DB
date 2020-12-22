USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMOutputUpd1]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[spud_GMOutputUpd1]
(
	@NDCCount numeric(28,2),
	@TotalPrescription numeric(28,2),
	@Type char(3),
	@analysisid int
)	


AS
BEGIN

	SET NOCOUNT ON;
	
            Update GMOutput Set NDCCount =  @NDCCount,
			 Scripts = @TotalPrescription
			Where Brand = @Type and AnalysisID = @analysisid
		
	
	
END



GO
