USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ComplianceReport_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ComplianceReport_DYN]
(@in_month1 varchar(2),@in_month2 varchar(2),@in_month3 varchar(2),@in_month4 varchar(2), @in_year varchar(4))

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
 
	DECLARE @prev_year varchar(4);
    SET @prev_year = @in_year - 1;

	DECLARE @SQL_IN_MONTH  varchar(500);
	DECLARE @SQL   varchar(8000);
    DECLARE @in_year4   varchar(2);
	DECLARE @in_year3   varchar(2);
	DECLARE @in_year2   varchar(2);
	DECLARE @in_year1   varchar(2);

    DECLARE @col_mmyy4   varchar(5);
	DECLARE @col_mmyy3   varchar(5);
	DECLARE @col_mmyy2   varchar(5);
	DECLARE @col_mmyy1   varchar(5);

    DECLARE @aap_quitDate varchar(10);
	SET @aap_quitDate = '12/31/2009';

	DECLARE @short_year   varchar(2);
	DECLARE @short_year_prev   varchar(2);
    SET @short_year = SUBSTRING(CONVERT(VARCHAR(9), year(@in_year),4), 3, 2) 
	SET @short_year_prev = SUBSTRING(CONVERT(VARCHAR(9), year(@prev_year),4), 3, 2) 

	IF(@in_month4 = '01')
		BEGIN
			SET @SQL_IN_MONTH =  'where ( month(date) in (' + @in_month4 + ')  and year(date) = ' + @in_year +') or (month(date) in ' +
                                  '( '+  @in_month1 +',' +  @in_month2 + ',' +  @in_month3 +') and year(date) = ' + @prev_year +') ';
			SET @col_mmyy1 = @in_month1 + '-' + @short_year_prev;
			SET @col_mmyy2 = @in_month2 + '-' + @short_year_prev;
			SET @col_mmyy3 = @in_month3 + '-' + @short_year_prev;
			SET @col_mmyy4 = @in_month4 + '-' + @short_year;
		END 
   IF(@in_month4 = '02')
       BEGIN
			SET @SQL_IN_MONTH =  'where ( month(date) in (' + @in_month3 + ',' + @in_month4 + ')  and year(date) = ' + @in_year +') or (month(date) in ' +
                                  '( '+  @in_month1 +',' +  @in_month2 +   ') and year(date) = ' + @prev_year +') ';
			SET @col_mmyy1 = @in_month1 + '-' + @short_year_prev;
			SET @col_mmyy2 = @in_month2 + '-' + @short_year_prev;
			SET @col_mmyy3 = @in_month3 + '-' + @short_year;
			SET @col_mmyy4 = @in_month4 + '-' + @short_year;
		END 
   IF(@in_month4 = '03')
       BEGIN
			SET @SQL_IN_MONTH =  'where ( month(date) in (' + @in_month2 + ',' + @in_month3 + ',' + @in_month4 +  ')  and year(date) = ' + @in_year +') or (month(date) in ' +
                                  '( '+  @in_month1 +   ') and year(date) = ' + @prev_year +') ';
			SET @col_mmyy1 = @in_month1 + '-' + @short_year_prev;
			SET @col_mmyy2 = @in_month2 + '-' + @short_year;
			SET @col_mmyy3 = @in_month3 + '-' + @short_year;
			SET @col_mmyy4 = @in_month4 + '-' + @short_year;
		END 
   IF(@in_month4 != '01' and  @in_month4 != '02' and @in_month4 != '03')
		BEGIN
			SET @SQL_IN_MONTH =  'where ( month(date) in (' +  @in_month1 +','+ @in_month2 + ',' + @in_month3 + ',' + @in_month4 +  ')  and year(date) = ' + @in_year +')';
			SET @col_mmyy1 = @in_month1 + '-' + @short_year;
			SET @col_mmyy2 = @in_month2 + '-' + @short_year;
			SET @col_mmyy3 = @in_month3 + '-' + @short_year;
			SET @col_mmyy4 = @in_month4 + '-' + @short_year;
		END

	
		 

	SET @SQL = 'SELECT * INTO tmp_CompRep_jmw from ( '+
					' SELECT   '+
					'	cast(null as varchar(10)) as TM ,'+
					'	PMID,  '+
					'	cast(null as varchar(20)) as AAP# ,  '+
					'	cast(null as varchar(20)) as Parent# ,'+
					'	cast(null as varchar(20)) as [API#] , '+    
					'	cast('''' as varchar(25))  as [AAP Eff], '+
					'	cast('''' as varchar(25))  as [API Acct Eff],  '+ 
					'	cast('''' as varchar(25))  as [AAP Quit],  '+ 
					'	cast(null as varchar(20)) as [API Status] , '+
					'	cast(null as  varchar(200)) as Description , '+ 
					'	cast(null as  varchar(200)) as Affiliate ,  '+  
					'	cast(null as  varchar(100)) as [Account DBA Name] ,  '+
					'	cast(null as  varchar(100)) as [City] ,   '+
					'	cast(null as  varchar(100)) as ST , '+
					'	cast(null as varchar(20)) as [MC Chain Code] ,  '+
					'	cast(null as varchar(20)) as PVA ,  '+
				    
					'	MAX([CAH ' + @col_mmyy1 + '])  as [CAH ' + @col_mmyy1 + '],	 '+
					'	MAX([CAH ' + @col_mmyy2 + '])  as [CAH ' + @col_mmyy2 + '],	'+	 
					'	MAX([CAH ' + @col_mmyy3 + '])  as [CAH ' + @col_mmyy3 + '], '+
					'	MAX([CAH ' + @col_mmyy4 + '])  as [CAH ' + @col_mmyy4 + '],	 '+ 
					'	cast(0 as numeric(18,2)) as [CAH Total Sales ], '+
					'	MAX([ML ' + @col_mmyy1 + '])  as [ML ' + @col_mmyy1 + '], '+
					'	MAX([ML ' + @col_mmyy2 + '])  as [ML ' + @col_mmyy2 + '], '+
					'	MAX([ML ' + @col_mmyy3 + '])  as [ML ' + @col_mmyy3 + '],'+
					'	MAX([ML ' + @col_mmyy4 + '])  as [ML ' + @col_mmyy4 + '], '+
					'	cast(0 as numeric(18,2)) as [ML Total Sales], '+
					'	MAX([API ' + @col_mmyy1 + '])  as [API ' + @col_mmyy1 + '],'+
					'	MAX([API ' + @col_mmyy2 + '])  as [API ' + @col_mmyy2 + '],'+
					'	MAX([API ' + @col_mmyy3 + '])  as [API ' + @col_mmyy3 + '],'+
					'	MAX([API ' + @col_mmyy4 + '])  as [API ' + @col_mmyy4 + '],'+
					'	cast(0 as numeric(18,2)) as [API Total Sales]'+

			' FROM ( '+
			'  SELECT PMID,date, '+

 				'''CAH ''+ RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateCNS , '+
				' sum(isnull(AAPNetSales,0)) as AAPNetSales, '+

				'''ML ''+  RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateML ,  '+
				' sum(isnull(MLTotal,0)) as MLTotal, '+

				'''API '' +  RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    as dateWAT, '+
				' sum(isnull(WHAPITotal,0))as WHAPITotal  '+


			  ' FROM pharmacymaster..all_volume  ' +  @SQL_IN_MONTH + 
 			  '	 group by PMID ,date '+
			') as TableDate '+


			' PIVOT '+
			'( '+
			'  SUM(AAPNetSales) '+
			'  FOR dateCNS IN  ([CAH ' + @col_mmyy1 + '], [CAH ' + @col_mmyy2 + '], [CAH ' + @col_mmyy3 + '], [CAH ' + @col_mmyy4 + ']) '+
			')as P1 '+

			' PIVOT '+
			'( '+
			'  SUM(MLTotal) '+
			'  FOR dateML IN  ([ML ' + @col_mmyy1 + '], [ML ' + @col_mmyy2 + '], [ML ' + @col_mmyy3 + '], [ML ' + @col_mmyy4 + '] ) '+
			')as P2 '+

		    
			' PIVOT '+
			'( '+
			'  SUM(WHAPITotal) '+
			'  FOR dateWAT IN  ([API ' + @col_mmyy1 + '],[API ' + @col_mmyy2 + '],[API ' + @col_mmyy3 + '],[API ' + @col_mmyy4 + ']) '+
			')as P3 '+
			' group by PMID '+

		')vol ';

		PRINT @SQL;
		EXEC (@SQL);




   		SET @SQL = 'UPDATE tmp_CompRep_jmw set [CAH ' + @col_mmyy1 + ']  = 0.00 where [CAH ' + @col_mmyy1 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [CAH ' + @col_mmyy2 + '] = 0.00   where [CAH ' + @col_mmyy2 + '] is null; ';	
        EXEC (@SQL);
	 
		SET @SQL = 'UPDATE tmp_CompRep_jmw set [CAH ' + @col_mmyy3 + '] = 0.00   where [CAH ' + @col_mmyy3 + '] is null;  ';
        EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [CAH ' + @col_mmyy4 + '] = 0.00   where [CAH ' + @col_mmyy4 + '] is null;  ';
        EXEC (@SQL);
	  
		UPDATE tmp_CompRep_jmw set [CAH Total Sales ]  = 0.00 where  [CAH Total Sales ] is null; 

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [ML ' + @col_mmyy1 + ']  = 0.00   where [ML ' + @col_mmyy1 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [ML ' + @col_mmyy2 + ']  = 0.00   where [ML ' + @col_mmyy2 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [ML ' + @col_mmyy3 + ']  = 0.00   where [ML ' + @col_mmyy3 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [ML ' + @col_mmyy4 + ']  = 0.00   where [ML ' + @col_mmyy4 + '] is null; ';
		EXEC (@SQL);

		UPDATE tmp_CompRep_jmw set  [ML Total Sales]  = 0.00  where  [ML Total Sales]  is null; 

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [API ' + @col_mmyy1 + ']  = 0.00   where [API ' + @col_mmyy1 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [API ' + @col_mmyy2 + ']  = 0.00   where [API ' + @col_mmyy2 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [API ' + @col_mmyy3 + ']  = 0.00   where [API ' + @col_mmyy3 + '] is null; ';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [API ' + @col_mmyy4 + ']  = 0.00   where [API ' + @col_mmyy4 + '] is null; ';
		EXEC (@SQL);

		UPDATE tmp_CompRep_jmw set [API Total Sales] = 0.00 where [API Total Sales] is null; 

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [CAH Total Sales ] = [CAH ' + @col_mmyy1 + '] + [CAH ' + @col_mmyy2 + '] + [CAH ' + @col_mmyy3 + '] +  [CAH ' + @col_mmyy4 + '];';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [ML Total Sales ] = [ML ' + @col_mmyy1 + '] + [ML ' + @col_mmyy2 + '] + [ML ' + @col_mmyy3 + '] +  [ML ' + @col_mmyy4 + '];';
		EXEC (@SQL);

		SET @SQL = 'UPDATE tmp_CompRep_jmw set [API Total Sales ] = [API ' + @col_mmyy1 + '] + [API ' + @col_mmyy2 + '] + [API ' + @col_mmyy3 + '] +  [API ' + @col_mmyy4 + '];';
		EXEC (@SQL);

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


--Do this first to add in all aap that did not have volume in that time period and who have quit only in current year
SET @SQL =  ' INSERT into tmp_CompRep_jmw ([TM],[PMID],[AAP#],[Parent#],[API#],[AAP Eff],[API Acct Eff],[AAP Quit],[API Status],[Description],[Affiliate],[Account DBA Name],[City],[ST], '+
            ' [MC Chain Code],[PVA], ' + 
            ' [CAH ' + @col_mmyy1 + '],[CAH ' + @col_mmyy2 + '],[CAH ' + @col_mmyy3 + '],[CAH ' + @col_mmyy4 + '],[CAH Total Sales] , '+
            ' [ML ' + @col_mmyy1 + '],[ML ' + @col_mmyy2 + '],[ML ' + @col_mmyy3 + '],[ML ' + @col_mmyy4 + '],[ML Total Sales], ' +
            ' [API ' + @col_mmyy1 + '],[API ' + @col_mmyy2 + '],[API ' + @col_mmyy3 + '],[API ' + @col_mmyy4 + '],[API Total Sales])  ' +

			' SELECT ' +
		    '   p.territory ,p.pmid  , '+
		    '   p.aapaccountno, p.aapparentno , p.apiaccountno , CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,CONVERT(VARCHAR(10), p.dateopened, 101) , '+
		    '   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),p.APIStatus ,p.AccountDescription ,p.Affiliate, p.[accountname],p.City, p.State , '+
      
            '   case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end, '+
		    '   case when w.vendor is null then ''CH'' else w.vendor end ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   '+
	        ' FROM   pharmacymaster..v_PM_AllWithAffiliates p  ' +
			'    left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid '+
            '    where p.pmid not in ( select pmid from tmp_CompRep_jmw) '+
            '  and (p.aapaccountno is not null and (p.aapquitdate is null or aapquitdate > ''' + @aap_quitDate + ''')) ';

EXEC (@SQL);

-- To add in all pharmacies that are active or suspended but didn't have volume  

SET @SQL =  ' INSERT into tmp_CompRep_jmw ([TM],[PMID],[AAP#],[Parent#],[API#],[AAP Eff],[API Acct Eff],[AAP Quit],[API Status],[Description],[Affiliate],[Account DBA Name],[City],[ST], '+
            ' [MC Chain Code],[PVA], ' + 
            ' [CAH ' + @col_mmyy1 + '],[CAH ' + @col_mmyy2 + '],[CAH ' + @col_mmyy3 + '],[CAH ' + @col_mmyy4 + '],[CAH Total Sales] , '+
            ' [ML ' + @col_mmyy1 + '],[ML ' + @col_mmyy2 + '],[ML ' + @col_mmyy3 + '],[ML ' + @col_mmyy4 + '],[ML Total Sales], ' +
            ' [API ' + @col_mmyy1 + '],[API ' + @col_mmyy2 + '],[API ' + @col_mmyy3 + '],[API ' + @col_mmyy4 + '],[API Total Sales])  ' +

			' SELECT ' +
		    '   p.territory ,p.pmid  , '+
		    '   p.aapaccountno, p.aapparentno , p.apiaccountno , CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,CONVERT(VARCHAR(10), p.dateopened, 101) , '+
		    '   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),p.APIStatus ,p.AccountDescription ,p.Affiliate, p.[accountname],p.City, p.State , '+
      
            '   case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end, '+
		    '   case when w.vendor is null then ''CH'' else w.vendor end ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   '+
	        ' FROM   pharmacymaster..v_PM_AllWithAffiliates p  ' +
			'    left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid '+
            '    where p.pmid not in ( select pmid from tmp_CompRep_jmw) '+
            '    and (p.apiaccountno is not null and   (apistatus = ''Active'' or apistatus = ''Suspended''))' ;

EXEC (@SQL);

--To add in all Affiliates that arent in there

SET @SQL =  ' INSERT into tmp_CompRep_jmw ([TM],[PMID],[AAP#],[Parent#],[API#],[AAP Eff],[API Acct Eff],[AAP Quit],[API Status],[Description],[Affiliate],[Account DBA Name],[City],[ST], '+
            ' [MC Chain Code],[PVA], ' + 
            ' [CAH ' + @col_mmyy1 + '],[CAH ' + @col_mmyy2 + '],[CAH ' + @col_mmyy3 + '],[CAH ' + @col_mmyy4 + '],[CAH Total Sales] , '+
            ' [ML ' + @col_mmyy1 + '],[ML ' + @col_mmyy2 + '],[ML ' + @col_mmyy3 + '],[ML ' + @col_mmyy4 + '],[ML Total Sales], ' +
            ' [API ' + @col_mmyy1 + '],[API ' + @col_mmyy2 + '],[API ' + @col_mmyy3 + '],[API ' + @col_mmyy4 + '],[API Total Sales])  ' +

			' SELECT ' +
		    '   p.territory ,p.pmid  , '+
		    '   p.aapaccountno, p.aapparentno , p.apiaccountno , CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,CONVERT(VARCHAR(10), p.dateopened, 101) , '+
		    '   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),p.APIStatus ,p.AccountDescription ,p.Affiliate, p.[accountname],p.City, p.State , '+
      
            '   case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end, '+
		    '   case when w.vendor is null then ''CH'' else w.vendor end ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0   '+
	        ' FROM   pharmacymaster..v_PM_AllWithAffiliates p  ' +
			'    left join pharmacymaster..v_wholesaler_primary w on p.pmid=w.pmid '+
            '    where p.pmid not in ( select pmid from tmp_CompRep_jmw) '+
            ' and (p.affiliate is not null) ';
EXEC (@SQL);

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
