USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Volume_Dashboard_APICS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Volume_Dashboard_APICS]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
SELECT top 10 Sales, drugname    from (
	SELECT   sum(extsales) as Sales , drugname  from api..apisalesdetail a 
	join
	(
		SELECT ndc,drugname from    Medispan..v_DrugMaster_ControlledSubstance where DEA   >= 2
	) m
	on a.ndc= m.ndc
	 where  month(invdate) = 09 and year(invdate) = 2012
	group by drugname  
) ch
order by Sales desc

-- If you group by ndc you will miss some with the same drug name (different sizes - like 100 tablets or 500 tablets) don't know which way is better
-- So I grouped by drug name


--select Cost,ItemDescription,TotalCost, (Cost/TotalCost) * 100 as Percentage from (
--select top 10 Cost, ItemDescription ,
--(
--select sum(cost) from (
--select top 10 Cost, ItemDescription   from (
--select   sum(extsales) as cost , itemdescription from api..apisalesdetail where type = 'generic' and month(invdate) = 09 and year(invdate) = 2012
--group by itemdescription  ) ch
--
--order by cost desc
--)ch1
--
-- ) as TotalCost   
--from (
--select   sum(extsales) as cost , itemdescription from api..apisalesdetail where type = 'generic' and month(invdate) = 09 and year(invdate) = 2012
--group by itemdescription ) ch  
--order by cost desc
--
--) tmp
END








GO
