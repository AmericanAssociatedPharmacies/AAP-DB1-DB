USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetAttestationRpt]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 10/21/2014
-- Description:	SurveyGetAttestationRpt
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetAttestationRpt]
	-- Add the parameters for the stored procedure here
	@programs NVARCHAR(MAX) = 'ManagedCare',
	@attestationStatusID INT,
	@attestationFlagOpt INT,
    @options NVARCHAR(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

-- @attestationStatusID is a binary number -
-- 0 All Managed-Care
-- 1 Completed Attestation
-- 2 Not Completed Attestation


-- @attestationFlagOpt
-- 0 dontcare
-- 1 Completed Attestation has flag  
-- 2 Completed Attestation dont have flag Attestation 

Declare @SurveyId int;
Set @SurveyId=39;

-- 1. table pmid completed
IF @attestationStatusID = 1 OR @attestationStatusID = 2 BEGIN
	SELECT distinct PMID
	INTO #tmpCompletedPMID
	-- select *
	FROM dbo.surveyanswer a
	WHERE	a.IsSubmitted = 1 
			AND a.optionid in (select so.id from dbo.surveyoption so where so.questionid in (select DISTINCT sq.id from dbo.surveyquestion sq where sq.surveyid = @SurveyId)) 
END

-- 2. table pmid comleted has flag
IF @attestationFlagOpt = 1 OR @attestationFlagOpt = 2 BEGIN
--	SELECT distinct PMID
--	--INTO #tmpCompletedHasFlagPMID
--	FROM dbo.surveyanswer a
--	WHERE	a.IsSubmitted = 1 
--			AND a.optionid in (select so.id from dbo.surveyoption so where so.questionid in (select DISTINCT sq.id from dbo.surveyquestion sq where sq.surveyid = 39)) 
--			AND LEN(dbo.fnSurveyGetFlagsStr(39,a.PMID,'')) > 1

declare @str varchar(max)
SELECT @str = isnull(@str +',', '') + a.EntityIds
FROM (SELECT EntityIds from SurveyFlag where surveyid=@SurveyId) a
select @str

select distinct a.pmid as PMID
INTO #tmpCompletedHasFlagPMID
from surveyanswer a
where a.issubmitted=1 and a.optionid in (select id 
	from  surveyoption 
	where questionid in (select id 
		from surveyquestion where surveyid=@SurveyId))
and @str  like '%' + Convert(varchar,a.pmid) + '%'

END
--3. All ManagedCare
	SELECT DISTINCT s.*
	INTO #tmpResultPharmacy
	-- FROM dbo.v_CA_SurveyStoreStatus s
	FROM dbo.v_Survey_CA_StoreStatus s -- select * from dbo.v_Survey_CA_StoreStatus where ncpdp = 543771
	WHERE	s.IsStoreManagedCare = 1

---------------
	SET NOCOUNT ON;

IF @attestationStatusID = 1 BEGIN
	DELETE #tmpResultPharmacy WHERE PMID NOT IN (SELECT c.PMID FROM #tmpCompletedPMID c)
END 

IF @attestationStatusID = 2 BEGIN
	DELETE #tmpResultPharmacy WHERE PMID IN (SELECT c.PMID FROM #tmpCompletedPMID c)
END

IF @attestationFlagOpt = 1 BEGIN
	DELETE #tmpResultPharmacy WHERE PMID NOT IN (SELECT c.PMID FROM #tmpCompletedHasFlagPMID c)
END 

IF @attestationFlagOpt = 2 BEGIN
	DELETE #tmpResultPharmacy WHERE PMID IN (SELECT c.PMID FROM #tmpCompletedHasFlagPMID c)
END

SELECT  s.* FROM #tmpResultPharmacy s
	
-- ORDER BY isCompletedTraining


/****
-- SELECT * FROM dbo.SurveyAnswer

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetAttestationRpt]
	@programs  = 'ManagedCare',
	@attestationStatusID =1,
	@attestationFlagOpt =0,
@options=''


SELECT	'Return Value' = @return_value

SELECT * FROM PharmacyMaster..PM_ProgramStep  WHERE  ProgramID = 183
SELECT Top 1 * FROM PharmacyMaster..PM_ProgramStepMember  WHERE  ProgramID = 183 AND ProgramStepID = 3

*/
END

GO
