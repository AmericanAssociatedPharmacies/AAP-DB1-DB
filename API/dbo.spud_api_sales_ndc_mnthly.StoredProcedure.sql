USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sales_ndc_mnthly]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2009>
-- Description:	<Aggregate sales for the month by ndc>
-- =============================================
CREATE PROCEDURE [dbo].[spud_api_sales_ndc_mnthly]
  (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
        BEGIN TRAN sum_mnthly
        
       

		UPDATE  su  set 
			JANUARY = CASE when api.month_date = '01' then api.total else JANUARY END,
			FEBRUARY = CASE when api.month_date = '02' then api.total else FEBRUARY END,
			MARCH = CASE when api.month_date = '03' then api.total else MARCH END,
			APRIL = CASE when api.month_date = '04' then api.total else APRIL END,
			MAY = CASE when api.month_date = '05' then api.total else MAY END,
			JUNE = CASE when api.month_date = '06' then api.total else JUNE END,
			JULY = CASE when api.month_date = '07' then api.total else JULY END,
			AUGUST = CASE when api.month_date = '08' then api.total else AUGUST END,
			SEPTEMBER = CASE when api.month_date = '09' then api.total else SEPTEMBER END,
			OCTOBER = CASE when api.month_date = '10' then api.total else OCTOBER END,
			NOVEMBER = CASE when api.month_date = '11' then api.total else NOVEMBER END,
			DECEMBER = CASE when api.month_date = '12' then api.total else DECEMBER END 
		
	   FROM APISalesNDC_MO su 
	   inner join 
			(  SELECT SUM(extsales) as total, ndc, type, year(invdate)as year_date , month(invdate)as month_date
				 FROM  dbo.v_APISalesDetail
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year
				 GROUP BY ndc,type,  month(invdate),year(invdate)  ) api
	   on su.ndc = api.ndc  and su.year = api.year_date
	
     
  	  INSERT  into APISalesNDC_MO (year,ndc,Type,JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER)
      
      SELECT   distinct  year(invdate) as year_date ,api.NDC, api.type,
			SUM(CASE when month(invdate) = '01' then extsales END)as JANUARY,
			SUM(CASE when month(invdate) = '02' then extsales  END) as FEBRUARY,
			SUM(CASE when month(invdate) = '03' then extsales  END) as MARCH,
			SUM(CASE when month(invdate) = '04' then extsales  END) as APRIL,
			SUM(CASE when month(invdate) = '05' then extsales  END) as MAY,
			SUM(CASE when month(invdate) = '06' then extsales  END) as JUNE,
			SUM(CASE when month(invdate) = '07' then extsales  END) as JULY,
			SUM(CASE when month(invdate) = '08' then extsales  END) as AUGUST,
			SUM(CASE when month(invdate) = '09' then extsales  END) as SEPTEMBER,
			SUM(CASE when month(invdate) = '10' then extsales  END) as OCTOBER,
			SUM(CASE when month(invdate) = '11' then extsales  END) as NOVEMBER,
			SUM(CASE when month(invdate) = '12' then extsales  END) as DECEMBER  
          
    FROM  dbo.v_APISalesDetail api

    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year and not exists (select ndc from APISalesNDC_MO smo where year = @in_year 
    and api.ndc =  smo.ndc))

    GROUP BY api.ndc,api.type,month(invdate),year(invdate)  

	COMMIT TRAN sum_mnthly
    END
 
BEGIN
	UPDATE  APISalesNDC_MO SET january  = 0.0 WHERE january is null ;
	UPDATE  APISalesNDC_MO SET february  = 0.0 WHERE february is null ;
	UPDATE  APISalesNDC_MO SET march  = 0.0 WHERE march is null ;
	UPDATE  APISalesNDC_MO SET april  = 0.0 WHERE april is null ;
	UPDATE  APISalesNDC_MO SET may  = 0.0 WHERE may is null ;
	UPDATE  APISalesNDC_MO SET june  = 0.0 WHERE june is null ;
	UPDATE  APISalesNDC_MO SET july  = 0.0 WHERE july is null ;
	UPDATE  APISalesNDC_MO SET august  = 0.0 WHERE august is null ;
	UPDATE  APISalesNDC_MO SET september  = 0.0 WHERE september is null ;
	UPDATE  APISalesNDC_MO SET october  = 0.0 WHERE october is null ;
	UPDATE  APISalesNDC_MO SET november  = 0.0 WHERE november is null ;
	UPDATE  APISalesNDC_MO SET december  = 0.0 WHERE december is null ;

END


BEGIN --Update Store Count

   		UPDATE  su  set 
			JANUARY_ST_CNT = CASE when @in_month = '01' then api.store_count else JANUARY_ST_CNT END,
			FEBRUARY_ST_CNT = CASE when @in_month = '02' then api.store_count else FEBRUARY_ST_CNT END,
			MARCH_ST_CNT = CASE when @in_month = '03' then api.store_count else MARCH_ST_CNT END,
			APRIL_ST_CNT = CASE when @in_month = '04' then api.store_count else APRIL_ST_CNT END,
			MAY_ST_CNT = CASE when  @in_month = '05' then api.store_count else MAY_ST_CNT END,
			JUNE_ST_CNT = CASE when @in_month = '06' then api.store_count else JUNE_ST_CNT END,
			JULY_ST_CNT = CASE when @in_month = '07' then api.store_count else JULY_ST_CNT END,
			AUGUST_ST_CNT = CASE when @in_month = '08' then api.store_count else AUGUST_ST_CNT END,
			SEPTEMBER_ST_CNT = CASE when @in_month = '09' then api.store_count else SEPTEMBER_ST_CNT END,
			OCTOBER_ST_CNT = CASE when @in_month = '10' then api.store_count else OCTOBER_ST_CNT END,
			NOVEMBER_ST_CNT = CASE when @in_month = '11' then api.store_count else NOVEMBER_ST_CNT END,
			DECEMBER_ST_CNT = CASE when @in_month = '12' then api.store_count else DECEMBER_ST_CNT END
	   FROM APISalesNDC_MO su 
			   inner join 
	        (SELECT count( distinct whaccountid) as store_count,ndc 
	            FROM v_APISalesDetail
	            WHERE year(invdate) =  @in_year and month(invdate) = @in_month
		        GROUP BY ndc) api
	    on su.ndc = api.ndc  and su.year = @in_year
	    
END

BEGIN

BEGIN
	UPDATE  APISalesNDC_MO SET JANUARY_ST_CNT  = 0.0 WHERE JANUARY_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET FEBRUARY_ST_CNT  = 0.0 WHERE FEBRUARY_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET MARCH_ST_CNT  = 0.0 WHERE MARCH_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET APRIL_ST_CNT  = 0.0 WHERE APRIL_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET MAY_ST_CNT  = 0.0 WHERE MAY_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET JUNE_ST_CNT  = 0.0 WHERE JUNE_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET JULY_ST_CNT  = 0.0 WHERE JULY_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET AUGUST_ST_CNT  = 0.0 WHERE AUGUST_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET SEPTEMBER_ST_CNT  = 0.0 WHERE SEPTEMBER_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET OCTOBER_ST_CNT  = 0.0 WHERE OCTOBER_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET NOVEMBER_ST_CNT  = 0.0 WHERE NOVEMBER_ST_CNT is null ;
	UPDATE  APISalesNDC_MO SET DECEMBER_ST_CNT  = 0.0 WHERE DECEMBER_ST_CNT is null ;

END

END









GO
