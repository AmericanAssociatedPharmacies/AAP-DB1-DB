USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_api_whsales_Mnthly_ByType_update]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2009>
-- Description:	<Weekly  sales for the month>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_api_whsales_Mnthly_ByType_update]
   (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

       BEGIN TRAN sum_mnthly_by_type
       --BRAND 
		UPDATE  su  set 
			JANUARY_BR = CASE when api.month_date = '01' then api.totamt else JANUARY_BR END,
			FEBRUARY_BR = CASE when api.month_date = '02' then api.totamt else FEBRUARY_BR END,
			MARCH_BR = CASE when api.month_date = '03' then api.totamt else MARCH_BR END,
			APRIL_BR = CASE when api.month_date = '04' then api.totamt else APRIL_BR END,
			MAY_BR = CASE when api.month_date = '05' then api.totamt else MAY_BR END,
			JUNE_BR = CASE when api.month_date = '06' then api.totamt else JUNE_BR END,
			JULY_BR = CASE when api.month_date = '07' then api.totamt else JULY_BR END,
			AUGUST_BR = CASE when api.month_date = '08' then api.totamt else AUGUST_BR END,
			SEPTEMBER_BR = CASE when api.month_date = '09' then api.totamt else SEPTEMBER_BR END,
			OCTOBER_BR = CASE when api.month_date = '10' then api.totamt else OCTOBER_BR END,
			NOVEMBER_BR = CASE when api.month_date = '11' then api.totamt else NOVEMBER_BR END,
			DECEMBER_BR = CASE when api.month_date = '12' then api.totamt else DECEMBER_BR END
	   FROM API_WHSales_Mnthly_ByType su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt ,type, whaccountid, year(invdate)as year_date , month(invdate)as month_date
				 FROM  dbo.v_apisalesdetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'
				 GROUP BY whaccountid,month(invdate),year(invdate) ,type ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date and api.type = 'Brand'
     
  	  INSERT  into API_WHSales_Mnthly_ByType (year,whaccountid,JANUARY_BR,FEBRUARY_BR,MARCH_BR,APRIL_BR,MAY_BR,JUNE_BR,JULY_BR,AUGUST_BR,SEPTEMBER_BR,
                     OCTOBER_BR,NOVEMBER_BR,DECEMBER_BR)  
      
      SELECT   distinct  year(invdate) as year_date ,whaccountid, 
            SUM(CASE when month(invdate) = '01' then ExtSales END)as JANUARY_BR,
			SUM(CASE when month(invdate) = '02' then ExtSales  END) as FEBRUARY_BR,
			SUM(CASE when month(invdate) = '03' then ExtSales  END) as MARCH_BR,
			SUM(CASE when month(invdate) = '04' then ExtSales  END) as APRIL_BR,
			SUM(CASE when month(invdate) = '05' then ExtSales  END) as MAY_BR,
			SUM(CASE when month(invdate) = '06' then ExtSales  END) as JUNE_BR,
			SUM(CASE when month(invdate) = '07' then ExtSales  END) as JULY_BR,
			SUM(CASE when month(invdate) = '08' then ExtSales  END) as AUGUST_BR,
			SUM(CASE when month(invdate) = '09' then ExtSales  END) as SEPTEMBER_BR,
			SUM(CASE when month(invdate) = '10' then ExtSales  END) as OCTOBER_BR,
			SUM(CASE when month(invdate) = '11' then ExtSales  END) as NOVEMBER_BR,
			SUM(CASE when month(invdate) = '12' then ExtSales  END) as DECEMBER_BR
          
    FROM  dbo.v_apisalesdetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and whaccountid not in (select whaccountid from API_WHSales_Mnthly_ByType where year = @in_year)
     and type = 'Brand')
    GROUP BY whaccountid,month(invdate),year(invdate)  ;

