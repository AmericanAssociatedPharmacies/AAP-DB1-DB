USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_EmailsNotInConference]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 5/01/2013
-- Description:	list fax No from PM
-- =============================================
Create PROCEDURE [dbo].[sppm_CM_EmailsNotInConference] 
 
AS
 

BEGIN
	--SET NOCOUNT ON;
 
DECLARE @PID   varchar(10);
SET @PID = (Select PID from PharmacyMaster..CurrConfProgramID);

SELECT   Email,AccountName as [Account Name],Fax,Phone,ContactFullName as ContactName,MembershipOwner, City,State from v_pm_allwithaffiliates where pmid not in (
SELECT pmid from pm_memberprograms where programid = @PID and enddate is null ) and aapaccountno is not null
and aapaccountno != '' and aapquitdate is null   and email is not null and email != ''
and (CommunicationPreference IS NULL OR CommunicationPreference = 'E' OR CommunicationPreference = '')

order by Email,Fax,Phone


END

GO
