USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sales_weekly]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2009>
-- Description:	<Weekly  sales for the month by ndc>
-- =============================================
CREATE PROCEDURE [dbo].[spud_api_sales_weekly]
  (@in_date varchar(10) )
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
        
	SELECT CustomerName ,sum(ExtSales) as TotalAmount,whaccountid,territory  FROM v_APISalesDetail WHERE invdate Between  Convert(datetime, DateAdd(dd, -(DatePart(dw, @in_date) - 1), @in_date), 101)
	and Convert(datetime, DateAdd(dd, (7 - DatePart(dw,@in_date)), @in_date), 101)
    group by CustomerName, whaccountid,territory
    order by TotalAmount desc

	END









GO
