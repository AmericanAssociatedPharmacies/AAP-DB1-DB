USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_WebLogAudit_INSERT]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_WebLogAudit_INSERT] 

	@PMID INT = 0
	, @WebPage VARCHAR(8000) 
    , @Description VARCHAR(1000) 

AS


SET NOCOUNT ON;


BEGIN

	INSERT INTO dbo.WebLogAudit(PMID, WebPage, Description)
	VALUES(@PMID, @WebPage, @Description) 



END

GO
