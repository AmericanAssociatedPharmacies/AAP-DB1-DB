USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_CAPurchasesByNDC]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create report for Cardinal  purchases By NDC
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_CAPurchasesByNDC]
(@in_month varchar(02), @in_year varchar(04))
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_CA_jmw')
	 BEGIN
	  DROP TABLE tmp_CA_jmw
	 END
 
	 SELECT * into tmp_CA_jmw from (
		SELECT distinct   c.NDC, item_no as CIN# ,max(Item_DESCR) as Description, Size, cast(sum(Ship_QTY)as int) as [Total Qty Purchased]
		,  sum(EXT_COST)   as [Total $ Purchased]
			from purchases..chph_aap c
		left outer join
			(

			select  ndc, ps  as  Size from Medispan..v_DrugMaster_ControlledSubstance  
			) r
		 on c.ndc = r.ndc

		where month(inv_date) = @in_month and year(inv_date) = @in_year and
		c.PMID is not null and c.PMID != ''     group by c.NDC ,item_no,r.size
  ) ch	
   
     SELECT * from tmp_CA_jmw  

 
END








GO
