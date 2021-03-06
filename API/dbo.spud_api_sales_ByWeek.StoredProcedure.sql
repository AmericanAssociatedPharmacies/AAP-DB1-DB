USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sales_ByWeek]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2009>
-- Description:	<Weekly  sales for the month>
-- =============================================
CREATE PROCEDURE [dbo].[spud_api_sales_ByWeek]
  (@in_date varchar(10) )
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
     DECLARE @startDate DateTime;
     DECLARE @endDate DateTime;

	 SET @startDate = Convert(datetime, DateAdd(dd, -(DatePart(dw, @in_date) - 1),@in_date), 101);
     SET @endDate =  Convert(datetime, DateAdd(dd, (7 - DatePart(dw,@in_date)), @in_date), 101);


       IF EXISTS(SELECT name FROM sys.tables WHERE name = 'tmp_API_Sales_ByWeek')
		BEGIN
           drop table tmp_API_Sales_ByWeek;
        END
   
	 SELECT  a.WHAccountID,a.Territory ,a4.AccountName,
     
		CASE WHEN a1.Brand is null then 0 else a1.Brand END as 'Brand',
		CASE WHEN a2.Generic is null then 0 else a2.Generic END as 'Generic',
		CASE WHEN a3.OTC is null then 0 else a3.OTC END as 'OTC',
		 (CASE WHEN a1.Brand is null then 0 else a1.Brand END  
		 +  CASE WHEN a2.Generic is null then 0 else a2.Generic END 
		 +  CASE WHEN a3.OTC is null then 0 else a3.OTC END ) as Total into tmp_API_Sales_ByWeek
   FROM v_APISalesDetail a
	   full outer join

	   (SELECT  WHAccountID, Territory, sum(ExtSales)as 'Brand'  FROM v_APISalesDetail 

		 WHERE invdate Between  @startDate
			and @endDate and type = 'Brand' group by WHAccountID,Territory,Type)a1
			on a.WHAccountID = a1.WHAccountID and a.Territory = a1.Territory
	   full outer join
	  (SELECT sum(ExtSales) as 'Generic',WHAccountID ,Territory from v_APISalesDetail 
		  WHERE invdate Between  @startDate 
			and @endDate and type = 'Generic'  group by WHAccountID,Territory,Type) a2
			on a.WHAccountID = a2.WHAccountID  and a.Territory = a2.Territory

	   full outer join 
	  (SELECT sum(ExtSales) as 'OTC',WHAccountID ,Territory from v_APISalesDetail 
		  WHERE invdate Between  @startDate
			and @endDate and type = 'OTC'  group by WHAccountID,Territory,Type) a3
			on a.WHAccountID = a3.WHAccountID  and a.Territory = a3.Territory
      full outer join
		(select accountname,accountno from APIAccountMaster_Orig ) a4
			on a.WHAccountID = a4.AccountNo
   WHERE invdate Between  @startDate
      and @endDate 
	 group by a.WHAccountID, a.Territory,a4.AccountName ,a1.Brand    ,a2.Generic,a3.OTC   
	-- order by customername
 

  -- Can't group by Customer name because same name can be different (more spaces or whatever)

--     	UPDATE  su  set 
--			CustomerName =  cn.AccountName  
--	   FROM tmp_API_Sales_ByWeek su 
--		inner join 
--			(  SELECT AccountName,AccountNo  
--				 FROM  dbo.APIAccountMaster_Orig) cn
--	   on su.WHAccountID = cn.AccountNo    

--    	UPDATE  su  set 
--			CustomerName =  cn.CustomerName  
--	   FROM tmp_API_Sales_ByWeek su 
--		inner join 
--			(  SELECT CustomerName,WHAccountID, Rank() OVER (Partition BY WHAccountID order by CustomerName asc) as Rank
--				 FROM  dbo.v_APISalesDetail) cn
--	   on su.WHAccountID = cn.WHAccountID   where Rank = 1
	END









GO
