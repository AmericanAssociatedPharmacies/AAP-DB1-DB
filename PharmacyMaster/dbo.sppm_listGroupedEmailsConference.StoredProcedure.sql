USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_listGroupedEmailsConference]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 5/01/2013
-- Description:	list fax No from PM - when null use SLX
-- =============================================
CREATE PROCEDURE [dbo].[sppm_listGroupedEmailsConference] 
 
AS
 

BEGIN
	--SET NOCOUNT ON;
DECLARE @PID   varchar(10);
SET @PID = (Select PID from PharmacyMaster..CurrConfProgramID);
 
SELECT  distinct Email,dbo.PMListSameEmails(Email,@PID) as [Account Names] from v_pm_allwithaffiliates where pmid in (
	SELECT pmid from pm_memberprograms where programid = @PID and enddate is null ) and email is not null  and email != '' 
	order by Email

END

GO
