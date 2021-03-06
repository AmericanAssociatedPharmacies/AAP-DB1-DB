USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sum_totamt_mnthly_update_test]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	<Aggregate total amount for the month by whacccountid>
-- =============================================
CREATE PROCEDURE [dbo].[spud_api_sum_totamt_mnthly_update_test]
 (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
        BEGIN TRAN sum_mnthly
        
       
       --This is for TOTAL 
		UPDATE  su  set 
			JANUARY = CASE when api.month_date = '01' then api.totamt else JANUARY END,
			FEBRUARY = CASE when api.month_date = '02' then api.totamt else FEBRUARY END,
			MARCH = CASE when api.month_date = '03' then api.totamt else MARCH END,
			APRIL = CASE when api.month_date = '04' then api.totamt else APRIL END,
			MAY = CASE when api.month_date = '05' then api.totamt else MAY END,
			JUNE = CASE when api.month_date = '06' then api.totamt else JUNE END,
			JULY = CASE when api.month_date = '07' then api.totamt else JULY END,
			AUGUST = CASE when api.month_date = '08' then api.totamt else AUGUST END,
			SEPTEMBER = CASE when api.month_date = '09' then api.totamt else SEPTEMBER END,
			OCTOBER = CASE when api.month_date = '10' then api.totamt else OCTOBER END,
			NOVEMBER = CASE when api.month_date = '11' then api.totamt else NOVEMBER END,
			DECEMBER = CASE when api.month_date = '12' then api.totamt else DECEMBER END
	   FROM API_Sum_Totamt_Mnthly_test su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt , whaccountid, year(invdate)as year_date , month(invdate)as month_date
				 FROM  dbo.v_APISalesDetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year
				 GROUP BY whaccountid,month(invdate),year(invdate)  ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date
     
  	  INSERT  into API_Sum_Totamt_Mnthly_test (year,whaccountid,JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER)  
      
      SELECT   distinct  year(invdate) as year_date ,whaccountid, 
            SUM(CASE when month(invdate) = '01' then ExtSales END)as JANUARY,
			SUM(CASE when month(invdate) = '02' then ExtSales  END) as FEBRUARY,
			SUM(CASE when month(invdate) = '03' then ExtSales  END) as MARCH,
			SUM(CASE when month(invdate) = '04' then ExtSales  END) as APRIL,
			SUM(CASE when month(invdate) = '05' then ExtSales  END) as MAY,
			SUM(CASE when month(invdate) = '06' then ExtSales  END) as JUNE,
			SUM(CASE when month(invdate) = '07' then ExtSales  END) as JULY,
			SUM(CASE when month(invdate) = '08' then ExtSales  END) as AUGUST,
			SUM(CASE when month(invdate) = '09' then ExtSales  END) as SEPTEMBER,
			SUM(CASE when month(invdate) = '10' then ExtSales  END) as OCTOBER,
			SUM(CASE when month(invdate) = '11' then ExtSales  END) as NOVEMBER,
			SUM(CASE when month(invdate) = '12' then ExtSales  END) as DECEMBER   
          
    FROM  dbo.v_APISalesDetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and whaccountid not in (select whaccountid from API_Sum_Totamt_Mnthly_test where year = @in_year))
    GROUP BY whaccountid,month(invdate),year(invdate)  ;

       
       --This is for Generic 
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
	   FROM API_Sum_Totamt_Mnthly_test su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt , whaccountid, year(invdate)as year_date , month(invdate)as month_date 
				 FROM  dbo.v_APISalesDetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'
				 GROUP BY whaccountid,month(invdate),year(invdate)   ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date
     
  	  INSERT  into API_Sum_Totamt_Mnthly_test (year,whaccountid,JANUARY_GEN,FEBRUARY_GEN,MARCH_GEN,APRIL_GEN,MAY_GEN,JUNE_GEN,JULY_GEN,AUGUST_GEN,SEPTEMBER_GEN,OCTOBER_GEN,NOVEMBER_GEN,DECEMBER_GEN)  
      
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
          
    FROM  dbo.v_APISalesDetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic' and whaccountid not in (select whaccountid from API_Sum_Totamt_Mnthly_test where year = @in_year))
    GROUP BY whaccountid,month(invdate),year(invdate)  ;


  --This is for Brand 
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
	   FROM API_Sum_Totamt_Mnthly_test su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt , whaccountid, year(invdate)as year_date , month(invdate)as month_date 
				 FROM  dbo.v_APISalesDetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'
				 GROUP BY whaccountid,month(invdate),year(invdate)   ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date
     
  	  INSERT  into API_Sum_Totamt_Mnthly_test (year,whaccountid,JANUARY_BR,FEBRUARY_BR,MARCH_BR,APRIL_BR,MAY_BR,JUNE_BR,JULY_BR,AUGUST_BR,SEPTEMBER_BR,OCTOBER_BR,NOVEMBER_BR,DECEMBER_BR)  
      
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
          
    FROM  dbo.v_APISalesDetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand' and whaccountid not in (select whaccountid from API_Sum_Totamt_Mnthly_test where year = @in_year))
    GROUP BY whaccountid,month(invdate),year(invdate)  ;


           --This is for OTC 
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
	   FROM API_Sum_Totamt_Mnthly_test su 
		inner join 
			(  SELECT SUM(ExtSales) as totamt , whaccountid, year(invdate)as year_date , month(invdate)as month_date
				 FROM  dbo.v_APISalesDetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'
				 GROUP BY whaccountid,month(invdate),year(invdate)  ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date
     
  	  INSERT  into API_Sum_Totamt_Mnthly_test (year,whaccountid,JANUARY_OTC,FEBRUARY_OTC,MARCH_OTC,APRIL_OTC,MAY_OTC,JUNE_OTC,JULY_OTC,AUGUST_OTC,SEPTEMBER_OTC,OCTOBER_OTC,NOVEMBER_OTC,DECEMBER_OTC)  
      
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
          
    FROM  dbo.v_APISalesDetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'  and whaccountid not in (select whaccountid from API_Sum_Totamt_Mnthly_test where year = @in_year))
    GROUP BY whaccountid,month(invdate),year(invdate)  ;

	COMMIT TRAN sum_mnthly
    END
 
BEGIN
	UPDATE  API_Sum_Totamt_Mnthly_test SET january  = 0.0 WHERE january is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET february  = 0.0 WHERE february is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET march  = 0.0 WHERE march is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET april  = 0.0 WHERE april is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET may  = 0.0 WHERE may is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET june  = 0.0 WHERE june is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET july  = 0.0 WHERE july is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET august  = 0.0 WHERE august is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET september  = 0.0 WHERE september is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET october  = 0.0 WHERE october is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET november  = 0.0 WHERE november is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET december  = 0.0 WHERE december is null ;
   
    UPDATE  API_Sum_Totamt_Mnthly_test SET january_GEN  = 0.0 WHERE january_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET february_GEN  = 0.0 WHERE february_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET march_GEN  = 0.0 WHERE march_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET april_GEN  = 0.0 WHERE april_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET may_GEN  = 0.0 WHERE may_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET june_GEN  = 0.0 WHERE june_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET july_GEN  = 0.0 WHERE july_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET august_GEN  = 0.0 WHERE august_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET september_GEN  = 0.0 WHERE september_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET october_GEN  = 0.0 WHERE october_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET november_GEN  = 0.0 WHERE november_GEN is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET december_GEN  = 0.0 WHERE december_GEN is null ;

    UPDATE  API_Sum_Totamt_Mnthly_test SET january_BR  = 0.0 WHERE january_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET february_BR  = 0.0 WHERE february_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET march_BR  = 0.0 WHERE march_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET april_BR  = 0.0 WHERE april_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET may_BR  = 0.0 WHERE may_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET june_BR  = 0.0 WHERE june_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET july_BR  = 0.0 WHERE july_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET august_BR  = 0.0 WHERE august_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET september_BR  = 0.0 WHERE september_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET october_BR  = 0.0 WHERE october_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET november_BR  = 0.0 WHERE november_BR is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET december_BR  = 0.0 WHERE december_BR is null ;

    UPDATE  API_Sum_Totamt_Mnthly_test SET january_OTC  = 0.0 WHERE january_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET february_OTC  = 0.0 WHERE february_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET march_OTC  = 0.0 WHERE march_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET april_OTC  = 0.0 WHERE april_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET may_OTC  = 0.0 WHERE may_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET june_OTC  = 0.0 WHERE june_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET july_OTC  = 0.0 WHERE july_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET august_OTC  = 0.0 WHERE august_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET september_OTC  = 0.0 WHERE september_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET october_OTC  = 0.0 WHERE october_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET november_OTC  = 0.0 WHERE november_OTC is null ;
	UPDATE  API_Sum_Totamt_Mnthly_test SET december_OTC  = 0.0 WHERE december_OTC is null ;

END
-- New this is to add records new in newest year that don't have records in previous year
BEGIN
   	  INSERT  into API_Sum_Totamt_Mnthly_test (year,whaccountid,JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER,
                    JANUARY_GEN,FEBRUARY_GEN,MARCH_GEN,APRIL_GEN,MAY_GEN,JUNE_GEN,JULY_GEN,AUGUST_GEN,SEPTEMBER_GEN,OCTOBER_GEN,NOVEMBER_GEN,DECEMBER_GEN,
                    JANUARY_BR,FEBRUARY_BR,MARCH_BR,APRIL_BR,MAY_BR,JUNE_BR,JULY_BR,AUGUST_BR,SEPTEMBER_BR,OCTOBER_BR,NOVEMBER_BR,DECEMBER_BR,
                    JANUARY_OTC,FEBRUARY_OTC,MARCH_OTC,APRIL_OTC,MAY_OTC,JUNE_OTC,JULY_OTC,AUGUST_OTC,SEPTEMBER_OTC,OCTOBER_OTC,NOVEMBER_OTC,DECEMBER_OTC )  
      SELECT     @in_year - 1 as year_date ,whaccountid, 
            0 as JANUARY,
			0 as FEBRUARY,
			0 as MARCH,
			0 as APRIL,
			0 as MAY,
			0 as JUNE,
			0 as JULY,
			0 as AUGUST,
			0 as SEPTEMBER,
			0 as OCTOBER,
			0 as NOVEMBER,
			0 as DECEMBER ,
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
			0 as DECEMBER_GEN ,
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
			0 as DECEMBER_BR , 
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
    FROM  dbo.API_Sum_Totamt_Mnthly_test 
    WHERE     year  = @in_year and whaccountid not in (select whaccountid from API_Sum_Totamt_Mnthly_test where year = @in_year -1) 

END







GO
