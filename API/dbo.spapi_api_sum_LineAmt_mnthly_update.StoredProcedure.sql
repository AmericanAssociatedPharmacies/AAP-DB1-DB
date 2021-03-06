USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_api_sum_LineAmt_mnthly_update]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	<Aggregate line amount for the month by whacccountid>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_api_sum_LineAmt_mnthly_update]
 (@in_month varchar(2), @in_year varchar(4))
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
        BEGIN TRAN sum_mnthly
        
       

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
	   FROM API_Sum_LineAmt_Mnthly su 
		inner join 
			(  SELECT SUM(LineAmt) as totamt , whaccountid, year(invdate)as year_date , month(invdate)as month_date  
				 FROM  dbo.v_apisalesdetail 
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year  
				 GROUP BY whaccountid,month(invdate),year(invdate)  ) api
	   on su.whaccountid = api.whaccountid and su.year = api.year_date
     
  	  INSERT  into API_Sum_LineAmt_Mnthly (year,whaccountid,JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER)  
      
      SELECT   distinct  year(invdate) as year_date ,whaccountid, 
            SUM(CASE when month(invdate) = '01' then LineAmt END)as JANUARY,
			SUM(CASE when month(invdate) = '02' then LineAmt  END) as FEBRUARY,
			SUM(CASE when month(invdate) = '03' then LineAmt  END) as MARCH,
			SUM(CASE when month(invdate) = '04' then LineAmt  END) as APRIL,
			SUM(CASE when month(invdate) = '05' then LineAmt  END) as MAY,
			SUM(CASE when month(invdate) = '06' then LineAmt  END) as JUNE,
			SUM(CASE when month(invdate) = '07' then LineAmt  END) as JULY,
			SUM(CASE when month(invdate) = '08' then LineAmt  END) as AUGUST,
			SUM(CASE when month(invdate) = '09' then LineAmt  END) as SEPTEMBER,
			SUM(CASE when month(invdate) = '10' then LineAmt  END) as OCTOBER,
			SUM(CASE when month(invdate) = '11' then LineAmt  END) as NOVEMBER,
			SUM(CASE when month(invdate) = '12' then LineAmt  END) as DECEMBER   
          
    FROM  dbo.v_apisalesdetail 
    WHERE     ( month(invdate) = @in_month and year(invdate) = @in_year  and whaccountid not in (select whaccountid from API_Sum_LineAmt_Mnthly where year = @in_year
         ) )
    GROUP BY whaccountid,month(invdate),year(invdate)  ;

	COMMIT TRAN sum_mnthly
    END
 
BEGIN
	UPDATE  API_Sum_LineAmt_Mnthly SET january  = 0.0 WHERE january is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET february  = 0.0 WHERE february is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET march  = 0.0 WHERE march is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET april  = 0.0 WHERE april is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET may  = 0.0 WHERE may is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET june  = 0.0 WHERE june is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET july  = 0.0 WHERE july is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET august  = 0.0 WHERE august is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET september  = 0.0 WHERE september is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET october  = 0.0 WHERE october is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET november  = 0.0 WHERE november is null ;
	UPDATE  API_Sum_LineAmt_Mnthly SET december  = 0.0 WHERE december is null ;

END
-- New this is to add records new in newest year that don't have records in previous year
BEGIN
   	  INSERT  into API_Sum_LineAmt_Mnthly (year,whaccountid,JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER)  
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
			0 as DECEMBER   
    FROM  dbo.API_Sum_LineAmt_Mnthly 
    WHERE     year  = @in_year and whaccountid not in (select whaccountid from API_Sum_LineAmt_Mnthly where year = @in_year -1) 

END







GO
