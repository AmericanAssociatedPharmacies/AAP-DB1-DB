USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_select_API_Sales_rpt]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spud_select_API_Sales_rpt]
  
as
set nocount on

 

BEGIN
	Select * from tmp_API_JMW order by salesman asc;
--   Select * from tmp_COG_Compare_rpt order by groupid;
END

set nocount off
GO
