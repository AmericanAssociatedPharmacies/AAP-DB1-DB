USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_loginDescription_byPMID]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		B.Grant
-- Create date: 11/2012
-- Description:	Return description to website. PMID can return more than one login
-- =============================================
CREATE PROCEDURE [dbo].[spweb_loginDescription_byPMID]
	@PMID int
AS
BEGIN
	SET NOCOUNT ON;
select top 1 * from v_web_userdata u
--where u.defaultpmid=@PMID
where u.PMID=@PMID
return 0
END

GO
