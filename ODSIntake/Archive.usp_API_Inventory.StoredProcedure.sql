USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_API_Inventory]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Archive].[usp_API_Inventory]

	@RowVersionID VARCHAR(1000)


AS

SET NOCOUNT ON;

BEGIN

	DECLARE @varRowverID VARBINARY(8)

	SET @varRowverID = CONVERT(VARBINARY(8), @RowVersionID, 1);

	
	SELECT LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC, LPORFN, LPORFL
	, LPLCRE, LPQCYN, LPTDCD, LPHLBA, RowversionID, ETLDateKey, ETLDate, ETLTime
	FROM [Archive].[API_Inventory]
	WHERE [RowversionID] > @varRowverID






END
GO
