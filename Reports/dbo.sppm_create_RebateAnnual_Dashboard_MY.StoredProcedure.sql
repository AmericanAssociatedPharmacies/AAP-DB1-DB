USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_RebateAnnual_Dashboard_MY]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/09/2015>
-- Description:	Create query for Annual Rebates for Dashboard 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_RebateAnnual_Dashboard_MY]
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SQL varchar(max);
	DECLARE @Month varchar(2);
	DECLARE @Year varchar(4);
	DECLARE @prevYear varchar(4);

	
	SET @SQL = 'SELECT * from ( ';

	SET @Year =  (SELECT max(year )   from pharmacymaster..PM_AnnualRebates );
  
	SET @prevYear = @Year - 1;
  
--		SELECT count(*) as AAPMemberCount from pharmacymaster..pm_pharmacy where aapaccountno is not null and  aapaccountno != ''    and aapquitdate is null

   SELECT * FROM (
	SELECT  Year,'GenericIncentive' as ColumnName,sum(GenericIncentive) as Total
 	 from pharmacymaster..PM_AnnualRebates where  year in (@Year,@prevYear) group by year
     UNION
	 SELECT Year,'PatronageDividend'  as ColumnName, sum(PatronageDividend) as Total from pharmacymaster..PM_AnnualRebates where 
       year in (@Year,@prevYear) group by year
    UNION
	SELECT Year,'PlanOGramRebate'   as ColumnName, sum(PlanOGramRebate) as Total from pharmacymaster..PM_AnnualRebates where 
      year in (@Year,@prevYear) group by year

    UNION
	SELECT Year,'MasonRebate'   as ColumnName, sum(MasonRebate) as Total from pharmacymaster..PM_AnnualRebates where 
      year in (@Year,@prevYear) group by year
)CH ORDER by Year

 
END








GO
