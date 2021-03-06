USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PlanOGram_mailmerge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE
[dbo].[sppm_PlanOGram_mailmerge]
(@in_month varchar(2), @in_year varchar(4))


AS
---***********NOTE NOT DONE YET
--mailmerge step in monthly CH rebate file process BG
--replace table names and edit [month], edit Leader Rebate if not EOQ


BEGIN
 
	
 
	DECLARE @SQL   varchar(5000);
	DECLARE @date  varchar(10);
	DECLARE @year_PatDiv_int int;
	DECLARE @year_PatDiv  varchar(4);
	DECLARE @monthName varchar(20);
	DECLARE @monthName_ABBR varchar(10);
 

	SET @year_PatDiv_int = cast(@in_year as int) -1;
	SET @year_PatDiv = cast( @year_PatDiv_int as varchar(4));

	SET  @date = @in_month + '/1/' + @in_year;
 

    SET  @monthName_ABBR = dbo.fDate2(DATEADD(m,0,@date));
    SET  @monthName = datename(mm,@date) ;

	 IF EXISTS(SELECT name FROM sys.tables  
				 WHERE name =  'tmp_PlanOGram_mailmerge' )
				 BEGIN  
				 	DROP TABLE  tmp_PlanOGram_mailmerge 
				   END 
 
	SET @SQL = ' SELECT  r.pmid  as [Vendor ID], '+
	' ch.[chaccountnoprimary], '+
	' case when (p.ownername is null or ltrim(p.ownername)='''') then p.contactfullname else p.ownername end as Contact, '+
	' p.[accountname] as [Account Name], '+
	' case when (p.corporatename is null or ltrim(p.corporatename)='''') then p.accountname else p.corporatename end as [Corporate Name], '+
	' f.address, '+
	' f.address2, '+
	' f.city, '+
	' f.state, '+
	' f.zip, '+
	'  r.planogramrebate   as [PlanOGram Rebate], '+
    -- '  r.[3mrebate]   as [PlanOGram Rebate], '+
	'''' +  @monthName + ' ' +  @in_year + ''' as [month], ' +
 
	' p.aapaccountno as aapid, '+
	' t.firstname + '' '' + t.lastname as TMName '+

	' into reports..tmp_PlanOGram_mailmerge '+
	' from pharmacymaster..PM_AnnualRebates  r  '+
	' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid '+
	' left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid '+
	' left join pharmacymaster..v_address_primary a on r.pmid=a.pmid '+
	' left join  pharmacymaster..pm_territory t on p.territory=t.territory '+
	' left join pharmacymaster..pm_chaccounts_adj ch on r.pmid=ch.pmid ' + 
	 ' where r.planogramrebate > 0 and year = ''' + @year_PatDiv + ''' order by r.pmid ';
 --' where r.planogramrebate > 0 and r.affiliate not like ''%LEGEND%''and r.affiliate != ''Keystone'' and r.affiliate != ''PFOA'' and r.affiliate != ''Pipco'' and year = ''' + @year_PatDiv + ''' order by r.pmid ';
--	' where r.[3mrebate] > 0 and r.affiliate not like ''%LEGEND%''and r.affiliate != ''Keystone'' and r.affiliate != ''PFOA'' and r.affiliate != ''Pipco'' and year = ''' + @year_PatDiv + ''' order by r.pmid ';


	
 
    EXEC (@SQL);
	SELECT * from reports..tmp_PlanOGram_mailmerge order by [vendor id]

 
END



GO