---------GENERIC
   		UPDATE  su  set 
			JANUARY_GEN = CASE when api.month_date = '01' then api.totamt else JANUARY_GEN END,
			FEBRUARY_GEN = CASE when api.month_date = '02' then api.totamt else FEBRUARY_GEN END,
			MARCH_GEN = CASE when api.month_date = '03' then api.totamt else MARCH_GEN END,
			APRIL_GEN = CASE when api.month_date = '04' then api.totamt else APRIL_GEN END,
			MAY_GEN = CASE when api.month_date = '05' then api.totamt else MAY_GEN END,
			JUNE_GEN = CASE when api.month_date = '06' then api.totamt else JUNE_GEN END,
			JULY_GEN = CASE when api.month_date = '07' then api.totamt else JULY_GEN END,
			AUGUST_GEN = CASE when api.month_date = '08' then api.totamt else AUGUST_GEN END,
			SEPTEMBER_GEN = CASE when api.month_date = '09' then api.totamt else SEPTEMBER_GEN END,
			OCTOBER_GEN = CASE when api.month_date = '10' then api.totamt else OCTOBER_GEN END,
			NOVEMBER_GEN = CASE when api.month_date = '11' then api.totamt else NOVEMBER_GEN END,
			DECEMBER_GEN = CASE when api.month_date = '12' then api.totamt else DECEMBER_GEN END
	   FROM API_WHSales_Mnthly_ByType su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt ,type, whaccountid, year(invdate)as year_date , month(invdate)as month_date
				 FROM  dbo.v_apisalesdetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'
				 GROUP BY whaccountid,month(invdate),year(invdate) ,type ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date and api.type = 'Generic'
     
  	  INSERT  into API_WHSales_Mnthly_ByType (year,whaccountid,JANUARY_GEN,FEBRUARY_GEN,MARCH_GEN,APRIL_GEN,MAY_GEN,JUNE_GEN,JULY_GEN,AUGUST_GEN,
                        SEPTEMBER_GEN,OCTOBER_GEN,NOVEMBER_GEN,DECEMBER_GEN)  
      
      SELECT   distinct  year(invdate) as year_date ,whaccountid, 
            SUM(CASE when month(invdate) = '01' then ExtSales END)as JANUARY_GEN,
			SUM(CASE when month(invdate) = '02' then ExtSales  END) as FEBRUARY_GEN,
			SUM(CASE when month(invdate) = '03' then ExtSales  END) as MARCH_GEN,
			SUM(CASE when month(invdate) = '04' then ExtSales  END) as APRIL_GEN,
			SUM(CASE when month(invdate) = '05' then ExtSales  END) as MAY_GEN,
			SUM(CASE when month(invdate) = '06' then ExtSales  END) as JUNE_GEN,
			SUM(CASE when month(invdate) = '07' then ExtSales  END) as JULY_GEN,
			SUM(CASE when month(invdate) = '08' then ExtSales  END) as AUGUST_GEN,
			SUM(CASE when month(invdate) = '09' then ExtSales  END) as SEPTEMBER_GEN,
			SUM(CASE when month(invdate) = '10' then ExtSales  END) as OCTOBER_GEN,
			SUM(CASE when month(invdate) = '11' then ExtSales  END) as NOVEMBER_GEN,
			SUM(CASE when month(invdate) = '12' then ExtSales  END) as DECEMBER_GEN
          
    FROM  dbo.v_apisalesdetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and whaccountid not in (select whaccountid from API_WHSales_Mnthly_ByType where year = @in_year)
               and type = 'Generic')
    GROUP BY whaccountid,month(invdate),year(invdate),Type  ;

