USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[sploginadd]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/21/2008
-- Description:	Track Logins
-- =============================================
CREATE PROCEDURE [dbo].[sploginadd]
	(
		@username nvarchar(50)
		
	)
AS
BEGIN
	
	SET NOCOUNT ON;

    Insert INTO login (username, logintime) VALUES (@username, getdate())

END
GO
