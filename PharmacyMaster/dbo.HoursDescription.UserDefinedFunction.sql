USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[HoursDescription]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		B.Grant
-- Create date: 4/20/11
-- Description:	Store hours text string for compatibility with old HOURS field
-- =============================================
CREATE FUNCTION [dbo].[HoursDescription]
(
	@pmid int
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @ret varchar(255)
	select @ret = 
	  (case when storehours_MondayFridayAM is null then ''
		else 'Mon-Fri ' + storehours_MondayFridayAM + ' - ' + storehours_MondayFridayPM end)
	+ (case when StoreHours_SaturdayAM is null then ''
		else ', Sat ' + StoreHours_SaturdayAM + ' - ' + StoreHours_SaturdayPM end)
	+ (case when StoreHours_SundayAM is null then ''
		else ', Sun ' + StoreHours_SundayAM + ' - ' + StoreHours_SundayPM end)
	+ (case when StoreHours_HolidayAM is null then ''
		else ', Holidays ' + StoreHours_HolidayAM + ' - ' + StoreHours_HolidayPM end)
	from pm_pharmacy where pmid=@pmid

	RETURN @ret
END
GO
