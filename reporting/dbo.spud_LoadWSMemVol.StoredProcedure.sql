USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadWSMemVol]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/16/2008
-- Description:	CREATE ACTIVE WHOLESALE MEMBERS TABLE AND FILTER LATEST VOLUME DATA FOR WHOLESALE YY MONTHLY COMPARISON REPORT
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadWSMemVol] 
	
AS
BEGIN

	SET NOCOUNT ON;

    Delete from tmp_wsvolume
	
	--Insert All active members
	INSERT INTO tmp_wsvolume (ACCT_NO, type, EFFECTIVE, STORE, CITY, STATE, NSTERRITORY)  (Select ACCT_NO, type, EFFECTIVE, STORE, CITY, STATE, NSTERRITORY FROM v_ws_member)   



END






GO
