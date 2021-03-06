USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_APIWHSalesByUnits_Static]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_APIWHSalesByUnits_Static]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_WHByUnits_jmw')
		 BEGIN
          DROP TABLE tmp_WHByUnits_jmw
         END
 
SELECT * INTO tmp_WHByUnits_jmw from (
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
		MAX([OTC $ 11-10])  as [OTC $ 11-10] 

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


	  FROM pharmacymaster..all_volume  where ( month(date) in (09,10,11) and year(date) = 2010) 
 		 group by PMID ,date
	) as TableDate


	PIVOT 
	(
	  SUM(WHAPIGenericUnits)
	  FOR dateGRU IN  ([GRx Units 09-10], [GRx Units 10-10], [GRx Units 11-10])
	)as P1

	PIVOT 
	(
	  SUM(WHAPIGeneric)
	  FOR dateGRD IN  ([GRx $ 09-10], [GRx $ 10-10], [GRx $ 11-10]) 
	)as P2

    
	
	PIVOT 
	(
	  SUM(WHAPIBrandUnits)
	  FOR dateBRU IN  ([BRx Units 09-10], [BRx Units 10-10], [BRx Units 11-10])
	)as P3

	PIVOT 
	(
	  SUM(WHAPIBrand)
	  FOR dateBRD IN  ([BRx $ 09-10], [BRx $ 10-10], [BRx $ 11-10]) 
	)as P4

	PIVOT 
	(
	  SUM(WHAPIOTCUnits)
	  FOR dateOTU IN  ([OTC Units 09-10], [OTC Units 10-10], [OTC Units 11-10])
	)as P5

	PIVOT 
	(
	  SUM(WHAPIOTC)
	  FOR dateOTD IN  ([OTC $ 09-10], [OTC $ 10-10], [OTC $ 11-10]) 
	)as P6

	group by PMID 

)vol




   		UPDATE tmp_WHByUnits_jmw set [GRx Units 09-10]  = 0.00 where [GRx Units 09-10] is null;
		UPDATE tmp_WHByUnits_jmw set [GRx $ 09-10] = 0.00   where [GRx $ 09-10] is null;	 
   		UPDATE tmp_WHByUnits_jmw set [GRx Units 10-10]  = 0.00 where [GRx Units 10-10] is null;
		UPDATE tmp_WHByUnits_jmw set [GRx $ 10-10] = 0.00   where [GRx $ 10-10] is null;
   		UPDATE tmp_WHByUnits_jmw set [GRx Units 11-10]  = 0.00 where [GRx Units 11-10] is null;
		UPDATE tmp_WHByUnits_jmw set [GRx $ 11-10] = 0.00   where [GRx $ 11-10] is null;

   		UPDATE tmp_WHByUnits_jmw set [BRx Units 09-10]  = 0.00 where [BRx Units 09-10] is null;
		UPDATE tmp_WHByUnits_jmw set [BRx $ 09-10] = 0.00   where [BRx $ 09-10] is null;	 
   		UPDATE tmp_WHByUnits_jmw set [BRx Units 10-10]  = 0.00 where [BRx Units 10-10] is null;
		UPDATE tmp_WHByUnits_jmw set [BRx $ 10-10] = 0.00   where [BRx $ 10-10] is null;
   		UPDATE tmp_WHByUnits_jmw set [BRx Units 11-10]  = 0.00 where [BRx Units 11-10] is null;
		UPDATE tmp_WHByUnits_jmw set [BRx $ 11-10] = 0.00   where [BRx $ 11-10] is null;

   		UPDATE tmp_WHByUnits_jmw set [OTC Units 09-10]  = 0.00 where [OTC Units 09-10] is null;
		UPDATE tmp_WHByUnits_jmw set [OTC $ 09-10] = 0.00   where [OTC $ 09-10] is null;	 
   		UPDATE tmp_WHByUnits_jmw set [OTC Units 10-10]  = 0.00 where [OTC Units 10-10] is null;
		UPDATE tmp_WHByUnits_jmw set [OTC $ 10-10] = 0.00   where [OTC $ 10-10] is null;
   		UPDATE tmp_WHByUnits_jmw set [OTC Units 11-10]  = 0.00 where [OTC Units 11-10] is null;
		UPDATE tmp_WHByUnits_jmw set [OTC $ 11-10] = 0.00   where [OTC $ 11-10] is null;

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
  
	FROM tmp_WHByUnits_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

     UPDATE  tmp  set  
		 [Account DBA Name] = vol.acctname   
	      FROM  tmp_WHByUnits_jmw  tmp  
		  inner join  
		 	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol  
	      on tmp.pmid = vol.pmid    
          where tmp.pmid < 99  


END








GO
