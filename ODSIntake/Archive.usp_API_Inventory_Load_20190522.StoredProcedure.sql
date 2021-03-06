USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_API_Inventory_Load_20190522]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Archive].[usp_API_Inventory_Load_20190522]

	@StartDateKey INT
	, @EndDateKey INT

AS

SET NOCOUNT ON;

BEGIN

	SELECT LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC
		, LPORFN, LPORFL, LPLCRE, LPQCYN, LPTDCD, LPHLBA, RowversionID, ETLDateKey, ETLDate, ETLTime
	FROM [Archive].[API_Inventory]
	WHERE ETLDateKey >= @StartDateKey
	AND ETLDateKey < @EndDateKey

END
GO