---------OTC

   		UPDATE  su  set 
			JANUARY_OTC = CASE when api.month_date = '01' then api.totamt else JANUARY_OTC END,
			FEBRUARY_OTC = CASE when api.month_date = '02' then api.totamt else FEBRUARY_OTC END,
			MARCH_OTC = CASE when api.month_date = '03' then api.totamt else MARCH_OTC END,
			APRIL_OTC = CASE when api.month_date = '04' then api.totamt else APRIL_OTC END,
			MAY_OTC = CASE when api.month_date = '05' then api.totamt else MAY_OTC END,
			JUNE_OTC = CASE when api.month_date = '06' then api.totamt else JUNE_OTC END,
			JULY_OTC = CASE when api.month_date = '07' then api.totamt else JULY_OTC END,
			AUGUST_OTC = CASE when api.month_date = '08' then api.totamt else AUGUST_OTC END,
			SEPTEMBER_OTC = CASE when api.month_date = '09' then api.totamt else SEPTEMBER_OTC END,
			OCTOBER_OTC = CASE when api.month_date = '10' then api.totamt else OCTOBER_OTC END,
			NOVEMBER_OTC = CASE when api.month_date = '11' then api.totamt else NOVEMBER_OTC END,
			DECEMBER_OTC = CASE when api.month_date = '12' then api.totamt else DECEMBER_OTC END
	   FROM API_WHSales_Mnthly_ByType su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt ,type, whaccountid, year(invdate)as year_date , month(invdate)as month_date
				 FROM  dbo.v_apisalesdetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'
				 GROUP BY whaccountid,month(invdate),year(invdate) ,type ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date and api.type = 'OTC'
     
  	  INSERT  into API_WHSales_Mnthly_ByType (year,whaccountid,JANUARY_OTC,FEBRUARY_OTC,MARCH_OTC,APRIL_OTC,MAY_OTC,JUNE_OTC,JULY_OTC,AUGUST_OTC,
                    SEPTEMBER_OTC,OCTOBER_OTC,NOVEMBER_OTC,DECEMBER_OTC)  
      
      SELECT   distinct  year(invdate) as year_date ,whaccountid, 
            SUM(CASE when month(invdate) = '01' then ExtSales END)as JANUARY_OTC,
			SUM(CASE when month(invdate) = '02' then ExtSales  END) as FEBRUARY_OTC,
			SUM(CASE when month(invdate) = '03' then ExtSales  END) as MARCH_OTC,
			SUM(CASE when month(invdate) = '04' then ExtSales  END) as APRIL_OTC,
			SUM(CASE when month(invdate) = '05' then ExtSales  END) as MAY_OTC,
			SUM(CASE when month(invdate) = '06' then ExtSales  END) as JUNE_OTC,
			SUM(CASE when month(invdate) = '07' then ExtSales  END) as JULY_OTC,
			SUM(CASE when month(invdate) = '08' then ExtSales  END) as AUGUST_OTC,
			SUM(CASE when month(invdate) = '09' then ExtSales  END) as SEPTEMBER_OTC,
			SUM(CASE when month(invdate) = '10' then ExtSales  END) as OCTOBER_OTC,
			SUM(CASE when month(invdate) = '11' then ExtSales  END) as NOVEMBER_OTC,
			SUM(CASE when month(invdate) = '12' then ExtSales  END) as DECEMBER_OTC
          
    FROM  dbo.v_apisalesdetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and whaccountid not in (select whaccountid from API_WHSales_Mnthly_ByType where year = @in_year)
               and type = 'OTC')
    GROUP BY whaccountid,month(invdate),year(invdate),Type  ;
    COMMIT TRAN sum_mnthly_by_type
	END
  

	BEGIN
		UPDATE  API_WHSales_Mnthly_ByType SET january_gen  = 0.0 WHERE january_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET february_gen  = 0.0 WHERE february_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET march_gen  = 0.0 WHERE march_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET april_gen  = 0.0 WHERE april_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET may_gen  = 0.0 WHERE may_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET june_gen  = 0.0 WHERE june_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET july_gen  = 0.0 WHERE july_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET august_gen  = 0.0 WHERE august_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET september_gen  = 0.0 WHERE september_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET october_gen  = 0.0 WHERE october_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET november_gen  = 0.0 WHERE november_gen is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET december_gen  = 0.0 WHERE december_gen is null ;

		UPDATE  API_WHSales_Mnthly_ByType SET january_otc  = 0.0 WHERE january_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET february_otc  = 0.0 WHERE february_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET march_otc  = 0.0 WHERE march_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET april_otc  = 0.0 WHERE april_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET may_otc  = 0.0 WHERE may_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET june_otc  = 0.0 WHERE june_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET july_otc  = 0.0 WHERE july_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET august_otc  = 0.0 WHERE august_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET september_otc  = 0.0 WHERE september_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET october_otc  = 0.0 WHERE october_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET november_otc  = 0.0 WHERE november_otc is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET december_otc  = 0.0 WHERE december_otc is null ;

		UPDATE  API_WHSales_Mnthly_ByType SET january_br  = 0.0 WHERE january_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET february_br  = 0.0 WHERE february_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET march_br  = 0.0 WHERE march_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET april_br  = 0.0 WHERE april_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET may_br  = 0.0 WHERE may_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET june_br  = 0.0 WHERE june_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET july_br  = 0.0 WHERE july_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET august_br  = 0.0 WHERE august_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET september_br  = 0.0 WHERE september_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET october_br  = 0.0 WHERE october_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET november_br  = 0.0 WHERE november_br is null ;
		UPDATE  API_WHSales_Mnthly_ByType SET december_br  = 0.0 WHERE december_br is null ;

	END
	-- New this is to add records new in newest year that don't have records in previous year
	BEGIN
   		  INSERT  into API_WHSales_Mnthly_ByType (year,whaccountid,JANUARY_BR,FEBRUARY_BR,MARCH_BR,APRIL_BR,MAY_BR,JUNE_BR,JULY_BR,AUGUST_BR,SEPTEMBER_BR,
                     OCTOBER_BR,NOVEMBER_BR,DECEMBER_BR,
                     JANUARY_GEN,FEBRUARY_GEN,MARCH_GEN,APRIL_GEN,MAY_GEN,JUNE_GEN,JULY_GEN,AUGUST_GEN,
                     SEPTEMBER_GEN,OCTOBER_GEN,NOVEMBER_GEN,DECEMBER_GEN,
                     JANUARY_OTC,FEBRUARY_OTC,MARCH_OTC,APRIL_OTC,MAY_OTC,JUNE_OTC,JULY_OTC,AUGUST_OTC,
                     SEPTEMBER_OTC,OCTOBER_OTC,NOVEMBER_OTC,DECEMBER_OTC



           )
		  SELECT     @in_year - 1 as year_date ,whaccountid, 
				0 as JANUARY_BR,
				0 as FEBRUARY_BR,
				0 as MARCH_BR,
				0 as APRIL_BR,
				0 as MAY_BR,
				0 as JUNE_BR,
				0 as JULY_BR,
				0 as AUGUST_BR,
				0 as SEPTEMBER_BR,
				0 as OCTOBER_BR,
				0 as NOVEMBER_BR,
				0 as DECEMBER_BR,

     

                0 as JANUARY_GEN,
				0 as FEBRUARY_GEN,
				0 as MARCH_GEN,
				0 as APRIL_GEN,
				0 as MAY_GEN,
				0 as JUNE_GEN,
				0 as JULY_GEN,
				0 as AUGUST_GEN,
				0 as SEPTEMBER_GEN,
				0 as OCTOBER_GEN,
				0 as NOVEMBER_GEN,
				0 as DECEMBER_GEN,

                
                0 as JANUARY_OTC,
				0 as FEBRUARY_OTC,
				0 as MARCH_OTC,
				0 as APRIL_OTC,
				0 as MAY_OTC,
				0 as JUNE_OTC,
				0 as JULY_OTC,
				0 as AUGUST_OTC,
				0 as SEPTEMBER_OTC,
				0 as OCTOBER_OTC,
				0 as NOVEMBER_OTC,
				0 as DECEMBER_OTC    
		FROM  dbo.API_WHSales_Mnthly_ByType 
		WHERE     year  = @in_year and whaccountid not in (select whaccountid from API_WHSales_Mnthly_ByType where year = @in_year -1) 

	END








GO
