USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_Volume_Dashboard_Top10_test]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_Volume_Dashboard_Top10_test]
(@in_month varchar(02),@in_year varchar(04),@in_type varchar (50))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
DECLARE @date varchar(10);
SET @date = @in_month + '/01/' + @in_year;

IF(@in_type = 'APIGeneric')
BEGIN
	INSERT into DashboardTop10_test
	SELECT top 10 @date as Date,'APIGeneric' as Type, Sales, DrugName   from (
		SELECT   sum(extsales) as Sales , DrugName  from api..apisalesdetail a 
		join
		(
			SELECT ndc,drugname from   Medispan..v_DrugMaster_ControlledSubstance 
		) m
		on a.ndc= m.ndc
		 where type = 'Generic' and month(invdate) = @in_month and year(invdate) = @in_year
		group by drugname  
	) ch
	order by Sales desc
END

IF(@in_type = 'APIBrand')
BEGIN
	INSERT into DashboardTop10_test
	SELECT top 10 @date as Date,'APIBrand' as Type, Sales, DrugName   from (
		SELECT   sum(extsales) as Sales , DrugName  from api..apisalesdetail a 
		join
		(
			SELECT ndc,drugname from   Medispan..v_DrugMaster_ControlledSubstance 
		) m
		on a.ndc= m.ndc
		 where type = 'Brand' and month(invdate) = @in_month and year(invdate) = @in_year
		group by drugname  
	) ch
	order by Sales desc
END


IF(@in_type = 'CardBrand')
BEGIN
	INSERT into DashboardTop10_test
	SELECT top 10 @date as Date,'CardBrand' as Type, Sales, DrugName  from (
	SELECT   sum(ext_cost) as Sales , drugname  from purchases..chph_aap c
	join
	(
		SELECT ndc,drugname from   Medispan..v_DrugMaster_ControlledSubstance 
	) m
	on c.ndc= m.ndc
	 where  brand = 'B'   and month(inv_date) = @in_month and year(inv_date) = @in_year
	and PMID is not null and PMID != ''
	group by drugname  
)ch
order by Sales desc
END

IF(@in_type = 'CardGeneric')
BEGIN
	INSERT into DashboardTop10_test
	SELECT top 10 @date as Date,'CardGeneric' as Type, Sales, DrugName  from (
	SELECT   sum(ext_cost) as Sales , drugname  from purchases..chph_aap c
	join
	(
		SELECT ndc,drugname from   Medispan..v_DrugMaster_ControlledSubstance 
	) m
	on c.ndc= m.ndc
	 where brand = 'N' and item_type = 'RX'  and month(inv_date) = @in_month and year(inv_date) = @in_year
	and PMID is not null and PMID != ''
	group by drugname  
)ch
order by Sales desc
END
 
IF(@in_type = 'APIDEA2')
BEGIN
INSERT into DashboardTop10_test
SELECT top 10 @date as Date,'APIDEA2' as Type,Sales, DrugName    from (
	SELECT   sum(extsales) as Sales , drugname  from api..apisalesdetail a 
	join
	(
		SELECT ndc,drugname from    Medispan..v_DrugMaster_ControlledSubstance where DEA   = 2
	) m
	on a.ndc= m.ndc
	 where  month(invdate) = @in_month and year(invdate) = @in_year
	group by drugname  
) ch
order by Sales desc
END

IF(@in_type = 'APIDEA35')
BEGIN
INSERT into DashboardTop10_test
SELECT top 10 @date as Date,'APIDEA35' as Type,Sales, DrugName    from (
	SELECT   sum(extsales) as Sales , drugname  from api..apisalesdetail a 
	join
	(
		SELECT ndc,drugname from    Medispan..v_DrugMaster_ControlledSubstance where DEA   >= 3
	) m
	on a.ndc= m.ndc
	 where  month(invdate) = @in_month and year(invdate) = @in_year
	group by drugname  
) ch
order by Sales desc
END


IF(@in_type = 'CardDEA2')
BEGIN
INSERT into DashboardTop10_test
SELECT top 10 @date as Date,'CardDEA2' as Type,Sales,drugname from (
	SELECT   sum(ext_cost) as Sales , drugname  from purchases..chph_aap c
	join
	(
		SELECT ndc,drugname from   Medispan..v_DrugMaster_ControlledSubstance where DEA  = 2
	) m
	on c.ndc= m.ndc
	 where    month(inv_date) = @in_month and year(inv_date) = @in_year
	and PMID is not null and PMID != ''
	group by drugname  
)ch
order by Sales desc
END

IF(@in_type = 'CardDEA35')
BEGIN
INSERT into DashboardTop10_test
SELECT top 10 @date as Date,'CardDEA35' as Type,Sales,drugname from (
	SELECT   sum(ext_cost) as Sales , drugname  from purchases..chph_aap c
	join
	(
		SELECT ndc,drugname from   Medispan..v_DrugMaster_ControlledSubstance where DEA  >= 3
	) m
	on c.ndc= m.ndc
	 where    month(inv_date) = @in_month and year(inv_date) = @in_year
	and PMID is not null and PMID != ''
	group by drugname  
)ch
order by Sales desc
END

END








GO
