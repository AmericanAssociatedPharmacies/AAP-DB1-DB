USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_AAPAccount_Delete]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spaap_AAPAccount_Delete]
	@AccountID int
AS

DELETE
FROM
	[dbo].[AAPAccount]
WHERE
	[AccountID] = @AccountID
GO
