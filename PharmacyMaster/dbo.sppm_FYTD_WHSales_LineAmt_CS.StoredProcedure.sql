USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_FYTD_WHSales_LineAmt_CS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/22/2010>
-- Description:	 Create FYTD WH Sales for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_FYTD_WHSales_LineAmt_CS]

AS
BEGIN


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_ytd_WH_Sales_LineAmt_CS')
          DROP TABLE tmp_ytd_WH_Sales_LineAmt_CS


SELECT * into pharmacymaster..tmp_ytd_WH_Sales_LineAmt_CS from (
	SELECT   a.whaccountid as Acct#,
	case when  p.territory is null then o.territory else p.territory end as SlsMn,
	case when  p.accountname is null then o.accountname else p.accountname end as Name,
	case when  p.city is null then o.city else p.city end as City,
	case when  p.state is null then o.state else p.state end as ST,
	case when p.apistatus is null then o.status else p.apistatus end as Status,
	case when p.dateopened is null then o.dateopened else p.dateopened end as [Date Opened],



	a.april_br as [Apr 09 Brand] , a.may_br as [May 09 Brand], a.june_br  as [June 09 Brand], a.july_br  as [July 09 Brand],a.august_br  as [Aug 09 Brand],
	 a.september_br  as [Sept 09 Brand],a.october_br  as [Oct 09 Brand],a.november_br  as [Nov 09 Brand] , a.december_br  as [Dec 09 Brand] ,
	b.january_br  as [Jan 10 Brand],b.february_br as [Feb 10 Brand], b.march_br as [Mar 10 Brand],b.april_br as [Apr 10 Brand],b.may_br as [May 10 Brand],

	a.april_gen as [Apr 09 Generic], a.may_gen as [May 09 Generic], a.june_gen [June 09 Generic], a.july_gen [July 09 Generic],a.august_gen  as [Aug 09 Generic],
	 a.september_gen as [Sept 09 Generic],a.october_gen as [Oct 09 Generic],a.november_gen  as [Nov 09 Generic] , a.december_gen [Dec 09 Generic],
	b.january_gen as [Jan 10 Generic],b.february_gen as [Feb 10 Generic], b.march_gen as [Mar 10 Generic],b.april_gen  as [Apr 10 Generic],b.may_gen  as [May 10 Generic],

	a.april_otc as [Apr 09 OTC] , a.may_otc as [MAY 09 OTC], a.june_otc as [June 09 OTC], a.july_otc as [July 09 OTC],a.august_otc as [Aug 09 OTC],
	 a.september_otc as [Sept 09 OTC],a.october_otc  as [Oct 09 OTC],a.november_otc as [Nov 09 OTC], a.december_otc  as [Dec 09 OTC],
	b.january_otc as [Jan 10 OTC],b.february_otc  as [Feb 10 OTC], b.march_otc  [Mar 10 OTC],b.april_otc   as [Apr 10 OTC],b.may_otc  as [May 10 OTC], 
	cast(0 as float) as [Brand Totals],
	cast(0 as float) as [Generic Totals],
	cast(0 as float) as [OTC Totals],
	cast(0 as float) as [Grand Totals]

	from api..API_WHSales_LineAmt_ByType a 
	full outer join 
	(
		
	select   whaccountid, january_otc,february_otc, march_otc,april_otc,may_otc ,
		january_gen,february_gen, march_gen,april_gen,may_gen,
		january_br,february_br, march_br ,april_br,may_br from api..API_WHSales_LineAmt_ByType
		where year = 2010
	) b on a.whaccountid = b.whaccountid

	left outer join
	(
	select territory,accountname,city,state,apistatus,dateopened,apiaccountno from pharmacymaster..v_PM_AllWithAffiliates
	) p
	on a.whaccountid = p.apiaccountno
	left outer join
	(
	select territory,accountname,city,state,status,dateopened,accountno from pmbackups..tmp_apiaccountmaster_orig
	) o
	on a.whaccountid = o.accountno
	where a.year = 2009  and
	(a.april_gen <> 0 or a.may_gen <> 0 or a.june_gen <> 0 or a.july_gen <> 0 or a.august_gen <> 0 or  a.september_gen <> 0 or a.october_gen <> 0 or a.november_gen <> 0 or  a.december_gen <> 0 
	or b.january_gen <> 0 or b.february_gen <> 0 or b.march_gen <> 0 or b.april_gen <> 0 or b.may_gen <> 0 or
	a.april_br <> 0 or a.may_br <> 0 or a.june_br <> 0 or a.july_br <> 0 or a.august_br <> 0 or  a.september_br <> 0 or a.october_br <> 0 or a.november_br <> 0 or  a.december_br <> 0 
	or b.january_br <> 0 or b.february_br <> 0 or b.march_br <> 0 or b.april_br <> 0 or b.may_br <> 0  or
	a.april_otc <> 0 or a.may_otc <> 0 or a.june_otc <> 0 or a.july_otc <> 0 or a.august_otc <> 0 or  a.september_otc <> 0 or a.october_otc <> 0 or a.november_otc <> 0 or  a.december_otc <> 0 
	or b.january_otc <> 0 or b.february_otc <> 0 or b.march_otc <> 0 or b.april_otc <> 0 or b.may_otc <> 0  )
)CS


	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Apr 09 Brand] = 0 where 	[Apr 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[May 09 Brand] = 0 where    [May 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[June 09 Brand]  = 0 where  [June 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[July 09 Brand] = 0 where   [July 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Aug 09 Brand]  = 0 where 	[Aug 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Sept 09 Brand] = 0 where   [Sept 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Oct 09 Brand]  = 0 where 	[Oct 09 Brand] is null; 
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Nov 09 Brand]  = 0 where   [Nov 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Dec 09 Brand]  = 0 where  	[Dec 09 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Jan 10 Brand] = 0 where    [Jan 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Feb 10 Brand] = 0 where    [Feb 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Mar 10 Brand] = 0 where    [Mar 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Apr 10 Brand] = 0 where    [Apr 10 Brand] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[May 10 Brand] = 0 where    [May 10 Brand] is null;

	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Apr 09 Generic] = 0 where 	[Apr 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[May 09 Generic] = 0 where    [May 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[June 09 Generic]  = 0 where  [June 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[July 09 Generic] = 0 where   [July 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Aug 09 Generic]  = 0 where 	[Aug 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Sept 09 Generic] = 0 where   [Sept 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Oct 09 Generic]  = 0 where 	[Oct 09 Generic] is null; 
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Nov 09 Generic]  = 0 where   [Nov 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Dec 09 Generic]  = 0 where  	[Dec 09 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Jan 10 Generic] = 0 where    [Jan 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Feb 10 Generic] = 0 where    [Feb 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Mar 10 Generic] = 0 where    [Mar 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Apr 10 Generic] = 0 where    [Apr 10 Generic] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[May 10 Generic] = 0 where    [May 10 Generic] is null;

	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Apr 09 OTC] = 0 where 	[Apr 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[May 09 OTC] = 0 where    [May 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[June 09 OTC]  = 0 where  [June 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[July 09 OTC] = 0 where   [July 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Aug 09 OTC]  = 0 where 	[Aug 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Sept 09 OTC] = 0 where   [Sept 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Oct 09 OTC]  = 0 where 	[Oct 09 OTC] is null; 
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Nov 09 OTC]  = 0 where   [Nov 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Dec 09 OTC]  = 0 where  	[Dec 09 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Jan 10 OTC] = 0 where    [Jan 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Feb 10 OTC] = 0 where    [Feb 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Mar 10 OTC] = 0 where    [Mar 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[Apr 10 OTC] = 0 where    [Apr 10 OTC] is null;
	UPDATE 	tmp_ytd_WH_Sales_LineAmt_CS set	[May 10 OTC] = 0 where    [May 10 OTC] is null;
 
	UPDATE tmp_ytd_WH_Sales_LineAmt_CS set [Brand Totals] = [Apr 09 Brand] + [May 09 Brand] + 	[June 09 Brand] +[July 09 Brand] + 	[Aug 09 Brand] +
			[Sept 09 Brand] + 	[Oct 09 Brand] + [Nov 09 Brand] + [Dec 09 Brand] + 	[Jan 10 Brand] + [Feb 10 Brand] + [Mar 10 Brand] +
			[Apr 10 Brand] + [May 10 Brand];

	UPDATE tmp_ytd_WH_Sales_LineAmt_CS set [Generic Totals] = [Apr 09 Generic] + [May 09 Generic] + 	[June 09 Generic] +[July 09 Generic] + 	[Aug 09 Generic] +
			[Sept 09 Generic] + 	[Oct 09 Generic] + [Nov 09 Generic] + [Dec 09 Generic] + 	[Jan 10 Generic] + [Feb 10 Generic] + [Mar 10 Generic] +
			[Apr 10 Generic] + [May 10 Generic];

	UPDATE tmp_ytd_WH_Sales_LineAmt_CS set [OTC Totals] = [Apr 09 OTC] + [May 09 OTC] + 	[June 09 OTC] +[July 09 OTC] + 	[Aug 09 OTC] +
			[Sept 09 OTC] + 	[Oct 09 OTC] + [Nov 09 OTC] + [Dec 09 OTC] + 	[Jan 10 OTC] + [Feb 10 OTC] + [Mar 10 OTC] +
			[Apr 10 OTC] + [May 10 OTC];

	UPDATE tmp_ytd_WH_Sales_LineAmt_CS set [Grand Totals] = [Brand Totals] + [Generic Totals] + [OTC Totals];

 
 
 

 
 
END








GO
