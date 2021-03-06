USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_API_SALES_LOAD_SLX_AAP_orig]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_API_SALES_LOAD_SLX_AAP_orig]
 (@in_month varchar(2), @in_year varchar(4))
AS
SET NOCOUNT ON

DECLARE @SQL varchar(6000);
DECLARE @MO_1 varchar(2);
DECLARE @MO_2 varchar(2);
DECLARE @MO_3 varchar(2);
DECLARE @MO_1_Year varchar(4);
DECLARE @MO_2_Year varchar(4);
DECLARE @MO_3_Year varchar(4);
DECLARE @prev_year varchar(4);

SET @prev_year = @in_year -1;
SET @MO_1_Year =  @in_year;
SET @MO_2_Year =  @in_year;
SET @MO_3_Year =  @in_year;
 
-- Here we set the qtr we need to be getting data from
IF( @in_month = '01')
     BEGIN
       SET @MO_1 = '01';
       SET @MO_2 = '12';
       SET @MO_3 = '11';
       SET @MO_2_Year =  @prev_year;
       SET @MO_3_Year =  @prev_year;
     END
IF( @in_month = '02')
     BEGIN
       SET @MO_1 = '02';
       SET @MO_2 = '01';
       SET @MO_3 = '12';
       SET @MO_3_Year =  @prev_year;
     END
IF( @in_month = '03')
     BEGIN
       SET @MO_1 = '03';
       SET @MO_2 = '02';
       SET @MO_3 = '01';
     END
IF( @in_month = '04')
     BEGIN
       SET @MO_1 = '04';
       SET @MO_2 = '03';
       SET @MO_3 = '02';
     END
IF( @in_month = '05')
     BEGIN
       SET @MO_1 = '05';
       SET @MO_2 = '04';
       SET @MO_3 = '03';
     END
IF( @in_month = '06')
     BEGIN
       SET @MO_1 = '06';
       SET @MO_2 = '05';
       SET @MO_3 = '04';
     END
IF( @in_month = '07')
     BEGIN
       SET @MO_1 = '07';
       SET @MO_2 = '06';
       SET @MO_3 = '05';
     END
IF( @in_month = '08')
     BEGIN
       SET @MO_1 = '08';
       SET @MO_2 = '07';
       SET @MO_3 = '06';
     END
IF( @in_month = '09')
     BEGIN
       SET @MO_1 = '09';
       SET @MO_2 = '08';
       SET @MO_3 = '07';
     END
IF( @in_month = '10')
     BEGIN
       SET @MO_1 = '10';
       SET @MO_2 = '09';
       SET @MO_3 = '08';
     END
IF( @in_month = '11')
     BEGIN
       SET @MO_1 = '11';
       SET @MO_2 = '10';
       SET @MO_3 = '09';
     END
IF( @in_month = '12')
     BEGIN
       SET @MO_1 = '12';
       SET @MO_2 = '11';
       SET @MO_3 = '10';
     END
 
 
 






-- Drop temp tables
   IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_SALES_LOAD_SLX_AAP')
		BEGIN
           drop table tmp_API_SALES_LOAD_SLX_AAP;
        END


 

	SELECT distinct whaccountid ,
	cast(0.0 as numeric(38,2)) as tot_mo_1, 
	cast(0.0 as numeric(38,2)) as tot_mo_2, 
	cast(0.0 as numeric(38,2)) as tot_mo_3, 
	cast(0.0 as numeric(38,2)) as gen_mo_1, 
	cast(0.0 as numeric(38,2)) as gen_mo_2, 
	cast(0.0 as numeric(38,2)) as gen_mo_3, 
	cast(0.0 as numeric(38,2)) as br_mo_1, 
	cast(0.0 as numeric(38,2)) as br_mo_2, 
	cast(0.0 as numeric(38,2)) as br_mo_3,
	cast(0.0 as numeric(38,2)) as otc_mo_1, 
	cast(0.0 as numeric(38,2)) as otc_mo_2, 
	cast(0.0 as numeric(38,2)) as otc_mo_3,
	cast(0.0 as numeric(38,2)) as tot_avg_3_mo, 
	cast(0.0 as numeric(38,2)) as gen_avg_3_mo,
	cast(0.0 as numeric(38,2)) as br_avg_3_mo,
	cast(0.0 as numeric(38,2)) as otc_avg_3_mo 
	into tmp_API_SALES_LOAD_SLX_AAP from APISalesDetail

 
