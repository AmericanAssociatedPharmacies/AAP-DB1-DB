USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spPM_ProgramMemberGetCurrentStep]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 10/13/2014
-- Description:	Get the distribution get for communication master
-- =============================================
CREATE PROCEDURE [dbo].[spPM_ProgramMemberGetCurrentStep] 
(
	@PMId NVARCHAR(50),
	@ProgramId NVARCHAR(50)
)
	 AS 
BEGIN 
--- 183 and step 3 and currentdate >= start date then need to update step to participate=4
	DECLARE @currentStep INT, @startDate DATETIME
 
	SELECT @currentStep = ps.ProgramStepID 
	FROM dbo.PM_ProgramStep ps
	WHERE ps.ProgramStepID =(	SELECT MAX(psm.ProgramStepID)
								FROM dbo.PM_ProgramStepMember psm 
								WHERE @PMId = psm.PMID AND @ProgramId = psm.ProgramID --AND psm.ProgramStepID = MAX(psm.ProgramStepID)
							-- MAX(ps.StepSeq)
							);

	SELECT @startDate = psm.StartDate
	FROM dbo.PM_ProgramStepMember psm
	WHERE psm.PMID = @PMId AND psm.ProgramID = @ProgramId AND psm.ProgramStepId = @currentStep;

	-- select @startDate;
	IF ( @ProgramId = 183 AND @currentStep = 3 AND GETDATE() > @startDate ) BEGIN
			UPDATE dbo.PM_ProgramStepMember set ProgramStepID = 4 WHERE PMID = @PMId AND ProgramID = @ProgramId;
	END

--- return the current state
	SELECT ps.ProgramStepID, ps.ProgramID, ps.StepSeq, ps.StepName 
	FROM dbo.PM_ProgramStep ps
	WHERE ps.ProgramStepID =(	SELECT MAX(psm.ProgramStepID)
								FROM dbo.PM_ProgramStepMember psm 
								WHERE @PMId = psm.PMID AND @ProgramId = psm.ProgramID --AND psm.ProgramStepID = MAX(psm.ProgramStepID)
							-- MAX(ps.StepSeq)
								)


-- 	SELECT @PMId PMId, @ProgramId ProgramId, NULL StartDate, NULL EndDate, 0 StatusId, 'new' [Status], 1 StepId 
	-- FROM Webdev.dbo.userlogin 
	-- WHERE [login] = @UserId
END

/*

EXEC [dbo].spPM_ProgramMemberGetCurrentStep '1', 183

-- update PM_ProgramStepMember set startdate = '11/11/13' WHERE pmid = 1
-- update PM_ProgramStepMember set startdate = '11/11/14', programstepid=2 WHERE pmid = 1

SELECT * FROM Webdev.dbo.userlogin where login like 'it%'


SELECT [USER_ID]
      ,[USERNAME]
      ,[PASSWORD]
      ,[PERMS]
      ,[OPT_IN]
      ,[OPT_IN2]
      ,[MANAGED_CARE]
  FROM [WebDev].[dbo].[Auth_User]

SELECT [id]
      ,[Login]
      ,[functionid]
  FROM [WebDev].[dbo].[AdminFunctionUsers]



*/
GO
