USE [AAP]
GO
/****** Object:  View [dbo].[v_SSIS_APIAccountBlankDEA]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_SSIS_APIAccountBlankDEA]
AS
	SELECT     *
	FROM         api.dbo.APIAccountMaster_Orig
	WHERE        dea is null or dea = 'DEA - DEA'


GO
