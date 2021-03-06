USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadConference2013_ListAll]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadConference2013_ListAll] 
AS
 
 
BEGIN 



-- --SQL for file to send to Julie
 SELECT PMID,AccountName,AAPAccountNo,AAPParentNo,AAPQuitDate,APIAccountNo,APIStatus,GroupNo,Affiliate from v_pm_allwithaffiliates where pmid in (
     SELECT pmid from pm_memberprograms  where programid = '195' and enddate is null) order by aapparentno desc,groupno desc

END

GO
