USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_web_pm_userprograms021914]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*show selected programs with 1 for participant, 0 non-participant B.Grant 6/2012
sorted in the web display code
uses the "AAP" field in pm_programs
*/
CREATE VIEW [dbo].[v_web_pm_userprograms021914]
AS
SELECT     dt1.PMID, dt2.ProgramID, dt2.Description, CASE WHEN mp.pmid IS NULL THEN 0 ELSE CASE WHEN mp.enddate IS NULL AND 
                      mp.startdate IS NOT NULL THEN 1 ELSE 0 END END AS isInProgram
FROM         (SELECT DISTINCT PMID
                       FROM          dbo.v_PM_AllWithAffiliates) AS dt1 INNER JOIN
						  (SELECT DISTINCT ProgramID, Description
							FROM          dbo.PM_Programs
							--WHERE      (ProgramID IN (193, 197, 6))) 
							WHERE isnull(AAP,0)<>0)
							AS dt2 ON dt1.PMID = dt1.PMID LEFT OUTER JOIN
                      dbo.PM_MemberPrograms AS mp ON mp.PMID = dt1.PMID AND mp.ProgramID = dt2.ProgramID
UNION
SELECT DISTINCT 
                      PMID, - 1 AS programid, 'Managed Care' AS description, CASE WHEN (MCQuitDate IS NULL AND chaincode IS NOT NULL) AND 
                      (((AAPAccountno IS NOT NULL AND AAPAccountno <> '') AND AAPQuitdate IS NULL) OR
                      (IsNPP = - 1)) THEN 1 ELSE 0 END AS isInProgram
FROM         dbo.v_PM_AllWithAffiliates AS v_PM_AllWithAffiliates_3
UNION
SELECT DISTINCT 
                      PMID, - 2 AS programid, 'AAP Member' AS description, CASE WHEN AAPaccountno IS NOT NULL AND AAPquitdate IS NULL 
                      THEN 1 ELSE 0 END AS isInProgram
FROM         dbo.v_PM_AllWithAffiliates AS v_PM_AllWithAffiliates_2
UNION
SELECT DISTINCT PMID, - 3 AS programid, 'API Customer' AS description, CASE WHEN APIStatus = 'ACTIVE' THEN 1 ELSE 0 END AS isInProgram
FROM         dbo.v_PM_AllWithAffiliates AS v_PM_AllWithAffiliates_1


GO
