USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_clear_research]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 02/13/2013
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spweb_clear_research]
	
AS
BEGIN
	
	SET NOCOUNT ON;	

	DELETE FROM WebDev.dbo.rform_claims_research
END
GO
