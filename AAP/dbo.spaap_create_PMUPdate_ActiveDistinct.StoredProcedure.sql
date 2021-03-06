USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_PMUPdate_ActiveDistinct]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Remove duplicates from StoreMember for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_PMUPdate_ActiveDistinct]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PMUpdate_Active_distinct')
          DROP TABLE PMUpdate_Active_distinct

	-- Select the distinct DEA ranked by the Source - 'AAP' or 'API' or 'UD' -- UPdated to add the AllowDupDEA field


SELECT * INTO PMUpdate_Active_distinct FROM (
	SELECT * FROM ( 
	SELECT * , Rank() OVER (Partition BY dea order by allowdupdea desc,source asc) as Rank
	FROM (SELECT * FROM PMUpdate_Active_staging  where dea is not null   ) sm 
	) tmp where   Rank = 1   and dea is not null
	) amd

 EXEC sp_refreshview [dbo.v_pharmacymaster_mailinglist] 
--	SELECT * INTO AccountMasterActive_Distinct FROM (
--	SELECT * FROM ( 
--	SELECT * , Rank() OVER (Partition BY dea order by source asc) as Rank
--	FROM (SELECT * FROM AccountMasterActive_staging  where dea is not null   ) sm 
--	) tmp where   Rank = 1   and dea is not null
--	) amd

--	ALTER table AccountMasterActive_Distinct drop column  Rank 
--	-- Insert the nulls - shouldn't have any in active but you never know
--    
--	
--	SET IDENTITY_INSERT AccountMasterActive_Distinct ON;
--
--		INSERT   into AccountMasterActive_Distinct (   
--		  SELECT * FROM AccountMasterActive_staging  where dea is null;  
--
--	SET IDENTITY_INSERT AccountMasterActive_Distinct OFF;
END








GO
