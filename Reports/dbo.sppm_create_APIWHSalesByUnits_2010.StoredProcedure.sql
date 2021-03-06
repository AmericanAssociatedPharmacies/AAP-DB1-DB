USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_APIWHSalesByUnits_2010]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for One Off Compare of WH Units for Wayne S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_APIWHSalesByUnits_2010]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_WHByUnits_jmw_2010')
		 BEGIN
          DROP TABLE tmp_WHByUnits_jmw_2010
         END
 
SELECT * INTO tmp_WHByUnits_jmw_2010 from (
	SELECT   
		cast(null as varchar(10)) as TM ,
	    PMID,  
		cast(null as varchar(20)) as AAP# ,  
		cast(null as varchar(20)) as Parent# ,
		cast(null as varchar(20)) as [API#] ,     
		cast('' as DateTime) as [AAP Eff], 
		cast('' as DateTime) as [API Acct Eff],   
		cast('' as DateTime) as [AAP Quit],   
        cast(null as varchar(20)) as [API Status] , 
		cast(null as  varchar(200)) as Description ,  
		cast(null as  varchar(200)) as Affiliate ,    
		cast(null as  varchar(100)) as [Account DBA Name] ,  
		cast(null as  varchar(100)) as [City] ,   
		cast(null as  varchar(100)) as ST , 

		MAX([GRx Units 01-10])  as [GRx Units 01-10],	 
		MAX([GRx $ 01-10])  as [GRx $ 01-10],		 
		MAX([BRx Units 01-10])  as [BRx Units 01-10],	 
		MAX([BRx $ 01-10])  as [BRx $ 01-10],	  
		MAX([OTC Units 01-10])  as [OTC Units 01-10],	 
		MAX([OTC $ 01-10])  as [OTC $ 01-10],

		MAX([GRx Units 02-10])  as [GRx Units 02-10],	 
		MAX([GRx $ 02-10])  as [GRx $ 02-10],		 
		MAX([BRx Units 02-10])  as [BRx Units 02-10],	 
		MAX([BRx $ 02-10])  as [BRx $ 02-10],	  
		MAX([OTC Units 02-10])  as [OTC Units 02-10],	 
		MAX([OTC $ 02-10])  as [OTC $ 02-10],

		MAX([GRx Units 03-10])  as [GRx Units 03-10],	 
		MAX([GRx $ 03-10])  as [GRx $ 03-10],		 
		MAX([BRx Units 03-10])  as [BRx Units 03-10],	 
		MAX([BRx $ 03-10])  as [BRx $ 03-10],	  
		MAX([OTC Units 03-10])  as [OTC Units 03-10],	 
		MAX([OTC $ 03-10])  as [OTC $ 03-10],

		MAX([GRx Units 04-10])  as [GRx Units 04-10],	 
		MAX([GRx $ 04-10])  as [GRx $ 04-10],		 
		MAX([BRx Units 04-10])  as [BRx Units 04-10],	 
		MAX([BRx $ 04-10])  as [BRx $ 04-10],	  
		MAX([OTC Units 04-10])  as [OTC Units 04-10],	 
		MAX([OTC $ 04-10])  as [OTC $ 04-10],

		MAX([GRx Units 05-10])  as [GRx Units 05-10],	 
		MAX([GRx $ 05-10])  as [GRx $ 05-10],		 
		MAX([BRx Units 05-10])  as [BRx Units 05-10],	 
		MAX([BRx $ 05-10])  as [BRx $ 05-10],	  
		MAX([OTC Units 05-10])  as [OTC Units 05-10],	 
		MAX([OTC $ 05-10])  as [OTC $ 05-10],

		MAX([GRx Units 06-10])  as [GRx Units 06-10],	 
		MAX([GRx $ 06-10])  as [GRx $ 06-10],		 
		MAX([BRx Units 06-10])  as [BRx Units 06-10],	 
		MAX([BRx $ 06-10])  as [BRx $ 06-10],	  
		MAX([OTC Units 06-10])  as [OTC Units 06-10],	 
		MAX([OTC $ 06-10])  as [OTC $ 06-10],

		MAX([GRx Units 07-10])  as [GRx Units 07-10],	 
		MAX([GRx $ 07-10])  as [GRx $ 07-10],		 
		MAX([BRx Units 07-10])  as [BRx Units 07-10],	 
		MAX([BRx $ 07-10])  as [BRx $ 07-10],	  
		MAX([OTC Units 07-10])  as [OTC Units 07-10],	 
		MAX([OTC $ 07-10])  as [OTC $ 07-10],

		MAX([GRx Units 08-10])  as [GRx Units 08-10],	 
		MAX([GRx $ 08-10])  as [GRx $ 08-10],		 
		MAX([BRx Units 08-10])  as [BRx Units 08-10],	 
		MAX([BRx $ 08-10])  as [BRx $ 08-10],	  
		MAX([OTC Units 08-10])  as [OTC Units 08-10],	 
		MAX([OTC $ 08-10])  as [OTC $ 08-10],

		MAX([GRx Units 09-10])  as [GRx Units 09-10],	 
		MAX([GRx $ 09-10])  as [GRx $ 09-10],		 
		MAX([BRx Units 09-10])  as [BRx Units 09-10],	 
		MAX([BRx $ 09-10])  as [BRx $ 09-10],	  
		MAX([OTC Units 09-10])  as [OTC Units 09-10],	 
		MAX([OTC $ 09-10])  as [OTC $ 09-10],

        MAX([GRx Units 10-10])  as [GRx Units 10-10],	 
		MAX([GRx $ 10-10])  as [GRx $ 10-10],		 
		MAX([BRx Units 10-10])  as [BRx Units 10-10],	 
		MAX([BRx $ 10-10])  as [BRx $ 10-10],	  
		MAX([OTC Units 10-10])  as [OTC Units 10-10],	 
		MAX([OTC $ 10-10])  as [OTC $ 10-10] ,

        MAX([GRx Units 11-10])  as [GRx Units 11-10],	 
		MAX([GRx $ 11-10])  as [GRx $ 11-10],		 
		MAX([BRx Units 11-10])  as [BRx Units 11-10],	 
		MAX([BRx $ 11-10])  as [BRx $ 11-10],	  
		MAX([OTC Units 11-10])  as [OTC Units 11-10],	 
		MAX([OTC $ 11-10])  as [OTC $ 11-10] ,

		MAX([GRx Units 12-10])  as [GRx Units 12-10],	 
		MAX([GRx $ 12-10])  as [GRx $ 12-10],		 
		MAX([BRx Units 12-10])  as [BRx Units 12-10],	 
		MAX([BRx $ 12-10])  as [BRx $ 12-10],	  
		MAX([OTC Units 12-10])  as [OTC Units 12-10],	 
		MAX([OTC $ 12-10])  as [OTC $ 12-10] 

	FROM (
	  SELECT PMID,date, 

 		'GRx Units '+ RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateGRU ,
		sum(isnull(WHAPIGenericUnits,0)) as WHAPIGenericUnits,

		'GRx $ '+  RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateGRD ,
		sum(isnull(WHAPIGeneric,0)) as WHAPIGeneric,

        'BRx Units '+ RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateBRU ,
		sum(isnull(WHAPIBrandUnits,0)) as WHAPIBrandUnits,

		'BRx $ '+  RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateBRD ,
		sum(isnull(WHAPIBrand,0)) as WHAPIBrand,

        'OTC Units '+ RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateOTU ,
		sum(isnull(WHAPIOTCUnits,0)) as WHAPIOTCUnits,

		'OTC $ '+  RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateOTD ,
		sum(isnull(WHAPIOTC,0)) as WHAPIOTC 


	  FROM pharmacymaster..all_volume  where ( month(date) in (01,02,03,04,05,06,07,08,09,10,11,12) and year(date) = 2010) 
 		 group by PMID ,date
	) as TableDate


	PIVOT 
	(
	  SUM(WHAPIGenericUnits)
	  FOR dateGRU IN  (
			[GRx Units 01-10], [GRx Units 02-10], [GRx Units 03-10], [GRx Units 04-10],
			[GRx Units 05-10], [GRx Units 06-10], [GRx Units 07-10], [GRx Units 08-10],
			[GRx Units 09-10], [GRx Units 10-10], [GRx Units 11-10], [GRx Units 12-10])
	)as P1

	PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateGRD IN  (
			[GRx $ 01-10], [GRx $ 02-10], [GRx $ 03-10], [GRx $ 04-10],
			[GRx $ 05-10], [GRx $ 06-10], [GRx $ 07-10], [GRx $ 08-10],
			[GRx $ 09-10], [GRx $ 10-10], [GRx $ 11-10], [GRx $ 12-10]) 
	)as P2

    
	
	PIVOT 
	(
	  SUM(WHAPIBrandUnits)
	  FOR dateBRU IN  (
		[BRx Units 01-10], [BRx Units 02-10], [BRx Units 03-10], [BRx Units 04-10],
		[BRx Units 05-10], [BRx Units 06-10], [BRx Units 07-10], [BRx Units 08-10],
		[BRx Units 09-10], [BRx Units 10-10], [BRx Units 11-10], [BRx Units 12-10])
	)as P3

	PIVOT 
	(
	  SUM(WHAPIBrand)
	  FOR dateBRD IN  (
		[BRx $ 01-10], [BRx $ 02-10], [BRx $ 03-10], [BRx $ 04-10],
		[BRx $ 05-10], [BRx $ 06-10], [BRx $ 07-10], [BRx $ 08-10],
		[BRx $ 09-10], [BRx $ 10-10], [BRx $ 11-10], [BRx $ 12-10]) 
	)as P4

	PIVOT 
	(
	  SUM(WHAPIOTCUnits)
	  FOR dateOTU IN  (
		[OTC Units 01-10], [OTC Units 02-10], [OTC Units 03-10], [OTC Units 04-10],
		[OTC Units 05-10], [OTC Units 06-10], [OTC Units 07-10], [OTC Units 08-10],
		[OTC Units 09-10], [OTC Units 10-10], [OTC Units 11-10], [OTC Units 12-10])
	)as P5

	PIVOT 
	(
	  SUM(WHAPIOTC)
	  FOR dateOTD IN  (
		[OTC $ 01-10], [OTC $ 02-10], [OTC $ 03-10], [OTC $ 04-10],
		[OTC $ 05-10], [OTC $ 06-10], [OTC $ 07-10], [OTC $ 08-10],
		[OTC $ 09-10], [OTC $ 10-10], [OTC $ 11-10], [OTC $ 12-10]) 
	)as P6

	group by PMID 

)vol

		--GENERIC Set to zero
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 01-10]  = 0.00 where [GRx Units 01-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 01-10] = 0.00   where [GRx $ 01-10] is null;	 
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 02-10]  = 0.00 where [GRx Units 02-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 02-10] = 0.00   where [GRx $ 02-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 03-10]  = 0.00 where [GRx Units 03-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 03-10] = 0.00   where [GRx $ 03-10] is null;

   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 04-10]  = 0.00 where [GRx Units 04-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 04-10] = 0.00   where [GRx $ 04-10] is null;	 
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 05-10]  = 0.00 where [GRx Units 05-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 05-10] = 0.00   where [GRx $ 05-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 06-10]  = 0.00 where [GRx Units 06-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 06-10] = 0.00   where [GRx $ 06-10] is null;
 
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 07-10]  = 0.00 where [GRx Units 07-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 07-10] = 0.00   where [GRx $ 07-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 08-10]  = 0.00 where [GRx Units 08-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 08-10] = 0.00   where [GRx $ 08-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 09-10]  = 0.00 where [GRx Units 09-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 09-10] = 0.00   where [GRx $ 09-10] is null;	
 
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 10-10]  = 0.00 where [GRx Units 10-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 10-10] = 0.00   where [GRx $ 10-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 11-10]  = 0.00 where [GRx Units 11-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 11-10] = 0.00   where [GRx $ 11-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [GRx Units 12-10]  = 0.00 where [GRx Units 12-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [GRx $ 12-10] = 0.00   where [GRx $ 12-10] is null;
		--Brand Set to zero

   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 01-10]  = 0.00 where [BRx Units 01-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 01-10] = 0.00   where [BRx $ 01-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 02-10]  = 0.00 where [BRx Units 02-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 02-10] = 0.00   where [BRx $ 02-10] is null;	
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 03-10]  = 0.00 where [BRx Units 03-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 03-10] = 0.00   where [BRx $ 03-10] is null;

   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 04-10]  = 0.00 where [BRx Units 04-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 04-10] = 0.00   where [BRx $ 04-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 05-10]  = 0.00 where [BRx Units 05-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 05-10] = 0.00   where [BRx $ 05-10] is null;	
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 06-10]  = 0.00 where [BRx Units 06-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 06-10] = 0.00   where [BRx $ 06-10] is null;

   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 07-10]  = 0.00 where [BRx Units 07-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 07-10] = 0.00   where [BRx $ 07-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 08-10]  = 0.00 where [BRx Units 08-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 08-10] = 0.00   where [BRx $ 08-10] is null;	
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 09-10]  = 0.00 where [BRx Units 09-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 09-10] = 0.00   where [BRx $ 09-10] is null;	

 
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 10-10]  = 0.00 where [BRx Units 10-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 10-10] = 0.00   where [BRx $ 10-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 11-10]  = 0.00 where [BRx Units 11-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 11-10] = 0.00   where [BRx $ 11-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [BRx Units 12-10]  = 0.00 where [BRx Units 12-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [BRx $ 12-10] = 0.00   where [BRx $ 12-10] is null;

		--OTC Set to zero

   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 01-10]  = 0.00 where [OTC Units 01-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 01-10] = 0.00   where [OTC $ 01-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 02-10]  = 0.00 where [OTC Units 02-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 02-10] = 0.00   where [OTC $ 02-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 03-10]  = 0.00 where [OTC Units 03-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 03-10] = 0.00   where [OTC $ 03-10] is null;

   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 04-10]  = 0.00 where [OTC Units 04-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 04-10] = 0.00   where [OTC $ 04-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 05-10]  = 0.00 where [OTC Units 05-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 05-10] = 0.00   where [OTC $ 05-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 06-10]  = 0.00 where [OTC Units 06-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 06-10] = 0.00   where [OTC $ 06-10] is null;

   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 07-10]  = 0.00 where [OTC Units 07-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 07-10] = 0.00   where [OTC $ 07-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 08-10]  = 0.00 where [OTC Units 08-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 08-10] = 0.00   where [OTC $ 08-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 09-10]  = 0.00 where [OTC Units 09-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 09-10] = 0.00   where [OTC $ 09-10] is null;

	 
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 10-10]  = 0.00 where [OTC Units 10-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 10-10] = 0.00   where [OTC $ 10-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 11-10]  = 0.00 where [OTC Units 11-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 11-10] = 0.00   where [OTC $ 11-10] is null;
   		UPDATE tmp_WHByUnits_jmw_2010 set [OTC Units 12-10]  = 0.00 where [OTC Units 12-10] is null;
		UPDATE tmp_WHByUnits_jmw_2010 set [OTC $ 12-10] = 0.00   where [OTC $ 12-10] is null;


