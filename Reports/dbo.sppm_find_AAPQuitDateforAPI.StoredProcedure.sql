USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_AAPQuitDateforAPI]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's for a certain month/year with no Match in PM_Pharmacy - XX's are excluded
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_AAPQuitDateforAPI]
(@in_month varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT 
		pmid as [PMID #],
		aapaccountno as [AAP #],
		apiaccountno as [API Account #],
		accountname as [Store Name],City,State,
		aapquitdate as [AAP Quit Date] 

		FROM v_PM_AllWithAffiliates where (aapquitdate is not null and aapquitdate != '')
		and (apiaccountno is not null and apiaccountno != '')
		ORDER by aapquitdate desc


END










GO
