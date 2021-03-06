USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_FYTD_WHSales_CS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/22/2010>
-- Description:	 Create FYTD WH Sales for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_FYTD_WHSales_CS]

AS
BEGIN


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_ytd_WH_Sales_CS')
          DROP TABLE tmp_ytd_WH_Sales_CS


SELECT * into pharmacymaster..tmp_ytd_WH_Sales_CS  from (
	SELECT   a.whaccountid as WHAcct#,
    p.aapaccountno as AAP#,
	case when  p.territory is null then o.territory else p.territory end as SlsMn,
	case when  p.accountname is null then o.accountname else p.accountname end as Name,
	case when  p.city is null then o.city else p.city end as City,
	case when  p.state is null then o.state else p.state end as ST,
	case when p.apistatus is null then o.status else p.apistatus end as Status,
	case when p.dateopened is null then o.dateopened else p.dateopened end as [Date Opened],



	  a.july_br  as [July 09 Brand],a.august_br  as [Aug 09 Brand],
	 a.september_br  as [Sept 09 Brand],a.october_br  as [Oct 09 Brand],a.november_br  as [Nov 09 Brand] , a.december_br  as [Dec 09 Brand] ,
	 b.january_br  as [Jan 10 Brand],b.february_br as [Feb 10 Brand], b.march_br as [Mar 10 Brand],b.april_br as [Apr 10 Brand],b.may_br as [May 10 Brand],
     b.june_br as [June 10 Brand], b.july_br as [July 10 Brand],


	  a.july_gen [July 09 Generic],a.august_gen  as [Aug 09 Generic],
	 a.september_gen as [Sept 09 Generic],a.october_gen as [Oct 09 Generic],a.november_gen  as [Nov 09 Generic] , a.december_gen [Dec 09 Generic],
	 b.january_gen as [Jan 10 Generic],b.february_gen as [Feb 10 Generic], b.march_gen as [Mar 10 Generic],b.april_gen  as [Apr 10 Generic],b.may_gen  as [May 10 Generic],
     b.june_gen  as [June 10 Generic], b.july_gen as [July 10 Generic],

	 a.july_otc as [July 09 OTC],a.august_otc as [Aug 09 OTC],
	a.september_otc as [Sept 09 OTC],a.october_otc  as [Oct 09 OTC],a.november_otc as [Nov 09 OTC], a.december_otc  as [Dec 09 OTC],
	b.january_otc as [Jan 10 OTC],b.february_otc  as [Feb 10 OTC], b.march_otc  [Mar 10 OTC],b.april_otc   as [Apr 10 OTC],b.may_otc  as [May 10 OTC], 
    b.june_otc  as [June 10 OTC], b.july_otc as [July 10 OTC],
	cast(0 as float) as [Brand Totals],
	cast(0 as float) as [Generic Totals],
	cast(0 as float) as [OTC Totals],
	cast(0 as float) as [Grand Totals]

	from api..API_WHSales_Mnthly_ByType a 
	full outer join 
	(
		
	select   whaccountid, january_otc,february_otc, march_otc,april_otc,may_otc ,june_otc,july_otc,
		january_gen,february_gen, march_gen,april_gen,may_gen,june_gen,july_gen,
		january_br,february_br, march_br ,april_br,may_br,june_br,july_br
         from api..API_WHSales_Mnthly_ByType
		where year = 2010
	) b on a.whaccountid = b.whaccountid

	left outer join
	(
	select territory,accountname,city,state,apistatus,dateopened,apiaccountno,aapaccountno from pharmacymaster..v_PM_AllWithAffiliates
	) p
    --Added don't know if this will work - need to get api active accounts that don't have sales
	on a.whaccountid = p.apiaccountno
	left outer join
	(
	select territory,accountname,city,state,status,dateopened,accountno from pmbackups..tmp_apiaccountmaster_orig
	) o
	on a.whaccountid = o.accountno
	where a.year = 2009  and
	(   a.july_gen <> 0 or a.august_gen <> 0 or  a.september_gen <> 0 or a.october_gen <> 0 or a.november_gen <> 0 or  a.december_gen <> 0 
	or b.january_gen <> 0 or b.february_gen <> 0 or b.march_gen <> 0 or b.april_gen <> 0 or b.may_gen <> 0 or b.june_gen <> 0 or b.july_gen <> 0
	  or a.july_br <> 0 or a.august_br <> 0 or  a.september_br <> 0 or a.october_br <> 0 or a.november_br <> 0 or  a.december_br <> 0 
	or b.january_br <> 0 or b.february_br <> 0 or b.march_br <> 0 or b.april_br <> 0 or b.may_br <> 0  or b.june_br <> 0   or b.july_br <> 0 
	  or a.july_otc <> 0 or a.august_otc <> 0 or  a.september_otc <> 0 or a.october_otc <> 0 or a.november_otc <> 0 or  a.december_otc <> 0 
	or b.january_otc <> 0 or b.february_otc <> 0 or b.march_otc <> 0 or b.april_otc <> 0 or b.may_otc <> 0  or b.june_otc <> 0  or b.july_otc <> 0)
)CS


   INSERT INTO   tmp_ytd_WH_Sales_CS ( WHAcct# , AAP# ,SlsMn,Name,City,ST,status,[Date Opened]) 
    SELECT p.apiaccountno,p.aapaccountno,p.territory,p.accountname,p.city,p.state,p.apistatus,p.dateopened  FROM v_PM_AllWithAffiliates p
		left outer join(
			SELECT * FROM  tmp_ytd_WH_Sales_CS
		) a
		ON p.apiaccountno = a.whacct#
       -- left outer join (
		--	SELECT dateopened,accountno from pmbackups..tmp_apiAccountmaster_orig 
		--)api
		--on p.apiaccountno = api.accountno
		WHERE a.whacct# is null and p.apistatus = 'active';

 
 
  
	UPDATE 	tmp_ytd_WH_Sales_CS set	[July 09 Brand] = 0 where   [July 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Aug 09 Brand]  = 0 where 	[Aug 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Sept 09 Brand] = 0 where   [Sept 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Oct 09 Brand]  = 0 where 	[Oct 09 Brand] is null; 
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Nov 09 Brand]  = 0 where   [Nov 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Dec 09 Brand]  = 0 where  	[Dec 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Jan 10 Brand] = 0 where    [Jan 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Feb 10 Brand] = 0 where    [Feb 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Mar 10 Brand] = 0 where    [Mar 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Apr 10 Brand] = 0 where    [Apr 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[May 10 Brand] = 0 where    [May 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[June 10 Brand] = 0 where    [June 10 Brand] is null;
    UPDATE 	tmp_ytd_WH_Sales_CS set	[July 10 Brand] = 0 where    [July 10 Brand] is null;
 
 
 
	UPDATE 	tmp_ytd_WH_Sales_CS set	[July 09 Generic] = 0 where   [July 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Aug 09 Generic]  = 0 where 	[Aug 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Sept 09 Generic] = 0 where   [Sept 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Oct 09 Generic]  = 0 where 	[Oct 09 Generic] is null; 
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Nov 09 Generic]  = 0 where   [Nov 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Dec 09 Generic]  = 0 where  	[Dec 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Jan 10 Generic] = 0 where    [Jan 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Feb 10 Generic] = 0 where    [Feb 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Mar 10 Generic] = 0 where    [Mar 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Apr 10 Generic] = 0 where    [Apr 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[May 10 Generic] = 0 where    [May 10 Generic] is null;
    UPDATE 	tmp_ytd_WH_Sales_CS set	[June 10 Generic] = 0 where    [June 10 Generic] is null;
    UPDATE 	tmp_ytd_WH_Sales_CS set	[July 10 Generic] = 0 where    [July 10 Generic] is null;

  
	UPDATE 	tmp_ytd_WH_Sales_CS set	[July 09 OTC] = 0 where   [July 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Aug 09 OTC]  = 0 where 	[Aug 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Sept 09 OTC] = 0 where   [Sept 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Oct 09 OTC]  = 0 where 	[Oct 09 OTC] is null; 
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Nov 09 OTC]  = 0 where   [Nov 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Dec 09 OTC]  = 0 where  	[Dec 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Jan 10 OTC] = 0 where    [Jan 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Feb 10 OTC] = 0 where    [Feb 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Mar 10 OTC] = 0 where    [Mar 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[Apr 10 OTC] = 0 where    [Apr 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_CS set	[May 10 OTC] = 0 where    [May 10 OTC] is null;
    UPDATE 	tmp_ytd_WH_Sales_CS set	[June 10 OTC] = 0 where    [June 10 OTC] is null;
    UPDATE 	tmp_ytd_WH_Sales_CS set	[July 10 OTC] = 0 where    [July 10 OTC] is null;
 
	UPDATE tmp_ytd_WH_Sales_CS set [Brand Totals] =   	 [July 09 Brand] + 	[Aug 09 Brand] +
			[Sept 09 Brand] + 	[Oct 09 Brand] + [Nov 09 Brand] + [Dec 09 Brand] + 	[Jan 10 Brand] + [Feb 10 Brand] + [Mar 10 Brand] +
			[Apr 10 Brand] + [May 10 Brand] + [June 10 Brand] + [July 10 Brand];

	UPDATE tmp_ytd_WH_Sales_CS set [Generic Totals] =   [July 09 Generic] + 	[Aug 09 Generic] +
			[Sept 09 Generic] + 	[Oct 09 Generic] + [Nov 09 Generic] + [Dec 09 Generic] + 	[Jan 10 Generic] + [Feb 10 Generic] + [Mar 10 Generic] +
			[Apr 10 Generic] + [May 10 Generic] + [June 10 Generic]+ [July 10 Generic] ;


	UPDATE tmp_ytd_WH_Sales_CS set [OTC Totals] =    [July 09 OTC] + 	[Aug 09 OTC] +
			[Sept 09 OTC] + 	[Oct 09 OTC] + [Nov 09 OTC] + [Dec 09 OTC] + 	[Jan 10 OTC] + [Feb 10 OTC] + [Mar 10 OTC] +
			[Apr 10 OTC] + [May 10 OTC]  + [June 10 OTC] + [July 10 OTC] ;

	UPDATE tmp_ytd_WH_Sales_CS set [Grand Totals] = [Brand Totals] + [Generic Totals] + [OTC Totals];

 
 
 

 
 
END








GO
