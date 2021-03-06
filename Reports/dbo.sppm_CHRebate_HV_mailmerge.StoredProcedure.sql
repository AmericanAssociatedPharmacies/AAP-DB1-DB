USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CHRebate_HV_mailmerge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  procedure
[dbo].[sppm_CHRebate_HV_mailmerge]
(@in_month varchar(2),@in_year varchar(4))
as
--mailmerge for HV rebate 5/23/11
 
BEGIN

	DECLARE @SQL   varchar(5000);
	DECLARE @date  varchar(10);

    DECLARE @tableName varchar(100);
	SET @date = @in_month + '/1/' + @in_year;
	SET @tableName = 'tmp_HVRebate_mailmerge_JMW'

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

				' cast(round(r.[High Volume Incentive],2)as numeric(18,2)) as [High Volume Incentive], ' +
				' cast(r.[AAP Brand RX Sales] as numeric(18,2)) as [AAP Brand RX Sales], ' +
				' r.[COG Reduction], ' +
				' t.firstname + '' '' + t.lastname as TMName ' +

				' into ' + @tableName +

     			' from pharmacymaster..PM_Rebates_HighVolume r ' +

--				' FROM (  '+
--				'  select *  '+
--				' FROM pharmacymaster..PM_Rebates_HighVolume  '+
--				' where ([Group] != ''LA JOLLA'' or [Group] is null) and date = ''' + @date + ''''+
--				' union '+
--				' select *  from pharmacymaster..PM_Rebates_HighVolume_LaJolla '+
--				' where date = ''' + @date + ''''+
--				' ) r ' +

				' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid  ' +
				' left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid  ' +
				' left join pharmacymaster..v_address_primary a on r.pmid=a.pmid  ' +
				' left join  pharmacymaster..pm_territory t on p.territory=t.territory  ' +
				' left join pharmacymaster..pm_chaccounts_adj ch on r.pmid=ch.pmid  ' +
				' where date = ''' + @date + '''' +
				--where [Pay to store] >= 10.00
				' order by r.pmid ';
	EXEC(@SQL)
    print @sql
	SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id] ';

	EXEC(@SQL)


 
END
GO
