USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_CHTop400BR_RPT2]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Chris McKinnie (updated from Joni Wilson)>
-- Create date: <05/22/2017>
-- Description:	List the top 400 BR from Cardinal Purchases
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_CHTop400BR_RPT2]
	-- Add the parameters for the stored procedure here
	(@in_months1 varchar(100),@in_year1 varchar(4),@in_months2 varchar(100),@in_year2 varchar(4),@in_isPrevious varchar(1))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQL varchar(500);


	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_Top400Brand')
	 BEGIN
      DROP TABLE tmp_Top400Brand
     END

	SET @SQL = ' SELECT * into tmp_Top400Brand from  '+
	'( '+
		' SELECT top 400 * from ( '+
			' SELECT distinct NDC,max(Item_DESCR) as Description,Strength,cast(null as float) as Size, sum(cast(Ship_QTY as int) ) as [Qty Purchased],sum(ext_cost) as Cost from purchases..chph_aap ';
	IF (@in_isPrevious = '0')
		BEGIN 
          SET @SQL = @SQL +	' where month(inv_date) in (' + @in_months1  + ') and year(inv_date) = ' + @in_year1 + '  and Brand = ''B'' and PMID is not null and PMID != '''' group by NDC,Strength  ';

		END
    ELSE
        BEGIN
		  SET @SQL = @SQL +	' where ((month(inv_date) in (' + @in_months1  + ') and year(inv_date) = ' + @in_year1 +  ') or (month(inv_date) in (' + @in_months2  + ') and year(inv_date) = ' + @in_year2 + '))  and Brand = ''B'' and PMID is not null and PMID != '''' group by NDC,Strength ';
        END

     SET @SQL = @SQL +' ) ch order by cost desc  '+
	' )tmp  ';

  EXEC (@SQL);
    print @SQL;
	UPDATE  su  set 
		size =  ch.ps   
	FROM tmp_Top400Brand    su 
	inner join 
		( select ndc,ps from Medispan..v_DrugMaster  ) ch
	on su.ndc = ch.ndc   


   SELECT NDC,Description,cast(Size as varchar(50)) as Size, [Qty Purchased], Cost   FROM  tmp_Top400Brand;


END




GO
