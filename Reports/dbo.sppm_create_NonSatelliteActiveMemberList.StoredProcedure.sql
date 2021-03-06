USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_NonSatelliteActiveMemberList]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/08/2011>
-- Description:	Create Non Satellite Active Member list for Clint - to be run Quarterly
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_NonSatelliteActiveMemberList]
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	SELECT PMID,AAPAccountNo as [AAP #],AccountName as [Account Name],MembershipOwner as [Membership Owner],AuthorizedVoter as [Authorized Voter],Addr1 as [Physical Address1], Addr2  as [Physical Address2],
        City as [Physical City],State as [Physical State] ,Zip as [Physical Zip],
        MailAddr1 as [Mailing Address1], MailAddr2  as [Mailing Address2],MailCity as [Mailing City],MailState as [Mailing State],MailZip as [Mailing Zip],
		Phone,Fax,Email from pharmacymaster..v_pm_allwithaffiliates where aapquitdate is null
		and aapeffectivedate is not null and 
		aapaccountno is not null and  aapaccountno != '' 
		and  (aapparentno is null or (aapaccountno = aapparentno) or aapparentno = '' )

 
END








GO
