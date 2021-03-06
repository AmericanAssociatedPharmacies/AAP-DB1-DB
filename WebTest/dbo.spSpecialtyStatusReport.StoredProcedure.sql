USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spSpecialtyStatusReport]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Deepa
-- Create date: 7/29/2015
--Modified date: 7/31/2015 --added [Mananged care] col
					--8/7/2015 --corrected [memeber status]
					--8/12/2015 -- added [Post test completed?], [Requested Start date] and corrected [Go live date]
-- Description:	Weekly Specialty report
-- =============================================
CREATE PROCEDURE [dbo].[spSpecialtyStatusReport]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tempSpecialty]') AND TYPE IN (N'U'))
DROP TABLE [dbo].[tempSpecialty]

SELECT DISTINCT 
                      TOP (100) PERCENT a.PMID, a.AccountName, --a.NCPDP, 
case when left(a.NCPDP,1)='0' then CHAR(61) + CHAR(34) + a.NCPDP + CHAR(34) else  a.NCPDP end AS NCPDP, 
a.NPI, 
case when t.isAAP=1 then
   case when t.isMCorNPP=1 then 'AAP Member and Managed Care participant' else 'AAP Member only' end 
else case when t.isMCorNPP=1 then 'Managed Care participant only' else 'Not in AAP or Managed Care, please review' end end [Member Status],

ISNULL(a.ContactFullName,'') AS [PM Contact], a.Email, a.Addr1, 
                      ISNULL(a.Addr2,'') Addr2, a.City, a.State, a.Zip, a.Phone, ISNULL(a.Fax,'') Fax, 
ISNULL(a.ComputerSoftware,'') ComputerSoftware, a.TMFirstName, a.TMLastName, CASE WHEN EXISTS
                          (SELECT     o.pmid
                            FROM          PharmacyMaster.dbo.PM_ProgramStepMember o
                            WHERE      o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 1) THEN 'Yes' ELSE 'No' END AS [Enrollment completed?],
                          (SELECT     CONVERT(VARCHAR(10), StartDate, 101) AS Expr1
                            FROM          PharmacyMaster.dbo.PM_ProgramStepMember AS o
                            WHERE      (PMID = i.PMID) AND (ProgramID = 183) AND (ProgramStepID = 1)) AS [Enrollment date],
                          (SELECT TOP (1)o.AnswerInput  
                            FROM          dbo.SurveyAnswer AS o
                            WHERE      (o.PMId = a.PMID) AND (o.OptionId = 181)
                            ORDER BY o.Id DESC) AS [Enrollment contact], CASE WHEN EXISTS
                          (SELECT     o.pmid
                            FROM          PharmacyMaster.dbo.PM_ProgramStepMember o
                            WHERE      o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 2) THEN 'Yes' ELSE 'No' END AS [Training completed?],
                          (SELECT     TOP (1) CONVERT(VARCHAR(10), StartDate, 101) AS Expr1
                            FROM          PharmacyMaster.dbo.PM_ProgramStepMember AS o
                            WHERE      (PMID = i.PMID) AND (ProgramID = 183) AND (ProgramStepID = 2)
                            ORDER BY StartDate DESC) AS [Training completion date], CASE WHEN EXISTS
                          (SELECT     o.pmid
                            FROM          PharmacyMaster.dbo.PM_ProgramStepMember o
                            WHERE      o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 2) THEN
                          (SELECT     TOP 1 o.AnswerInput
                            FROM          dbo.SurveyAnswer o
                            WHERE      o.PMId = a.pmid AND o.OptionID = 176
                            ORDER BY o.Id DESC) ELSE NULL END AS [Person completing training],

CASE WHEN EXISTS
                          (SELECT     o.pmid
                            FROM          PharmacyMaster.dbo.PM_ProgramStepMember o
                            WHERE      o.PMID = i.pmid AND o.ProgramID = 183 AND o.ProgramStepID = 3) THEN 'Yes' ELSE 'No' END AS [Post test completed?],
                         (SELECT TOP (1)o.AnswerInput  
                            FROM          dbo.SurveyAnswer AS o
                            WHERE      (o.PMId = a.PMID) AND (o.OptionId = 188)
                            ORDER BY o.Id DESC) AS [Requested Start date],
                          (SELECT     TOP (1) CONVERT(VARCHAR(10), StartDate, 101) AS Expr1
                            FROM          PharmacyMaster.dbo.PM_MemberPrograms AS o
                            WHERE      (ProgramID = 183) AND (PMID = a.PMID) AND (ProgramStepID = 3)) AS [Go live date]
INTO tempSpecialty
FROM         PharmacyMaster.dbo.v_PM_AllWithAffiliates AS a LEFT OUTER JOIN
                      PharmacyMaster.dbo.PM_ProgramStepMember AS i ON a.PMID = i.PMID LEFT OUTER JOIN
                      PharmacyMaster.dbo.software AS s ON s.ID = a.ComputerSoftware left join
PharmacyMaster.dbo.v_test t on a.pmid=t.pmid
WHERE     (i.ProgramID = 183)
ORDER BY [Training completed?]

Select PMID, AccountName, NCPDP, NPI, [Member Status],[PM Contact], Email, Addr1, Addr2, City, [State], Zip, Phone, Fax, ComputerSoftware, TMFirstName, TMLastName, 
                      [Enrollment completed?], ISNULL([Enrollment date],'') [Enrollment date], 
ISNULL([Enrollment contact],'') [Enrollment contact], [Training completed?], 
ISNULL([Training completion date],'') [Training completion date], ISNULL([Person completing training],'') [Person completing training], 
 [Post test completed?], ISNULL([Requested Start date],'')[Requested Start date],ISNULL([Go live date],'')[Go live date] 
from tempSpecialty
END

/*
exec [dbo].[spSpecialtyStatusReport]
*/

GO
