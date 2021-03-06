USE [ODSIntake]
GO
/****** Object:  View [dbo].[vwAPIInventory]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[vwAPIInventory]

AS

SELECT RowID
, LPSROM
, LPLZON
, LPLCID
, LPPRDC
, LPBATC
, LPFPUT
, LPLPUT
, LPLOQT
, LPPIQT
, LPSTTC
, LPLIST
, LPPIPR
, LPPUPR
, LPSDAT
, LPLOCT
, LPRQNC
, LPUQNC
, LPNCCN
, LPSENC
, LPORFN
, LPORFL
, LPLCRE
, LPQCYN
, LPTDCD
, LPHLBA
, CONVERT(INT, CONVERT(varchar(20), [RowCreatedDate],112)) AS ETLDateKey
, CONVERT(DATE, [RowCreatedDate]) AS ETLDate
, CONVERT(TIME, [RowCreatedDate]) AS ETLTime
, CONVERT(VARBINARY(8), RowVersionID) AS RowVersionID
 FROM [Staging].[API_Inventory]




GO
