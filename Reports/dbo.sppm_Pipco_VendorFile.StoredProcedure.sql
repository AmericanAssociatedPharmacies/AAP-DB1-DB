USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Pipco_VendorFile]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sppm_Pipco_VendorFile]
 (@in_month varchar(2), @in_year varchar(4),@in_isAll varchar(1))
AS

--Don't know at this point 
 
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(max);
 

	SET @tableName = 'tmp_Pipco_Vendors_JMW' ;

 

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);

 
		SELECT p.pmid as [Vendor ID],
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
		'00-2290' as GLExpenseAccount,
		p.FedID as [Tax ID Number], --need hyphens
		p.TM as [Territory] 

		into reports..tmp_Pipco_Vendors_JMW
--		from pharmacymaster..PM_Rebates_APIMonthly r --May have to join to the PM_Rebates_APIMonthly table
--		left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid
		from pharmacymaster..v_PM_AllWithAffiliates p 
		left join pharmacymaster..v_address_mailing_financials f on p.pmid=f.pmid
		left join pharmacymaster..v_address_primary a on p.pmid=a.pmid
left join pharmacymaster..pm_pharmacy pm on pm.pmid = p.pmid
--Change below to Pipco2 when it's avaiable - left at Pipco for testing -- Need to put in check for all or for by date
where p.BusinessClass = 'C40' -- and month(r.date) = @in_month and year(r.date) = @in_year 

  SET @SQL = 'SELECT * from ' + @tableName + '  order by [vendor id]';
  
        EXEC (@SQL);
 
		
GO
