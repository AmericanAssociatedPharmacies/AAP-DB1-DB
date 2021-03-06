USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ProgramsMCCurrentCount_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <09/15/2011>
-- Description:	Create table for Current count of Members in Programs  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ProgramsMCCurrentCount_RPT]
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL varchar(1000); 

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_CurrCount')
	 BEGIN
      DROP TABLE tmp_CurrCount
     END

SELECT * into tmp_CurrCount from(
	SELECT  'Managed Care' as Program,count(*) as CurrentCount from pharmacymaster..v_pm_allwithaffiliates where 
	chaincode is not null and mcquitdate is   null and aapaccountno is not null   and aapquitdate is null

	Union

	SELECT Description as Program,count(CountPM) as CurrentCount from
	(
	SELECT  distinct pm.pmid ,count(*) as CountPM, Programid,enddate  from pharmacymaster..pm_memberprograms pm
	join
	(
		SELECT * from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and aapquitdate is null
	) p
	on pm.pmid = p.pmid where enddate is null
		group by pm.pmid , Programid  ,enddate 
	)ch
	left outer join 
	(
		SELECT programid,description from pharmacymaster..pm_programs
	)
	pr
	on ch.programid = pr.programid
	group by ch.programid,description
) ch


SELECT * from tmp_CurrCount where program not in ( 'Conference 2013','Conference 2014')

END








GO
