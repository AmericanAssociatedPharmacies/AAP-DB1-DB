USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spGMReport_GetBottomPlans]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGMReport_GetBottomPlans]
@ncpdp nvarchar(255),
@date smalldatetime
AS
/*
2/1/16 deprecated @date parameter use most current data instead. leaving until calling .cs code can be changed bg
*/

BEGIN
declare @datamonth int
declare @datayear int
select top 1 @datamonth = month(currentdt) from GMBottomPlans order by currentdt desc
select top 1 @datayear = year(currentdt) from GMBottomPlans order by currentdt desc

Select top 5 
--PlanName
case when planname is null then
	(select top 1 planname + '*' from GMReport_Plannames p where p.bin=GMBottomPlans.bin)
else planname end as PlanName
, BIN, Claims
,'$' + cast(GM as varchar) as GM
,cast(GMPercent as varchar) + '%' as GMPercent
--from GMBottomPlans WHERE PharmID = @ncpdp AND MOnth(currentdt) = Month(@date) AND Year(currentdt) = Year(@date)  ORDER BY GMBottomPlans.GMPercent ASC
from GMBottomPlans WHERE PharmID = @ncpdp AND MOnth(currentdt) = @datamonth AND Year(currentdt) = @datayear  ORDER BY cast(GMBottomPlans.GMPercent as decimal(10,2)) ASC

END

--select top 10 * from GMBottomPlans order by currentdt desc
GO