-- Totals



	UPDATE  ap  set 	
			ap.tot_mo_1 =   sa.Total_M1 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as Total_M1  
				from APISalesDetail a where month(a.invdate) = '07' and year(a.invdate) = '2009'
				group by whaccountid   ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 		ap.tot_mo_2 =   sa.Total_M2 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as Total_M2   
				from APISalesDetail a where month(a.invdate) = '08' and year(a.invdate) = '2009'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.tot_mo_3 =   sa.Total_M3
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as Total_M3   
				from APISalesDetail a where month(a.invdate) = '09' and year(a.invdate) = '2009'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


-- Generic Totals

	UPDATE  ap  set 
			ap.gen_mo_1 =   sa.GEN_M1 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP  ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as GEN_M1   
				from APISalesDetail a where month(a.invdate) = '07' and year(a.invdate) = '2009' and type = 'Generic'
				group by whaccountid ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.gen_mo_2 =   sa.GEN_M2 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP  ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as GEN_M2   
				from APISalesDetail a where month(a.invdate) = '08' and year(a.invdate) = '2009' and type = 'Generic'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.gen_mo_3 =   sa.GEN_M3
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP  ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as GEN_M3   
				from APISalesDetail a where month(a.invdate) = '09' and year(a.invdate) = '2009' and type = 'Generic'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  

-- BRAND
 
 UPDATE  ap  set 
			ap.br_mo_1 =   sa.BR_M1 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as BR_M1   
				from APISalesDetail a where month(a.invdate) = '07' and year(a.invdate) = '2009' and type = 'Brand'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.br_mo_2 =   sa.BR_M2 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as BR_M2  
				from APISalesDetail a where month(a.invdate) = '08' and year(a.invdate) = '2009' and type = 'Brand'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.br_mo_3 =   sa.BR_M3
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as BR_M3   
				from APISalesDetail a where month(a.invdate) = '09' and year(a.invdate) = '2009' and type = 'Brand'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


-- OTC

 UPDATE  ap  set 
			ap.otc_mo_1 =   sa.OTC_M1 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as OTC_M1   
				from APISalesDetail a where month(a.invdate) = '07' and year(a.invdate) = '2009' and type = 'OTC'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.otc_mo_2 =   sa.OTC_M2 
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as OTC_M2  
				from APISalesDetail a where month(a.invdate) = '08' and year(a.invdate) = '2009' and type = 'OTC'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  


	UPDATE  ap  set 
			ap.otc_mo_3 =   sa.OTC_M3
 
	   FROM tmp_API_SALES_LOAD_SLX_AAP ap 
		inner join 
			(  select a.whaccountid,sum(a.totalamount)as OTC_M3   
				from APISalesDetail a where month(a.invdate) = '09' and year(a.invdate) = '2009' and type = 'OTC'
				group by whaccountid  ) sa
	   on ap.whaccountid = sa.whaccountid  

BEGIN
 UPDATE tmp_API_SALES_LOAD_SLX_AAP  
   SET tot_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(tot_mo_1, tot_mo_2, tot_mo_3)  

END

BEGIN
 UPDATE tmp_API_SALES_LOAD_SLX_AAP  
   SET gen_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(gen_mo_1 , gen_mo_2 , gen_mo_3)  

END

BEGIN
 UPDATE tmp_API_SALES_LOAD_SLX_AAP  
   SET br_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(br_mo_1 , br_mo_2 , br_mo_3)  

END

BEGIN
 UPDATE tmp_API_SALES_LOAD_SLX_AAP  
   SET otc_avg_3_mo =  reporting.dbo.AvgNoLeading0s3args(otc_mo_1 , otc_mo_2 , otc_mo_3) 

END


SET  NOCOUNT OFF




GO
