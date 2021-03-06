USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Volume_Dashboard]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Volume_Dashboard]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_VolD_jmw')
		 BEGIN
          DROP TABLE tmp_VolD_jmw
         END
 
SELECT * INTO tmp_VolD_jmw from (
	SELECT   
        Date,
		MAX([API May Brand])  as [API May Brand] ,
		MAX([API May Generic])  as [API May Generic],
		MAX([API May OTC])  as [API May OTC],
		MAX([API May Total Whse])  as [API May Total Whse],

		MAX([API Jun Brand])  as [API Jun Brand] ,
		MAX([API Jun Generic])  as [API Jun Generic],
		MAX([API Jun OTC])  as [API Jun OTC],
		MAX([API Jun Total Whse])  as [API Jun Total Whse] 


	FROM (
	  SELECT year(date) as date,
		  'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + ' Brand' as dateWAB,
		round(sum(isnull(WHAPIBrand,0)),2)as WHAPIBrand  ,
		   'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + ' Generic' as dateWAG,
		round(sum(isnull(WHAPIGeneric,0)),2) as WHAPIGeneric ,
		   'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + ' OTC' as dateWAO,
		round(sum(isnull(WHAPIOTC,0)),2) as WHAPIOTC  ,
		   'API ' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 3) + ' Total Whse' as dateWAT,
		round(sum(isnull(WHAPITotal,0)),2)as WHAPITotal  


	  FROM pharmacymaster..all_volume  where ( month(date) in ( 05,06 ) and year(date) in (2011, 2012) )
					           
			 group by  year(date),date
	) as TableDate


	PIVOT 
	(
	  SUM(WHAPIBrand) 
	  FOR dateWAB IN  ([API May Brand], [API Jun Brand]) 
	) as P1
	PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateWAG IN  ([API May Generic], [API Jun Generic]) 
	) as P2
	PIVOT 
	(
	  SUM(WHAPIOTC)
	  FOR dateWAO IN  ([API May OTC], [API Jun OTC]) 
	)as P3
	PIVOT 
	(
	  SUM(WHAPITotal)
	  FOR dateWAT IN  ([API May Total Whse], [API Jun Total Whse]) 
	)as P4
	
	group by year(date),date

)vol


SELECT * from tmp_VolD_jmw
END








GO
