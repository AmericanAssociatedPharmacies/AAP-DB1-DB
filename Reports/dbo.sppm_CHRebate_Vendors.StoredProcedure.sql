USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CHRebate_Vendors]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sppm_CHRebate_Vendors]
(@in_month varchar(2),@in_year varchar(4))
AS


	DECLARE @date  varchar(10);
    DECLARE @tableName varchar(100);
	DECLARE @SQL   varchar(max);
	SET @date = @in_month + '/1/' + @in_year;

	SET @tableName = 'tmp_CHRebates_Vendors_JMW' ;

	SET @date = @in_month + '/1/' + @in_year;

	SET @SQL = '	 IF EXISTS(SELECT name FROM sys.tables ' +
				'  WHERE name = ''' + @tableName + ''')' +
				'	BEGIN '+
				'		DROP TABLE '+ @tableName +
				'   END ';

	EXEC (@SQL);

 
		SELECT r.pmid as [Vendor ID],
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
		r.TM as [Territory]

		into reports..tmp_CHRebates_Vendors_JMW
		from pharmacymaster..PM_Rebates_CHAAP r 
		left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid
		left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid
		left join pharmacymaster..v_address_primary a on r.pmid=a.pmid
		left join pharmacymaster..pm_pharmacy pm on pm.pmid = r.pmid
		where PayToStore >= 15.00 and date = @date 
---
--and r.PMID in (
-- 102884,103797,107258,107297,107569,107795,107980,107999,
--108000,108013,108053,108058,108120) 

		order by r.pmid
	 
  --SET @SQL = 'SELECT * from ' + @tableName +  ' where [Vendor ID] = 108629  order by [vendor id]';

  SET @SQL = 'SELECT * from ' + @tableName + '  order by [vendor id]';
  
        EXEC (@SQL);
 -- ONLY TEMPORARY TAKE OUT AFTER RUN

--select *  from reports..tmp_CHRebates_Vendors_JMW  t
--join
--(
--select *  from pharmacymaster..pm_rebates_chaap 
--where month(date) = 05 and year(date) = 2014
--)p on t.[Vendor ID] = p.pmid where buscls = 'C36' or buscls = 'C38' 

		
GO