--Now Delete where all are zero

	Delete from tmp_WHByUnits_jmw_2010 where 

		[GRx Units 01-10]  = 0.00 and
		[GRx $ 01-10] = 0.00   and
		[GRx Units 02-10]  = 0.00 and
		[GRx $ 02-10] = 0.00   and
		[GRx Units 03-10]  = 0.00 and
		[GRx $ 03-10] = 0.00   and

		[GRx Units 04-10]  = 0.00 and
		[GRx $ 04-10] = 0.00   and
		[GRx Units 05-10]  = 0.00 and
		[GRx $ 05-10] = 0.00   and
		[GRx Units 06-10]  = 0.00 and
		[GRx $ 06-10] = 0.00   and

		[GRx Units 07-10]  = 0.00 and
		[GRx $ 07-10] = 0.00   and
		[GRx Units 08-10]  = 0.00 and
		[GRx $ 08-10] = 0.00   and
		[GRx Units 09-10]  = 0.00 and
		[GRx $ 09-10] = 0.00   and
		[GRx Units 10-10]  = 0.00 and
		[GRx $ 10-10] = 0.00   and
		[GRx Units 11-10]  = 0.00 and
		[GRx $ 11-10] = 0.00   and
		[GRx Units 12-10]  = 0.00 and
		[GRx $ 12-10] = 0.00   and
	
		[BRx Units 01-10]  = 0.00 and
		[BRx $ 01-10] = 0.00   and
		[BRx Units 02-10]  = 0.00 and
		[BRx $ 02-10] = 0.00  and
		[BRx Units 03-10]  = 0.00 and
		[BRx $ 03-10] = 0.00  and
		[BRx Units 04-10]  = 0.00 and
		[BRx $ 04-10] = 0.00  and
		[BRx Units 05-10]  = 0.00 and
		[BRx $ 05-10] = 0.00  and
		[BRx Units 06-10]  = 0.00 and
		[BRx $ 06-10] = 0.00   and

		[BRx Units 07-10]  = 0.00 and
		[BRx $ 07-10] = 0.00   and
		[BRx Units 08-10]  = 0.00 and
		[BRx $ 08-10] = 0.00   and
		[BRx Units 09-10]  = 0.00 and
		[BRx $ 09-10] = 0.00   and


		[BRx Units 10-10]  = 0.00 and
		[BRx $ 10-10] = 0.00   and
		[BRx Units 11-10]  = 0.00 and
		[BRx $ 11-10] = 0.00   and
		[BRx Units 12-10]  = 0.00 and
		[BRx $ 12-10] = 0.00 and

		[OTC Units 01-10]  = 0.00 and
		[OTC $ 01-10] = 0.00   and
		[OTC Units 02-10]  = 0.00 and
		[OTC $ 02-10] = 0.00  and
		[OTC Units 03-10]  = 0.00 and
		[OTC $ 03-10] = 0.00   and
		[OTC Units 04-10]  = 0.00 and
		[OTC $ 04-10] = 0.00  and
		[OTC Units 05-10]  = 0.00 and
		[OTC $ 05-10] = 0.00  and
		[OTC Units 06-10]  = 0.00 and
		[OTC $ 06-10] = 0.00   and

		[OTC Units 07-10]  = 0.00 and
		[OTC $ 07-10] = 0.00  and
		[OTC Units 08-10]  = 0.00 and
		[OTC $ 08-10] = 0.00 and
		[OTC Units 09-10]  = 0.00 and
		[OTC $ 09-10] = 0.00  and

		 
		[OTC Units 10-10]  = 0.00 and
		[OTC $ 10-10] = 0.00  and
		[OTC Units 11-10]  = 0.00 and
		[OTC $ 11-10] = 0.00  and
		[OTC Units 12-10]  = 0.00 and
		[OTC $ 12-10] = 0.00 ;

-- Now update all the other stuff

	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[API#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
		[AAP Quit] =   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
    	[API Acct Eff] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		[API Status] = p.APIStatus 
  
	FROM tmp_WHByUnits_jmw_2010 v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

     UPDATE  tmp  set  
		 [Account DBA Name] = vol.acctname   
	      FROM  tmp_WHByUnits_jmw_2010  tmp  
		  inner join  
		 	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol  
	      on tmp.pmid = vol.pmid    
          where tmp.pmid < 99  





END








GO
