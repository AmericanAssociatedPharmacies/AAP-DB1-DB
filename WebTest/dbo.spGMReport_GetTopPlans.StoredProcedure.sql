USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spGMReport_GetTopPlans]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGMReport_GetTopPlans]
@ncpdp nvarchar(255),
@date smalldatetime

AS
BEGIN

Select top 5 
--PlanName
case when planname is null then
	(select top 1 planname + '*' from GMReport_Plannames p where p.bin=GMTopPlans.bin)
else planname end as PlanName
, BIN,  Claims
---, GM, GMPercent 
,'$' + cast(GM as varchar) as GM
,cast(GMPercent as varchar) + '%' as GMPercent
from GMTopPlans
WHERE PharmID = @ncpdp AND MOnth(currentdt) = Month(@date) AND Year(currentdt) = Year(@date) ORDER BY GMPercent desc
END
GO
