USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sales_ByWeek_rpt]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_api_sales_ByWeek_rpt]
    (@in_date varchar(10) )
as
set nocount on
DECLARE @SQL VARCHAR(2000);

 EXECUTE  dbo.spud_api_sales_ByWeek @in_date 

BEGIN

SET @SQL = 'Select * from tmp_API_Sales_ByWeek order by total desc';
EXEC (@SQL)
END

set nocount off
GO
