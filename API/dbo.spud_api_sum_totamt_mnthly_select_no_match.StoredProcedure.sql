USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sum_totamt_mnthly_select_no_match]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	<Select total amount for the month by whacccountid>
-- =============================================
CREATE PROCEDURE [dbo].[spud_api_sum_totamt_mnthly_select_no_match]
 ( @in_year varchar(4))
AS
	BEGIN

       SELECT sum( t.january) as January,sum( t.february) as February,sum( t.march) as March,sum( t.april)as April,sum( t.may) as May
			 ,sum( t.june)as June,sum( t.july) as July,sum( t.august) as August,sum( t.september) as September,sum( t.october) as October
			 ,sum( t.november) as November,sum( t.december) as December
	   FROM API_Sum_Totamt_Mnthly t
	   left outer join apiaccountmaster_orig a
	        ON t.whaccountid = a.accountno
		    WHERE a.accountno is null and year = @in_year
  
    END







GO
