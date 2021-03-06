USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CHRebate_mailmerge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 

CREATE PROCEDURE
[dbo].[sppm_CHRebate_mailmerge]
(@in_month varchar(02), @in_year varchar(4),@in_type varchar(12))


AS
--mailmerge step in monthly CH rebate file process BG
--replace table names and edit [month], edit Leader Rebate if not EOQ
BEGIN
	DECLARE @SQL   varchar(5000);
	DECLARE @date  varchar(10);

    DECLARE @tableName varchar(100);
	DECLARE @monthName varchar(20);
    DECLARE @monthForTable varchar(2);
	DECLARE @sqlFilter   varchar(250);
	DECLARE @tableExt   varchar(30);
	SET @sqlFilter = '';
	SET @tableExt = '';

	IF(len(@in_month) = 1)
		BEGIN
			SET @monthForTable = '0' + @in_month;
		END
	ELSE
		BEGIN
			SET @monthForTable = @in_month;
		END

	IF(@in_type = 'All')
		BEGIN
			SET @sqlFilter = ' and PayToStore >= 15.00 ';
 
			END
	IF (@in_type = 'XLeader')
		BEGIN
			SET @sqlFilter = ' and PayToStore >= 15.00  and (PayToStore <> [MSIRebate] and PayToStore <>[LeaderRebate]) ';
			SET @tableExt = '_ExcludedLeaderOnly';
		END
	IF (@in_type = 'Keystone')
		BEGIN
			SET @sqlFilter = ' and r.affiliate like ''KEY%'' ';
			SET @tableExt = '_Keystone';
		END
	IF (@in_type = 'Leader')
		BEGIN
			SET @sqlFilter = ' and PayToStore >= 15.00   and ((PayToStore = [MSIRebate] and PayToStore <>0 ) or (PayToStore = [LeaderRebate] and PayToStore <> 0)) ';
			SET @tableExt = '_LeaderOnly';
		END
	IF (@in_type = 'PFOA')
		BEGIN
			SET @sqlFilter = ' and PayToAffiliateOffice > 0.00  and r.affiliate like ''PFOA%'' ';
			SET @tableExt = '_PFOA';
		END


	--SET @tableName = 'tmp_CHRebates' + @monthForTable + @in_year + '_MailMerge_JMW' ;
	SET @tableName = 'tmp_CHRebates_MailMerge_JMW' + @tableExt ;
	SET @monthName = (select datename(month,dateadd(month, @in_month - 1, 0))  );

	SET @date = @in_month + '/1/' + @in_year;

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);



	SET @SQL = '	SELECT r.pmid as [Vendor ID], '+
		 ' case when (p.ownername is null or ltrim(p.ownername)='''') then p.contactfullname else p.ownername end as Contact, '+
		 ' p.[accountname] as [Account Name], '+
		 ' case when (p.corporatename is null or ltrim(p.corporatename)='''') then p.accountname else p.corporatename end as [Corporate Name], '+
		 ' f.address, '+
		 ' f.address2, '+
		 ' f.city, '+
		 ' f.state, '+
		 ' f.zip, '+
		 '''' + @date + ''' as [month]  , '+
		 
		' cast(round(r.SourceGenericSales,2) as numeric(18,2)) as SourceSales, '+
		' cast(round(r.[GenericRebate],2) as numeric(18,2)) as GenericRebate, '+
		' cast(round(r.[LeaderRebate],2) as numeric(18,2)) as LeaderRebate,   '+
		' cast(round(r.[MSIRebate],2) as numeric(18,2)) as MSIRebate, '+
        --ContractPerformanceRebate take out after running April 2013 rebates
        --' cast(round(r.ContractPerformanceRebate,2) as numeric(18,2)) as ConPerfRbt, '+
		' cast(round(r.PayToStore,2)  as numeric(18,2)) as StoreRebate, '+
		' [EffRebatePerc] as AverageRebatePct, '+
		--' round(isnull(r.hrta,0.0)*100,3) as HRTA, '+ --note 3 places
		' round(isnull(r.hrta,0.0),3) as HRTA, '+ --note 3 places

		' p.aapaccountno as aapid, '+
		--p.territory,
		' t.firstname + '' '' + t.lastname as TMName, '+
        ' cast(round(r.[Check Fee],2) as numeric(18,2)) as CheckFee '+
		' into  ' + @tableName +
		--from reports..import_CHRebate0611 r
		' from pharmacymaster..pm_rebates_chaap r  '+
		' left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid  '+
		' left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid  '+
		' left join pharmacymaster..v_address_primary a on r.pmid=a.pmid  '+
		' left join  pharmacymaster..pm_territory t on p.territory=t.territory  '+
	 	' where  r.date = ''' + @date + '''  '  +  
 --' where r.affiliate in(''NAPPSA'' , ''VPhA-USA'' ) and r.date = ''' + @date + '''  '  +      
          @sqlFilter + 
		 ' order by r.pmid ';
    print @sql;
	EXEC (@SQL);


 	SET @SQL = ' SELECT * from  ' + @tableName + ' order by [vendor id] ';
 
	EXEC (@SQL);
END



GO
