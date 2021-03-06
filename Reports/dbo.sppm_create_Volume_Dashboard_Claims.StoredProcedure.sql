USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Volume_Dashboard_Claims]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Volume for Dashboard
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Volume_Dashboard_Claims]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
-- There was bad data in the claims..Rx30Sum6mnth table that's why I did year <= year(getdate()) - it had a claim from 2014 and one from 2029 - so I excluded them

SELECT cast(dbo.MonthFromNumber(month(r.Date)) as varchar(3)) + '-' + cast(year(r.date) as varchar(4)) as Date,TotalScript as [Total Rx30 Scripts],TotalPaid
    as [Total Rx30 Paid] ,c.CPAmount as [Central Pay Total], (TotalPaid /c.CPAmount  ) *100 as [Percent of Central Pay]   from
(
	SELECT sum(TotalScript) as  TotalScript,sum(TotalPaid) as TotalPaid,date   from claims..Rx30Sum6mnth where year <= year(getdate()) group by date
)r 
join 
(
	SELECT sum(Amount) as  CPAmount ,date from centralpay..v_reportPurchasesCP   group by date
) c
on r.date = c.date  order by r.date
END








GO
