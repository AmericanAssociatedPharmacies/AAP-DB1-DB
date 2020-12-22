USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_listFaxNotInConference]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 5/01/2013
-- Description:	list fax No from PM - when null use SLX
-- =============================================
CREATE PROCEDURE [dbo].[sppm_listFaxNotInConference] 
 
AS
 

BEGIN
	--SET NOCOUNT ON;
DECLARE @PID   varchar(10);
SET @PID = (Select PID from PharmacyMaster..CurrConfProgramID);
 
SELECT   Fax as FaxNo,AccountName ,Phone as ContactNo,ContactFullName as Contact,MembershipOwner, City,State,Email  from v_pm_allwithaffiliates where pmid not in (
	SELECT pmid from pm_memberprograms where programid = @PID and enddate is null ) 
	and Fax is not null  --and (email is null or email = '') -- replaced with code below jmw
		and ((email is null or email = '') or( email is not null and CommunicationPreference = 'F'))
	 and Fax != '' and Fax != '000-000-0000'  and aapaccountno is not null
    and aapaccountno != '' and aapquitdate is null and (DonotFax IS NULL OR DoNotFax = 0 OR DoNotFax = '') and (CommunicationPreference IS NULL OR CommunicationPreference = 'F' OR CommunicationPreference = '')
UNION 
Select FaxNo,AccountName,ContactNo,'' as ContactFullName,'' as MembershipOwner ,'' as City,'' as State,'' as Email from reports..FaxAdditions


END

GO
