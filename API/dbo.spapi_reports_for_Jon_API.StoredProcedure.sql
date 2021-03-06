USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_reports_for_Jon_API]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/12/2010>
-- Description:	<Aggregate ext-cost for the month by store>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_reports_for_Jon_API]
 (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
   -------- Brand Rx Weekly Pay Terms


IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_MO_BR_WKLY')
      DROP TABLE tmp_MO_BR_WKLY

SELECT * into tmp_MO_BR_WKLY from (
	 SELECT aap.apiaccountno as [WH Acct. No] ,aap.AccountName, aap.City, aap.State,aap.Territory,
	 sum(august_br )  as [Aug. 2009 Brand Rx],
	 sum(september_br )  as [Sept. 2009 Brand Rx],
	 sum(october_br )  as [Oct. 2009 Brand Rx],
	 sum(november_br )  as [Nov. 2009 Brand Rx],
	 sum(december_br )  as [Dec. 2009 Brand Rx],
	 sum(api2.january_br) as [Jan. 2010 Brand Rx], 
	aap.custpaytermsapi + ' - Wkly' as [Pay Terms] 
	 from aap..pharmacymaster aap
	left outer join
	(
	SELECT august_br,september_br,october_br,november_br,december_br ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2009
	) api1
	on api1.whaccountid = aap.apiaccountno
	left outer join
	(
	SELECT january_br ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2010
	) api2
	on api2.whaccountid = aap.apiaccountno
	 where (aap.custpaytermsapi = 'ATA' or 
	aap.custpaytermsapi = 'A10')
	and 
	(august_br is not null or september_br is not null or october_br is not null or november_br is not null or december_br is not null or
	january_br is not null)
	group by aap.apiaccountno ,aap.AccountName, aap.City,
	 aap.State,aap.Territory,aap.custpaytermsapi 
) tw
 
UPDATE tmp_MO_BR_WKLY set [Aug. 2009 Brand Rx] = 0.00 where [Aug. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_WKLY set [Sept. 2009 Brand Rx] = 0.00 where [Sept. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_WKLY set [Oct. 2009 Brand Rx] = 0.00 where [Oct. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_WKLY set [Nov. 2009 Brand Rx] = 0.00 where [Nov. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_WKLY set [Dec. 2009 Brand Rx] = 0.00 where [Dec. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_WKLY set [Jan. 2010 Brand Rx] = 0.00 where [Jan. 2010 Brand Rx] is null;

   -------- Brand Rx Standard Pay Terms


IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_MO_BR_STD')
      DROP TABLE tmp_MO_BR_STD

SELECT * into tmp_MO_BR_STD from (
	 SELECT aap.apiaccountno as [WH Acct. No] ,aap.AccountName, aap.City, aap.State,aap.Territory,
	 sum(august_br )  as [Aug. 2009 Brand Rx],
	 sum(September_br )  as [Sept. 2009 Brand Rx],
	 sum(october_br )  as [Oct. 2009 Brand Rx],
	 sum(november_br )  as [Nov. 2009 Brand Rx],
	 sum(december_br )  as [Dec. 2009 Brand Rx],
	 sum(api2.january_br) as [Jan. 2010 Brand Rx], 
	aap.custpaytermsapi + ' - Std' as [Pay Terms] 
	 from aap..pharmacymaster aap
	left outer join
	(
	SELECT august_br,September_br,october_br,november_br,december_br ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2009
	) api1
	on api1.whaccountid = aap.apiaccountno
	left outer join
	(
	SELECT january_br ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2010
	) api2
	on api2.whaccountid = aap.apiaccountno
	 where aap.custpaytermsapi = 'DAY' 
	and 
	(august_br is not null or september_br is not null or october_br is not null or november_br is not null or december_br is not null or
	january_br is not null)
	group by aap.apiaccountno ,aap.AccountName, aap.City,
	 aap.State,aap.Territory,aap.custpaytermsapi 
)ts

UPDATE tmp_MO_BR_STD set [Aug. 2009 Brand Rx] = 0.00 where [Aug. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_STD set [Sept. 2009 Brand Rx] = 0.00 where [Sept. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_STD set [Oct. 2009 Brand Rx] = 0.00 where [Oct. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_STD set [Nov. 2009 Brand Rx] = 0.00 where [Nov. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_STD set [Dec. 2009 Brand Rx] = 0.00 where [Dec. 2009 Brand Rx] is null;
UPDATE tmp_MO_BR_STD set [Jan. 2010 Brand Rx] = 0.00 where [Jan. 2010 Brand Rx] is null;

----------- Generic Rx Non PVA

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_MO_GEN_Non_PVA')
      DROP TABLE tmp_MO_GEN_Non_PVA

SELECT * into tmp_MO_GEN_Non_PVA from (
     SELECT aap.apiaccountno as [WH Acct. No] ,aap.AccountName, aap.City, aap.State,aap.Territory,
	 sum(august_gen )  as [Aug. 2009 Generic Rx],
	 sum(September_gen )  as [Sept. 2009 Generic Rx],
	 sum(october_gen )  as [Oct. 2009 Generic Rx],
	 sum(november_gen )  as [Nov. 2009 Generic Rx],
	 sum(december_gen )  as [Dec. 2009 Generic Rx],
	 sum(api2.january_gen) as [Jan. 2010 Generic Rx] 
	 from aap..pharmacymaster aap
	left outer join
	(
	SELECT august_gen,September_gen,october_gen,november_gen,december_gen ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2009
	) api1
	on api1.whaccountid = aap.apiaccountno
	left outer join
	(
	SELECT january_gen ,whaccountid from API_WHSales_Mnthly_ByType  where year = 2010
	) api2
	on api2.whaccountid = aap.apiaccountno
	 where aap.apiaccountno is not null and
		aap.cahstatus is null and aap.cardinaldc is null and aap.primarycaaccountno is null
	and 
	(august_gen is not null or September_gen is not null or october_gen is not null or november_gen is not null or december_gen is not null or
	january_gen is not null)
	group by aap.apiaccountno ,aap.AccountName, aap.City,
	 aap.State,aap.Territory,aap.custpaytermsapi 
)tp

UPDATE tmp_MO_GEN_Non_PVA set [Aug. 2009 Generic Rx] = 0.00 where [Aug. 2009 Generic Rx] is null;
UPDATE tmp_MO_GEN_Non_PVA set [Sept. 2009 Generic Rx] = 0.00 where [Sept. 2009 Generic Rx] is null;
UPDATE tmp_MO_GEN_Non_PVA set [Oct. 2009 Generic Rx] = 0.00 where [Oct. 2009 Generic Rx] is null;
UPDATE tmp_MO_GEN_Non_PVA set [Nov. 2009 Generic Rx] = 0.00 where [Nov. 2009 Generic Rx] is null;
UPDATE tmp_MO_GEN_Non_PVA set [Dec. 2009 Generic Rx] = 0.00 where [Dec. 2009 Generic Rx] is null;
UPDATE tmp_MO_GEN_Non_PVA set  [Jan. 2010 Generic Rx] = 0.00 where  [Jan. 2010 Generic Rx] is null;

    END
 







GO
