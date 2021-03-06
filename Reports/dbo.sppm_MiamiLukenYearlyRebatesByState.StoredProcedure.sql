USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_MiamiLukenYearlyRebatesByState]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/12/2016>
-- Description:	Create Yearly Miami Luken Rebates By State
-- =============================================
CREATE PROCEDURE [dbo].[sppm_MiamiLukenYearlyRebatesByState]
( @in_year varchar(04) )
AS
BEGIN

   DECLARE @SQL varchar(max);

	SET @SQL = 'SELECT round(sum(TotalRebate),2) as  [' + @in_year + ' Total Rebate] ,round(sum(AdminRebate),2) as [ ' +
        @in_year + ' Admin Rebate], ' +
		' round(sum(GenericRebate),2) as [' + @in_year + ' Generic Rebate], ' +
		' State,count(distinct m.PMID) as [Count In State] from pharmacymaster..miamiluken m ' +
		' join ' +
		' ( ' +
		'	SELECT * from pharmacymaster..v_pm_allwithaffiliates ' +
		' )p on m.pmid = p.pmid ' +
		' WHERE year(date) = ' + @in_year + ' GROUP by State ';

	EXEC (@SQL);

END








GO
