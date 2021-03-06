USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PatDivRebate_mailmerge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE
[dbo].[sppm_PatDivRebate_mailmerge]
(@in_month varchar(2), @in_year varchar(4),@in_payment varchar(1))


AS
 

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
				 WHERE name =  'tmp_PatDiv_mailmerge' )
				 BEGIN  
				 	DROP TABLE  tmp_PatDiv_mailmerge 
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
	'  r.PatronageDividend   as [Total Patr Div], '+
	'''' +  @monthName + ' ' +  @in_year + ''' as [month], ';
	IF(@in_payment = '1')
		BEGIN
			SET @SQL =  @SQL + '  r.PatDivFirstPayment   as [Patr Div Installment], ';
		END
	ELSE
		BEGIN
			SET @SQL =  @SQL + '  r.PatDivSecondPayment   as [Patr Div Installment], ';
		END 

	SET @SQL =  @SQL + ' p.aapaccountno as aapid, '+
	' t.firstname + '' '' + t.lastname as TMName '+

	' into reports..tmp_PatDiv_mailmerge '+
	' from pharmacymaster..PM_AnnualRebates  r  '+
	' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid '+
	' left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid '+
	' left join pharmacymaster..v_address_primary a on r.pmid=a.pmid '+
	' left join  pharmacymaster..pm_territory t on p.territory=t.territory '+
	' left join pharmacymaster..pm_chaccounts_adj ch on r.pmid=ch.pmid ' + 
    ' where r.PatronageDividend > 0 and year = ''' + @year_PatDiv + ''' order by r.pmid ';
 

	
 
    EXEC (@SQL);
	SELECT * from reports..tmp_PatDiv_mailmerge order by [vendor id]

---- BASHAS only
--select m.* from  reports..tmp_PatDiv_mailmerge m
--join
--(
--	select * from pharmacymaster..pm_pharmacy where groupno    = '11377'  
--) b
--on m.[vendor id] = b.pmid
--
---- All with No Bashas
--select m.* from  reports..tmp_PatDiv_mailmerge m
--join
--(
--	select * from pharmacymaster..pm_pharmacy where groupno   != '11377' or aapparentno is null
--) b
--on m.[vendor id] = b.pmid

 
END



GO
