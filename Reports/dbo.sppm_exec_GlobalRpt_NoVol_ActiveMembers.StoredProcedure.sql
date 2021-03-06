USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_exec_GlobalRpt_NoVol_ActiveMembers]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create Monthly Global Report
-- =============================================
CREATE PROCEDURE [dbo].[sppm_exec_GlobalRpt_NoVol_ActiveMembers]
(@in_month varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

	DECLARE @SQL   varchar(5000);
    DECLARE @MonthActive    varchar(50);

	SET @MonthActive = substring(@in_month,len(@in_month) -1,2);
	--SET @SQL = ' SELECT * from ' + @in_TableName + '  where [AAP#] is not null and ' +
	--		   ' ( [AAP Quit Date] is null or [AAP Quit Date] > ''' + @MonthActive + '/' + dbo.DaysInMonth(@MonthActive,@in_year) + '/' + @in_year + ''') and ' +
	--           ' [AAP Eff. Date] <= ''' + @MonthActive + '/' + dbo.DaysInMonth(@MonthActive,@in_year) + '/' + @in_year + '''';

	--SET @SQL = 'SELECT * from ' + @in_TableName + ' where [AAP#] is not null and [AAP Quit Date] is null order by  dbo.GlobalReport_KludgeSort(pmid)';

	SELECT p.PMID,p.AAPAccountNo as AAP#,p.AAPParentNo as Parent#,p.APIAccountNo as API#,p.AAPEffectiveDate as [AAP Eff. Date],p.AAPQuitDate as [AAP Quit Date],
		p.AccountDescription as Description,p.AccountName as [Account DBA Name],
		p.Territory as TM,p.City ,p.State as ST from pharmacymaster..v_PM_AllWithAffiliates p
		left outer join 
		(select * from pharmacymaster..all_volume where month(date) = 11 and year(date) = 2010 ) v
		on p.pmid = v.pmid
		where p.aapaccountno is not null and  p.aapaccountno != '' and
		( p.aapquitdate is null or p.aapquitdate >    + @MonthActive + '/' + dbo.DaysInMonth(@MonthActive,@in_year) + '/' + @in_year ) and
		p.aapeffectivedate <= + @MonthActive + '/' + dbo.DaysInMonth(@MonthActive,@in_year) + '/' + @in_year and v.pmid is null
		order by p.state
	--EXEC (@SQL);

END










GO
