USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Rebate_PP_Vendors]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sppm_Rebate_PP_Vendors]
(@in_period varchar(6))
AS


	--DECLARE @date  varchar(10);
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(500);
	--SET @date = @in_month + '/1/' + @in_year;

	SET @tableName = 'tmp_PPRebates_Vendors_JMW' ;

	--SET @date = @in_month + '/1/' + @in_year;

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);

 
		SELECT cast(r.pmid as int) as [Vendor ID],
		p.[accountname] as [Store Name],
		case when (p.ownername is null or ltrim(p.ownername)='') then p.contactfullname else p.ownername end as Contact,
		a.address as [Store Address – Line 1],
		a.address2 as [Store Address – Line 2],
		a.city as [City], a.state as [State], a.zip as [Zip],
		case when (p.corporatename is null or ltrim(p.corporatename)='') then p.accountname else p.corporatename end as [Corporate Name],
		f.address as [Remit to Address – Line 1],
		f.address2 as [Remit to Address – Line 2],
		f.city as [Remit to City],
		f.state as [Remit to State],
		f.zip as [Remit to Zip],
		'Remit to 1' as [Payment Address Type],
		1 as [1099 Type],
		p.phone as [Telephone 1],
		p.fax as [Fax Number],
		case when pm.achemail is null then p.email else pm.achemail end as [Vendor E-mail],
		'00-6590' as GLExpenseAccount,
		p.FedID as [Tax ID Number], --need hyphens
		p.[Territory] as [Territory]

		into reports..tmp_PPRebates_Vendors_JMW
		from pharmacymaster..v_vendorvolumesales r 
		left join pharmacymaster..v_PMDeletedMaster p on r.pmid=p.pmid
		left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid
		left join pharmacymaster..v_address_primary a on r.pmid=a.pmid
		left join pharmacymaster..pm_pharmacy pm on pm.pmid = r.pmid
		where  period = @in_period
		order by r.pmid
	 

		SET @SQL = 'SELECT * from ' + @tableName + ' order by [vendor id]';
		EXEC (@SQL);
GO
