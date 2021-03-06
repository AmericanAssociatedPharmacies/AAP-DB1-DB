USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_CAGenericByNDC]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create report for Cardinal Generic By NDC
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_CAGenericByNDC]
(@in_month varchar(02), @in_year varchar(04))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_CAGen_jmw')
	 BEGIN
	  DROP TABLE tmp_CAGen_jmw
	 END
 
	 SELECT * into tmp_CAGen_jmw from (
		SELECT distinct NDC,max(Item_DESCR) as Description,  cast(sum(Ship_QTY)as int) as [Qty Purchased],sum(ext_cost) as [Generic Sales] from purchases..chph_aap 
		where month(inv_date) = @in_month and year(inv_date) = @in_year and brand = 'N' and item_type = 'RX'and PMID is not null and PMID != ''     group by NDC 
	 ) ch	
   
     SELECT * from tmp_CAGen_jmw order by [Generic Sales] desc

 
END








GO
