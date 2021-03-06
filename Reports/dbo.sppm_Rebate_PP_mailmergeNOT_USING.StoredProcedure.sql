USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Rebate_PP_mailmergeNOT_USING]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  procedure
[dbo].[sppm_Rebate_PP_mailmergeNOT_USING]
(@in_month varchar(2),@in_year varchar(4),@in_period varchar(6))
as
--mailmerge for HV rebate 5/23/11
 
BEGIN

	DECLARE @SQL   varchar(5000);
	DECLARE @date  varchar(10);

    DECLARE @tableName varchar(100);
	SET @date = @in_month + '/1/' + @in_year;
	SET @tableName = 'tmp_PPRebates_mailmerge_JMW'

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);


	SET @SQL = 'SELECT r.pmid as [Vendor ID], ' +
	            ' ch.[chaccountnoprimary] as [Cardinal Account Number], ' +
	            ' p.aapaccountno as [AAP Member Number], ' +
			    ' p.[accountname] as [Pharmacy Name], ' +
				' case when (p.corporatename is null or ltrim(p.corporatename)='''') then p.accountname else p.corporatename end as [Corporate Name], ' +
				' case when (p.ownername is null or ltrim(p.ownername)='''') then p.contactfullname else p.ownername end as Contact, ' +


				--x.Group_Name as PMAffiliation,
				' f.address, ' +
				' f.address2, ' +
				' f.city, ' +
				' f.state, ' +
				' f.zip, ' +
				 '''' + @date + '''  as [month], ' +

				' cast(round(r.[PaidToStore],2)as numeric(18,2)) as [Paid To Store], ' +
				' cast(r.[VolumeAmt] as numeric(18,2)) as [Volume Amount], ' +
				' t.firstname + '' '' + t.lastname as TMName ' +

				' into ' + @tableName +
				' from pharmacymaster..v_vendorvolumesales r ' +
				' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid  ' +
				' left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid  ' +
				' left join pharmacymaster..v_address_primary a on r.pmid=a.pmid  ' +
				' left join  pharmacymaster..pm_territory t on p.territory=t.territory  ' +
				' left join pharmacymaster..pm_chaccounts_adj ch on r.pmid=ch.pmid  ' +
				' where period = ''' + @in_period + '''' +
				--where [Pay to store] >= 10.00
				' order by r.pmid ';
	EXEC(@SQL)
    print @sql
	SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id] ';

	EXEC(@SQL)


 
END
GO
