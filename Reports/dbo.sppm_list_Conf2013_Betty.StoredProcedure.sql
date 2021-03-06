USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_Conf2013_Betty]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Call Controlled Substance report
-- =============================================
Create PROCEDURE [dbo].[sppm_list_Conf2013_Betty]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * into Conf2013Listing_Betty from (
 
	SELECT PMID, AuthorizedVoter as [Individual Authorized to Vote],AccountName as [Account DBA],
	AAPEffectiveDate as [AAP Effective Date],AAPQuitdate as [AAP Quit Date],
	AAPAccountNo as [AAP Store #],AAPParentNo as [AAP Parent Store #],
	MailAddr1 as [Mailing Address 1],MailAddr2 as [Mailing Address 2],
	MailCity as [Mailing City],MailState as [Mailing State],MailZip as [Mailing Zip] from v_pm_allwithaffiliates
	) ch
END










GO
