USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_find_APIAcct_DuplicatePM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's that are in PM twice
-- =============================================
CREATE PROCEDURE [dbo].[sppm_find_APIAcct_DuplicatePM]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
    SELECT t.*
	FROM pharmacymaster..pm_pharmacy  t
	inner join 
	(
		SELECT  apiaccountno
		FROM   pharmacymaster..pm_pharmacy   where apiaccountno != '' and apiaccountno is not null
		GROUP BY  apiaccountno
		HAVING count(*) > 1
	) d on   t.apiaccountno = d.apiaccountno where t.apiaccountno != '' and t.apiaccountno is not null

END










GO
