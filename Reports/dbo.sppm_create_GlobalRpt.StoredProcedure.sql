USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_GlobalRpt]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_GlobalRpt]
(@in_month varchar(50), @in_year varchar(4),@in_Qtr varchar(2),@in_TableName varchar(50))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
    DECLARE @lastMonth varchar(2);

	DECLARE @SQL   varchar(5000);
	DECLARE @date datetime;
	DECLARE @dateOut varchar(10);
 
    SET @lastMonth =  (SELECT substring(@in_month,len(@in_month) - 1,2));
 
 
    IF(@in_Qtr is null)
		BEGIN
		SET @date = @lastMonth + '/01/' + @in_year

		SET @dateOut =  (SELECT SUBSTRING(CONVERT(VARCHAR(11),@date, 109), 10, 2) )
		SET @dateOut = @dateOut + '-';

		SET @dateOut =  @dateOut + (SELECT SUBSTRING(CONVERT(VARCHAR(11),@date, 109), 1, 3) )
		IF(len(@in_month) > 2)
			BEGIN
				SET @dateOut = 'YTD_' + @dateOut
			END
		END
   ELSE 
	BEGIN	
		SET @dateOut = @in_Qtr + ' ' + @in_year;
	END
		
		

 
	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @in_TableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @in_TableName +
				'   END ';

	EXEC (@SQL);
 
    SET @SQL = 'SELECT * INTO  ' + @in_TableName + ' from ( '+
 
	            ' SELECT   '+
                ' PMID,  '+
			    ' cast(null as varchar(20)) as AAP# ,  '+
			    ' cast(null as varchar(20)) as Parent# ,  '+
                ' cast('''' as DateTime) as [AAP Eff. Date],  '+
                ' cast('''' as DateTime) as [AAP Quit Date],  '+
			    ' cast(null as varchar(20)) as API# ,  '+
			    ' cast(null as varchar(20)) as [ChainCode] ,  '+
			    ' cast(null as  varchar(100)) as [Account Name] ,  '+
			    ' cast(null as  varchar(100)) as [City] ,  '+
			    ' cast(null as  varchar(100)) as ST , '+
			    ' cast(null as varchar(10)) as TM , '+
			    ' cast(null as varchar(20)) as DEA , '+
			    ' cast(null as  varchar(200)) as Affiliate ,   '+
			    ' cast(null as  varchar(10)) as BC ,  '+
                ' cast(''' + @dateOut + ''' as  varchar(10)) as Period , '+
			    ' SUM([CH Gen Src]) as [CH Gen Src],'+
			    ' SUM([CH Gen Exc]) as [CH Gen Exc], '+
			    ' SUM([CH Gen Total]) as [CH Gen Total], '+
			    ' SUM([CH Brand]) as [CH Brand], '+
                ' SUM([CH Other]) as [CH Other], '+
--Start New here
				' SUM([CH Total RX]) as [CH Total RX], '+
                ' SUM([CH Excluded from Total RX]) as [CH Excluded from Total RX], '+
			    ' SUM([CH NonRX - OTC&HH]) as [CH NonRX - OTC&HH], '+
				' MAX([CH Source Compliance]) as [CH Source Compliance], '+
--End new
--                ' SUM([CH Bashas]) as [CH Bashas], '+
			    ' SUM([CH Total]) as [CH Total],  '+
			    ' SUM([API Gen]) as [API Gen], '+
			    ' SUM([API Br]) as [API Br], '+
			    ' SUM([API OTC]) as [API OTC], '+
			    ' SUM([API Total]) as [API Total], '+
			    ' SUM([ML Total]) as [ML Total], '+
--			    ' SUM([Anda Total]) as [Anda Total], '+
			    ' SUM([All Total]) as [All Total] '+
   
--	' FROM ( '+
--	  ' SELECT PMID,date, '+
--		  '''CH Gen Src'' as dateGTS, '+
--		     'sum(isnull(CombGENTotalSrc,0))as CombGENTotalSrc  , '+
--		  '''CH Gen Exc'' as dateGEX,  '+
--			'sum(isnull(CombGENTotal,0)) - sum(isnull(CombGENTotalSrc,0)) as CombGENExcluded,  '+
--          '''CH Gen Total'' as dateGTT,  '+
--		     'sum(isnull(CombGENTotal,0))as CombGENTotal  ,    '+
--           '''CH Brand'' as dateCHB,  '+
--			'sum(isnull(CombBrands,0))as CombBrands ,  '+
--
--
--		   '''CH Other'' as dateCHO,  '+
--			'sum(isnull(CombOther,0)) +  sum(isnull(CombOTC,0))as CombOther,   '+  

	' FROM ( '+
	  ' SELECT PMID,date, '+
		  '''CH Gen Src'' as dateGTS, '+
		     'sum(isnull(AAPGENTotalSrc,0))as AAPGENTotalSrc  , '+
		  '''CH Gen Exc'' as dateGEX,  '+
			'sum(isnull(AAPGENExcl,0))  as AAPGENExcl,  '+
          '''CH Gen Total'' as dateGTT,  '+
		     'sum(isnull(AAPGENTotal,0))as AAPGENTotal  ,    '+
           '''CH Brand'' as dateCHB,  '+
			'sum(isnull(AAPBrand,0))as AAPBrand ,  '+


		   '''CH Other'' as dateCHO,  '+
			'sum(isnull(AAPOther,0)) +  sum(isnull(AAPOTC,0))as AAPOther,   '+  


-- Start New here
			'''CH Total RX'' as dateTRX,  '+
			'sum(isnull(AAPTotalRX,0))as AAPTotalRX ,  '+

			'''CH Excluded from Total RX'' as dateETRX,  '+
			'sum(isnull(AAPExcludedFromTotalRX,0))as AAPExcludedFromTotalRX ,  '+

			'''CH NonRX - OTC&HH'' as dateNROH,  '+
			'sum(isnull(AAPNonRXOTCandHH,0))as AAPNonRXOTCandHH ,  '+

			'''CH Source Compliance'' as dateSC,  '+
			'max(isnull(AAPSourceCompliance,0))as AAPSourceCompliance ,  '+
--ENd new 
--           '''CH Bashas'' as dateCHUO,  '+  
--			'sum(isnull(UDNetSales,0))as UDNetSales,  '+  
           '''CH Total'' as dateCHT,  '+  
			'sum(isnull(AAPNetSales,0))as AAPNetSales ,  '+  
           '''API Gen'' as dateAPIG,  '+  
			'sum(isnull(WHAPIGeneric,0))as WHAPIGeneric,  '+  
			'''API Br'' as dateAPIB,  '+  
			'sum(isnull(WHAPIBrand,0))as WHAPIBrand,  '+  
			'''API OTC'' as dateAPIO,  '+  
			'sum(isnull(WHAPIOTC,0))as WHAPIOTC ,  '+  
			'''API Total'' as dateAPIT,  '+  
			'sum(isnull(WHAPIGeneric,0)) + sum(isnull(WHAPIBrand,0)) + sum(isnull(WHAPIOTC,0))as WHAPITot,  '+  
			'''ML Total'' as dateMLT,  '+  
			'sum(isnull(MLTotal,0))as MLTotal ,    '+  
