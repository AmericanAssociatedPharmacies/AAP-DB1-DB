USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMOutputUpd2]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spud_GMOutputUpd2]
(
	@NDCCount numeric(28,2),
	@TotalPrescription numeric(28,2),
	@PatientPaid numeric(28,2),
	@TotalPlanPaid numeric(28,2),
	@TotalAWP numeric(28,2),
	@TotalWAC numeric(28,2),
	@Type char(3),
	@analysisid int
)	


AS
BEGIN

	SET NOCOUNT ON;

            Update GMOutput Set NDCCountMatch =  @NDCCount,
			 ScriptsMatch = @TotalPrescription,
				PatientPaid = @PatientPaid,
				PlanPaid = @TotalPlanPaid,
				AWP = @TotalAWP,
				WAC = @TotalWAC,
				PercentNDCMatch = @NDCCount/NDCCount,
				PercentScriptsMatch = @TotalPrescription/Scripts
			Where Brand = @Type and AnalysisID = @analysisid

		if @Type = 'GEN' --Sum Total
		Begin
			Update GMOutput Set NDCCount =(SELECT SUM(NDCCount) AS Expr1 FROM GMOutput Where  AnalysisID = @analysisid),
			 NDCCountMatch =  (SELECT SUM(NDCCountMatch) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid),
			 Scripts =  (SELECT SUM(Scripts) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid),
			 ScriptsMatch =  (SELECT SUM(ScriptsMatch) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid),
			 PatientPaid = (SELECT SUM(PatientPaid) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid),
			 PlanPaid = (SELECT SUM(PlanPaid) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid),
			 AWP = (SELECT SUM(AWP) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid),
			 WAC = (SELECT SUM(WAC) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid)
			WHERE Brand = 'TOTAL' and AnalysisID = @analysisid

			Update GMOutput set PercentNDCMatch = (SELECT SUM(NDCCountMatch) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid)/(SELECT SUM(NDCCount) AS Expr1 FROM GMOutput Where  AnalysisID = @analysisid),
			PercentScriptsMatch = (SELECT SUM(ScriptsMatch) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid)/(SELECT SUM(Scripts) AS Expr1 FROM GMOutput Where AnalysisID = @analysisid)
			WHERE Brand = 'TOTAL' and AnalysisID = @analysisid

		End	

END






GO
