USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spud_api_sum_totamt_mnthly_select]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	<Select total amount for the month by whacccountid>
-- =============================================
CREATE PROCEDURE [dbo].[spud_api_sum_totamt_mnthly_select]
 ( @in_year varchar(4))
AS
	BEGIN

		SELECT  a.accountname  ,m.whaccountid,a.city as City,a.state,a.territory ,m.january,m.february,m.march,m.april,m.may,m.june
		,m.july,m.august,m.september,m.october,m.november,m.december  FROM API_Sum_Totamt_Mnthly m
		 JOIN apiaccountmaster_orig a
		ON m.whaccountid = a.accountno and year = @in_year
        where year = @in_year  
  
    END







GO