--			'''Anda Total'' as dateAT,  '+  
--			'sum(isnull(AndaTotal,0))as AndaTotal,  '+  
			'''All Total'' as dateAllT,  '+  
			'sum(isnull(WHAPIGeneric,0)) + sum(isnull(WHAPIBrand,0)) + sum(isnull(WHAPIOTC,0)) +  '+  
                'sum(isnull(AAPNetSales,0)) + sum(isnull(MLTotal,0))   as AllTotal      '+  
 

	  ' FROM PharmacyMaster..all_volume  where ( month(date) in ( ' + @in_month + ') and year(date) = '+ @in_year + ') ' +
				         
	  ' group by PMID ,date '+
  ' ) as TableDate '+
--' PIVOT '+
--	' ( '+
--	  ' SUM(CombGENTotalSrc) '+
--	  ' FOR dateGTS IN  ([CH Gen Src]) '+
--	' )as P1 '+
--
--	' PIVOT '+
--	' ( '+
--	  ' SUM(CombGENExcluded) '+
--	  ' FOR dateGEX IN  ([CH Gen Exc]) '+
--	' )as P2 '+
--    ' PIVOT  '+
--	' ( '+
--	  ' SUM(CombGENTotal) '+
--	  ' FOR dateGTT IN  ([CH Gen Total]) '+
--	' )as P3 '+
--    '  PIVOT '+
--	' ( '+
--	 '  SUM(CombBrands) '+
--	  ' FOR dateCHB IN  ([CH Brand]) '+
--	' )as P4 '+
--    '  PIVOT '+
--	' ( '+
--	  ' SUM(CombOther) '+
--	  ' FOR dateCHO IN  ([CH Other]) '+
--	' )as P5 '+

' PIVOT '+
	' ( '+
	  ' SUM(AAPGENTotalSrc) '+
	  ' FOR dateGTS IN  ([CH Gen Src]) '+
	' )as P1 '+

	' PIVOT '+
	' ( '+
	  ' SUM(AAPGENExcl) '+
	  ' FOR dateGEX IN  ([CH Gen Exc]) '+
	' )as P2 '+
    ' PIVOT  '+
	' ( '+
	  ' SUM(AAPGENTotal) '+
	  ' FOR dateGTT IN  ([CH Gen Total]) '+
	' )as P3 '+
    '  PIVOT '+
	' ( '+
	 '  SUM(AAPBrand) '+
	  ' FOR dateCHB IN  ([CH Brand]) '+
	' )as P4 '+
    '  PIVOT '+
	' ( '+
	  ' SUM(AAPOther) '+
	  ' FOR dateCHO IN  ([CH Other]) '+
	' )as P5 '+
