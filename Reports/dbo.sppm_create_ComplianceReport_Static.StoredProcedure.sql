USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ComplianceReport_Static]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ComplianceReport_Static]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_CompRep_jmw')
		 BEGIN
          DROP TABLE tmp_CompRep_jmw
         END
 
SELECT * INTO tmp_CompRep_jmw from (
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
		cast(null as varchar(20)) as [MC Chain Code] ,  
		cast(null as varchar(20)) as PVA ,  
    
		MAX([CAH 07-10])  as [CAH 07-10],	 
		MAX([CAH 08-10])  as [CAH 08-10],		 
		MAX([CAH 09-10])  as [CAH 09-10], 
		MAX([CAH 10-10])  as [CAH 10-10],	  
		cast(0 as numeric(18,2)) as [CAH Total Sales ], 
		MAX([ML 07-10])  as [ML 07-10],
		MAX([ML 08-10])  as [ML 08-10],
		MAX([ML 09-10])  as [ML 09-10],
		MAX([ML 10-10])  as [ML 10-10],
		cast(0 as numeric(18,2)) as [ML Total Sales],
		MAX([API 07-10])  as [API 07-10],
		MAX([API 08-10])  as [API 08-10],
		MAX([API 09-10])  as [API 09-10],
		MAX([API 10-10])  as [API 10-10],
		cast(0 as numeric(18,2)) as [API Total Sales]

 


	FROM (
	  SELECT PMID,date,

 		'CAH '+ RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateCNS ,
		sum(isnull(AAPNetSales,0)) as AAPNetSales,

		'ML '+  RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateML ,
		sum(isnull(MLTotal,0)) as MLTotal,

        'API ' +  RIGHT('0' + convert(varchar(2), month(date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    as dateWAT,
		sum(isnull(WHAPITotal,0))as WHAPITotal  


	  FROM pharmacymaster..all_volume  where ( month(date) in (07,08,09,10) and year(date) = 2010) 
 		 group by PMID ,date
	) as TableDate


	PIVOT 
	(
	  SUM(AAPNetSales)
	  FOR dateCNS IN  ([CAH 07-10], [CAH 08-10], [CAH 09-10], [CAH 10-10])
	)as P1

	PIVOT 
	(
	  SUM(MLTotal)
	  FOR dateML IN  ([ML 07-10], [ML 08-10], [ML 09-10], [ML 10-10] ) 
	)as P2

    
	PIVOT 
	(
	  SUM(WHAPITotal)
	  FOR dateWAT IN  ([API 07-10],[API 08-10],[API 09-10],[API 10-10])
	)as P3
	group by PMID 

)vol




--   		UPDATE tmp_CompRep_jmw set [CAH 07-10]  = 0.00 where [CAH 07-10] is null;
--		UPDATE tmp_CompRep_jmw set [CAH 08-10] = 0.00   where [CAH 08-10] is null;		 
--		UPDATE tmp_CompRep_jmw set [CAH 09-10] = 0.00   where [CAH 09-10] is null; 
--		UPDATE tmp_CompRep_jmw set [CAH 10-10] = 0.00   where [CAH 10-10] is null; 	  
--		UPDATE tmp_CompRep_jmw set [CAH Total Sales ]  = 0.00 where  [CAH Total Sales ] is null; 
--		UPDATE tmp_CompRep_jmw set [ML 07-10]  = 0.00   where [ML 07-10] is null; 
--		UPDATE tmp_CompRep_jmw set [ML 08-10]  = 0.00   where [ML 08-10] is null; 
--		UPDATE tmp_CompRep_jmw set [ML 09-10]  = 0.00   where [ML 09-10] is null; 
--		UPDATE tmp_CompRep_jmw set [ML 10-10]  = 0.00   where [ML 10-10] is null; 
--		UPDATE tmp_CompRep_jmw set  [ML Total Sales]  = 0.00  where  [ML Total Sales]  is null; 
--		UPDATE tmp_CompRep_jmw set [API 07-10]  = 0.00   where [API 07-10] is null; 
--		UPDATE tmp_CompRep_jmw set [API 08-10]  = 0.00   where [API 08-10] is null; 
--		UPDATE tmp_CompRep_jmw set [API 09-10]  = 0.00   where [API 09-10] is null; 
--		UPDATE tmp_CompRep_jmw set [API 10-10]  = 0.00   where [API 10-10] is null; 
--		UPDATE tmp_CompRep_jmw set [API Total Sales] = 0.00 where [API Total Sales] is null; 
--
--		UPDATE tmp_CompRep_jmw set [CAH Total Sales ] = [CAH 07-10] + [CAH 08-10] + [CAH 09-10] +  [CAH 10-10];
--		UPDATE tmp_CompRep_jmw set [ML Total Sales ] = [ML 07-10] + [ML 08-10] + [ML 09-10] +  [ML 10-10];
--		UPDATE tmp_CompRep_jmw set [API Total Sales ] = [API 07-10] + [API 08-10] + [API 09-10] +  [API 10-10];

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
		[API Status] = p.APIStatus ,
        [MC Chain Code] = case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end,
		PVA = case when w.vendor is null then 'CH' else w.vendor end    
	FROM tmp_CompRep_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

--Need to add in other ones that don't have volume


--Do this first to add in all aap that did not have volume in that time period and who have quit only in current year
--insert into tmp_CompRep_jmw ([TM],[PMID],[AAP#],[Parent#],[API#],[AAP Eff],[API Acct Eff],[AAP Quit],[API Status],[Description],[Affiliate],[Account DBA Name],[City],[ST],
--[MC Chain Code],[PVA],[CAH 07-10],[CAH 08-10],[CAH 09-10],[CAH 10-10],[CAH Total Sales] ,[ML 07-10],[ML 08-10],[ML 09-10],
--[ML 10-10],[ML Total Sales],[API 07-10],[API 08-10],[API 09-10],[API 10-10],[API Total Sales]) 

select 
		 p.territory ,p.pmid  ,
		  p.aapaccountno, p.aapparentno , p.apiaccountno , CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,CONVERT(VARCHAR(10), p.dateopened, 101) ,
		  CONVERT(VARCHAR(10), p.AAPQuitDate, 101),p.APIStatus ,p.AccountDescription ,p.Affiliate, p.[accountname],p.City, p.State ,
      
       case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end,
		 case when w.vendor is null then 'CH' else w.vendor end ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   
	FROM   pharmacymaster..v_PM_AllWithAffiliates p  
	left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid
    where p.pmid not in ( select pmid from tmp_CompRep_jmw)
    and (p.aapaccountno is not null and (p.aapquitdate is null or aapquitdate > '12/31/2009'))

-- To add in all pharmacies that are active or suspended but didn't have volume  
--
--insert into tmp_CompRep_jmw ([TM],[PMID],[AAP#],[Parent#],[API#],[AAP Eff],[API Acct Eff],[AAP Quit],[API Status],[Description],[Affiliate],[Account DBA Name],[City],[ST],
--[MC Chain Code],[PVA],[CAH 07-10],[CAH 08-10],[CAH 09-10],[CAH 10-10],[CAH Total Sales] ,[ML 07-10],[ML 08-10],[ML 09-10],
--[ML 10-10],[ML Total Sales],[API 07-10],[API 08-10],[API 09-10],[API 10-10],[API Total Sales]) 

select 
		 p.territory ,p.pmid  ,
		  p.aapaccountno, p.aapparentno , p.apiaccountno , CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,CONVERT(VARCHAR(10), p.dateopened, 101) ,
		  CONVERT(VARCHAR(10), p.AAPQuitDate, 101),p.APIStatus ,p.AccountDescription ,p.Affiliate, p.[accountname],p.City, p.State ,
      
       case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end,
		 case when w.vendor is null then 'CH' else w.vendor end ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   
	FROM   pharmacymaster..v_PM_AllWithAffiliates p  
	left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid
   where p.pmid not in ( select pmid from tmp_CompRep_jmw)
and (p.apiaccountno is not null and   (apistatus = 'Active' or apistatus = 'Suspended'))

--To add in all Affiliates that arent in there
 
--insert into tmp_CompRep_jmw ([TM],[PMID],[AAP#],[Parent#],[API#],[AAP Eff],[API Acct Eff],[AAP Quit],[API Status],[Description],[Affiliate],[Account DBA Name],[City],[ST],
--[MC Chain Code],[PVA],[CAH 07-10],[CAH 08-10],[CAH 09-10],[CAH 10-10],[CAH Total Sales] ,[ML 07-10],[ML 08-10],[ML 09-10],
--[ML 10-10],[ML Total Sales],[API 07-10],[API 08-10],[API 09-10],[API 10-10],[API Total Sales]) 

select 
		 p.territory ,p.pmid  ,
		  p.aapaccountno, p.aapparentno , p.apiaccountno , CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,CONVERT(VARCHAR(10), p.dateopened, 101) ,
		  CONVERT(VARCHAR(10), p.AAPQuitDate, 101),p.APIStatus ,p.AccountDescription ,p.Affiliate, p.[accountname],p.City, p.State ,
      
       case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end,
		 case when w.vendor is null then 'CH' else w.vendor end ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   
	FROM   pharmacymaster..v_PM_AllWithAffiliates p  
	left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid
   where p.pmid not in ( select pmid from tmp_CompRep_jmw)
and (p.affiliate is not null)

	UPDATE tmp_CompRep_jmw set PVA = 'CAH' where PVA = 'CH';

     UPDATE  tmp  set  
		 [Account DBA Name] = vol.acctname   
	      FROM  tmp_CompRep_jmw  tmp  
		  inner join  
		 	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol  
	      on tmp.pmid = vol.pmid    
          where tmp.pmid < 99  



END








GO
