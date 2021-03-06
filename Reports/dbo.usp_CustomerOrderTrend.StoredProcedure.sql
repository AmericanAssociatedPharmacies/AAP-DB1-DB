USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_CustomerOrderTrend]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CustomerOrderTrend]

	@APINum VARCHAR(9)

AS

SET NOCOUNT ON;

BEGIN

	SELECT API#
	, InvDate
	, InvDateKey
	, OrderType
	, OrderedUnits
	, DailySales
	FROM API.[dbo].[APIDailySummary]
	WHERE [API#] = @APINum

END

GO