--Start New here
'  PIVOT '+
	' ( '+
	  ' SUM(AAPTotalRX) '+
	  ' FOR dateTRX IN  ([CH Total RX]) '+
	' )as P5a '+

'  PIVOT '+
	' ( '+
	  ' SUM(AAPExcludedFromTotalRX) '+
	  ' FOR dateETRX IN  ([CH Excluded from Total RX]) '+
	' )as P5b '+

'  PIVOT '+
	' ( '+
	  ' SUM(AAPNonRXOTCandHH) '+
	  ' FOR dateNROH IN  ([CH NonRX - OTC&HH]) '+
	' )as P5c '+
 

'  PIVOT '+
	' ( '+
	  ' MAX(AAPSourceCompliance) '+
	  ' FOR dateSC IN  ([CH Source Compliance]) '+
	' )as P5c '+
--End New 
--	'  PIVOT '+
--	' ( '+
--	 '  SUM(UDNetSales) '+
--	 '  FOR dateCHUO IN  ([CH Bashas]) '+
--	' )as P6 '+
    '  PIVOT '+
	' ( '+
	'   SUM(AAPNetSales) '+
	'   FOR dateCHT IN  ([CH Total]) '+
	' )as P7 '+
    '  PIVOT  '+
	' ( '+
	 '  SUM(WHAPIGeneric) '+
	'   FOR dateAPIG IN  ([API Gen]) '+
	' )as P8 '+
    '  PIVOT '+
	' ( '+
	'   SUM(WHAPIBrand) '+
	'   FOR dateAPIB IN  ([API Br]) '+
	' )as P9 '+
    '  PIVOT  '+
	' ( '+
	 '  SUM(WHAPIOTC) '+
	 '  FOR dateAPIO IN  ([API OTC]) '+
	' )as P10 '+
    '  PIVOT '+
	' ( '+
	'   SUM(WHAPITot)  '+
	'   FOR dateAPIT IN  ([API Total]) '+
	' )as P11 '+
	'  PIVOT '+
	' ( '+
	'   SUM(MLTotal) '+
	'   FOR dateMLT IN  ([ML Total]) '+
	' )as P12 '+
--	' PIVOT  '+
--	' ( '+
--	 '  SUM(AndaTotal) '+
--	 '  FOR dateAT IN  ([Anda Total]) '+
--	' )as P13 '+
    ' PIVOT '+
	' ( '+
	'   SUM(AllTotal) '+
	'   FOR dateAllT IN  ([All Total]) '+
	' )as P13 '+
	' group by PMID '+

' )vol' ;
PRINT @SQL;
EXEC(@SQL);

SET @SQL = '	UPDATE v set '+
		' TM = p.territory  , '+
		' [AAP#] = p.aapaccountno, '+
		' [Parent#] = p.aapparentno , '+
		' [API#] = p.apiaccountno , '+
		' Affiliate = p.Affiliate, '+
        ' DEA = p.DEA, '+
		' [Account Name] = p.[accountname], '+
		' City = p.City,  '+
		' ST = p.State , '+
        ' BC = p.BusinessClass, '+
        ' ChainCode = case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end ,' +
        ' [AAP Eff. Date] = p.aapeffectivedate, '+
        '  [AAP Quit Date] = p.aapquitdate '+
  
	 ' FROM   ' +  @in_TableName + ' v '+
	 ' left join PharmacyMaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid ';
EXEC(@SQL);

SET @SQL = ' UPDATE  tmp  set ' +
		' [Account Name] = vol.acctname  ' +
	    '  FROM ' + @in_TableName + '   tmp ' +
		' inner join '+
		'	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol '+
	    ' on tmp.pmid = vol.pmid   '+
        ' where tmp.pmid < 99 ';
 
EXEC(@SQL);

SET @SQL = ' UPDATE ' + @in_TableName + ' set [Account Name] = ''Unmatched Accounts '' where pmid = 900000';
EXEC(@SQL);

--SET @SQL = ' UPDATE  tmp  set ' +
--		' [Account Name] = vol.acctname,  ' +
--        ' City = vol.City,  '+
--		' ST = vol.State   '+
--	    '  FROM ' + @in_TableName + '   tmp ' +
--		' inner join '+
--		'	( select max(accountname) as acctname, pmid ,City,State from pharmacymaster..all_volume where PMID = 100635 group by pmid,City,State ) vol '+
--	    ' on tmp.pmid = vol.pmid   '+
--        ' where tmp.pmid = 100635 ';
--EXEC(@SQL);
END








GO
