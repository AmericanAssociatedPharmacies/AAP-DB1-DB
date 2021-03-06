USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PatDivRebate_ForPipco]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sppm_PatDivRebate_ForPipco]
( @in_month1 varchar(2),@in_month2 varchar(2) ,@in_year varchar(4))
AS

BEGIN
 
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(2000);
	DECLARE @date1 varchar(10);
	DECLARE @date2 varchar(10);
	DECLARE @colDate1 varchar(20);
	DECLARE @colDate2 varchar(20);
	DECLARE @year_PatDiv_int int;
	DECLARE @year_PatDiv  varchar(4);

	SET @date1 = @in_month1 + '/01/' + @in_year;
	SET @date2 = @in_month2 + '/01/' + @in_year;

	SET @colDate1 = dbo.fdate4(@date1);
	SET @colDate2 = dbo.fdate4(@date2);
	SET @year_PatDiv_int = cast(@in_year as int) -1;
	SET @year_PatDiv = cast( @year_PatDiv_int as varchar(4));

 


	SET @tableName = 'tmp_PatDiv_Pipco' ;

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);

 
		SET @SQL = ' SELECT  r.pmid  as PMID,  ' +
		' p.[accountname] as [Store Name],  ' +
		' case when (p.ownername is null or ltrim(p.ownername)='''') then p.contactfullname else p.ownername end as Contact,  ' +
		' a.address as [Store Address – Line 1],  ' +
		' a.address2 as [Store Address – Line 2],  ' +
		' a.city as [City], a.state as [State], a.zip as [Zip],  ' +
		' case when (p.corporatename is null or ltrim(p.corporatename)='''') then p.accountname else p.corporatename end as [Corporate Name],  ' +
 
		' r.PatronageDividend as [Total Patr Div], ' +
		' r.PatDivFirstPayment as [Pay on ' + @colDate1 + '],' +
		' r.PatDivSecondPayment as [Pay on ' + @colDate2 + ']' +
		' into ' + @tableName + 
		' from pharmacymaster..PM_AnnualRebates r  ' +
		' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid ' +
		' left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid ' +
		' left join pharmacymaster..v_address_primary a on r.pmid=a.pmid ' +
		' left join pharmacymaster..pm_pharmacy pm on pm.pmid = r.pmid ' +
		' where r.PatronageDividend > 0 and p.affiliate = ''Pipco'' and year = ' + @year_PatDiv;
	
		print @sql;
	    EXEC (@SQL);

		SET @SQL = 'SELECT * from ' + @tableName + ' order by PMID';
		EXEC (@SQL);

END
GO
