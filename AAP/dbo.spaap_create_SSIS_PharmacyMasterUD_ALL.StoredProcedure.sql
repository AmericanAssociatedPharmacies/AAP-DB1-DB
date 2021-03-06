USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_SSIS_PharmacyMasterUD_ALL]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Remove duplicates from StoreMember for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_SSIS_PharmacyMasterUD_ALL]

AS
	BEGIN
       SET NOCOUNT ON;
       IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PharmacyMasterUD_ALL')
             DROP TABLE tmp_PharmacyMasterUD_ALL


		SELECT * INTO tmp_PharmacyMasterUD_ALL from (
			SELECT * FROM ( 
				SELECT * , Rank() OVER (Partition BY DEA order by quitdate desc, acct_no desc) as Rank
				FROM (SELECT * FROM reporting..storemember where dea is not null and quitdate is not null ) sm 
			) tmp where Rank = 1  
			UNION
			--Really dont need to do the rank over as there are no dupliate deas here - at least not now!!
			SELECT * FROM ( 
				SELECT * , Rank() OVER (Partition BY DEA order by acct_no desc ) as Rank
				FROM (SELECT * FROM reporting..storemember where dea is not null and quitdate is  null ) sm 
			) tmp where Rank = 1  
		) t1

		  ALTER TABLE tmp_PharmacyMasterUD_ALL DROP COLUMN Rank

         IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'SSIS_PharmacyMasterUD_ALL')
             DROP TABLE SSIS_PharmacyMasterUD_ALL

		SELECT * INTO SSIS_PharmacyMasterUD_ALL from (
			SELECT * FROM ( 
				SELECT * , Rank() OVER (Partition BY DEA order by quitdate asc) as Rank
				FROM (SELECT * FROM tmp_PharmacyMasterUD_ALL  ) sm 
			) tmp where Rank = 1  
		UNION
		 SELECT *,cast(0 as numeric(2))as Rank FROM reporting..storemember where dea is null --Need to get all the null DEA's too
		) al

		  ALTER TABLE SSIS_PharmacyMasterUD_ALL drop column Rank

           IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PharmacyMasterUD_ALL')
             DROP TABLE tmp_PharmacyMasterUD_ALL
			
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
--  
--	   --- Drop the previous runs table
--   IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'PharmacyMasterUD')
--          DROP TABLE PharmacyMasterUD
--
--	SELECT * INTO PharmacyMasterUD from (
--		SELECT * FROM ( 
--			SELECT * , Rank() OVER (Partition BY dea order by quitdate desc) as Rank
--			FROM (select * from reporting.dbo.storemember   ) sm 
--	) tmp where   Rank = 1   and dea is not null ) ud
--
--	ALTER TABLE PharmacyMasterUD
--	 DROP COLUMN Rank;
--
--	INSERT   INTO PharmacyMasterUD   
--	SELECT * FROM reporting.dbo.storemember   where dea is  null;


  
        

    END









GO
