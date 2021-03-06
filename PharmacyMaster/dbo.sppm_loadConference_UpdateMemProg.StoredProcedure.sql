USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadConference_UpdateMemProg]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadConference_UpdateMemProg] 
(@createDate as varchar(10)) 
	 AS
 
 
BEGIN 

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_MemberPrograms_bkp')
          DROP TABLE PM_MemberPrograms_bkp;

	SELECT * into PM_MemberPrograms_bkp from pm_memberprograms;
--
--

DECLARE @PID   varchar(10);
SET @PID = (Select PID from PharmacyMaster..CurrConfProgramID);

----Need to use this to insert into PM_MemberPrograms so you don't get duplicates  
   INSERT into  pm_memberprograms   
	SELECT PMID ,@PID as ProgramID,StartDate,null as EndDate,null as Comment,@createDate as Created,@createDate as Modified,   
 	1 as RowVersion ,-1 as AAP from tmp_ConfReg_MemProgs where PMID not in (select pmid from  pm_memberprograms  where programid = @PID)

 -- To manually insert use as template - providing correct PMID and dates and ProgramID ** CHANGE PROGRAMID IF NEEDED AND DATES !!!!!
--   INSERT into  pm_memberprograms   
--	SELECT 102659 as PMID,209 as Programid,'01/01/2016'as StartDate,null as EndDate,null as Comment,'03/10/2016' as Created,'03/10/2016'as Modified,   
-- 	1 as RowVersion ,-1 as AAP


-- To manually update the end date - use as template only  - provide correct PMID and ProgramID
--
--update pm_memberprograms set enddate = '11/10/2014'  where pmid = 105685 and Programid = 203
END

GO
