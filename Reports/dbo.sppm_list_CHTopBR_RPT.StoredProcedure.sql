USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_CHTopBR_RPT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/05/2011>
-- Description:	List the top 300 BR from Cardinal Purchases
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_CHTopBR_RPT]
(@in_months varchar(100),@in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL varchar(500);


	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_TopBrand')
	 BEGIN
      DROP TABLE tmp_TopBrand
     END

	SET @SQL = ' SELECT * into tmp_TopBrand from  '+
	'( '+
		' SELECT  * from ( '+
			' SELECT distinct NDC,max(Item_DESCR) as Description,Vendor_Name as Manufacturer , Strength,cast(null as float) as Size, sum(cast(Ship_QTY as int) ) as [Qty Purchased],sum(ext_cost) as Cost from purchases..chph_aap '+
			' where month(inv_date) in ' + @in_months  + ' and year(inv_date) = ' + @in_year + '  and Brand = ''B'' and PMID is not null and PMID != '''' group by NDC,Strength ,Vendor_Name '+
		' ) ch   '+
	' )tmp  ';

   	EXEC (@SQL);
    print @SQL;
	UPDATE  su  set 
		size =  ch.ps   
	FROM tmp_TopBrand    su 
	inner join 
		( select ndc,ps from Medispan..v_DrugMaster  ) ch
	on su.ndc = ch.ndc   


    SELECT NDC,Description,Manufacturer,cast(Size as varchar(50)) as Size, [Qty Purchased], Cost   FROM  tmp_TopBrand;


END










GO
