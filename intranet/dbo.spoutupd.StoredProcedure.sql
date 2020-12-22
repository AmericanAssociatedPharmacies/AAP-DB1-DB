USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spoutupd]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/24/2008
-- Description:	Document information
-- =============================================
CREATE PROCEDURE [dbo].[spoutupd]
	(
		@id int,
		@comments text,		
		@statusid int,
		@fromdate datetime,
		@todate datetime
		
	)

AS

BEGIN
	
	SET NOCOUNT ON;
	
	UPDATE outnabout 
				SET notes = @comments,
					status = @statusid,
					fromdt = @fromdate,
					todt = @todate
	WHERE outid = @id



END



GO
