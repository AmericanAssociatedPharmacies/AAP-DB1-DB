USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sp_ManagedcareEmailswithGeneral]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ManagedcareEmailswithGeneral]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     p.PMID, p.AAPAccountNo, p.NCPDP, p.AccountName, am.State, m.MCNews_EmailAddress, '' AS 'General Email', 
                      am.ContactFullName
         FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN 
                      dbo.PM_AddressMaster AS am ON am.PMID = p.PMID AND am.Address_Type_Id = 1 LEFT OUTER JOIN
                      dbo.PM_ManagedCare AS m ON m.PMID = p.PMID
WHERE       '1' + ltrim(str(p.pmid))
			in
		(SELECT ltrim(str(rank() OVER (partition BY m.mcnews_emailaddress ORDER BY [ncpdp]))) + ltrim(STR(p.pmid))
         FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN 
                      dbo.PM_AddressMaster AS am ON am.PMID = p.PMID AND am.Address_Type_Id = 1 LEFT OUTER JOIN
                      dbo.PM_ManagedCare AS m ON m.PMID = p.PMID
		 WHERE      (m.emailMCNews = 1) and (m.MCNews_EmailAddress is not null or ltrim(m.MCNews_EmailAddress) <> '') and m.mcquitdate is null) 


UNION ALL
SELECT     TOP (100) PERCENT p.PMID, p.AAPAccountNo, p.NCPDP, p.AccountName, am.State, m.MCNews_EmailAddress, p.Email, am.ContactFullName
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                      dbo.PM_AddressMaster AS am ON am.PMID = p.PMID AND am.Address_Type_Id = 1 LEFT OUTER JOIN
                      dbo.PM_ManagedCare AS m ON m.PMID = p.PMID
WHERE     (m.emailMCNews = 0 or m.emailMCNews is null) AND (p.AAPQuitDate IS NULL) AND (p.AAPAccountNo IS NOT NULL) AND (p.Email IS NOT NULL) and
                      (m.emailMCNews IS NULL) AND (p.AAPQuitDate IS NULL) AND (p.AAPAccountNo IS NOT NULL) AND '1' + ltrim(STR(P.PMID)) 
                      IN
                          (SELECT ltrim(str(rank() OVER (partition BY p.email ORDER BY [accountname]))) + ltrim(STR(p.pmid))
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                      dbo.PM_AddressMaster AS am ON am.PMID = p.PMID AND am.Address_Type_Id = 1 LEFT OUTER JOIN
                      dbo.PM_ManagedCare AS m ON m.PMID = p.PMID
WHERE     (m.emailMCNews = 0 or m.emailMCNews is null) AND (p.AAPQuitDate IS NULL) AND (p.AAPAccountNo IS NOT NULL) AND (p.Email IS NOT NULL) and
                      (m.emailMCNews IS NULL) AND (p.AAPQuitDate IS NULL) AND (p.AAPAccountNo IS NOT NULL))
ORDER BY AccountName

END



GO
