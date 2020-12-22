USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spoutadd]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/24/2008
-- Description:	Document information
-- =============================================
CREATE PROCEDURE [dbo].[spoutadd]
	(
		@username nvarchar(50),
		@comments text,		
		@statusid int,
		@fromdate smalldatetime,
		@todate smalldatetime
		
	)

AS

BEGIN
	
	SET NOCOUNT ON;

	/*select @fromdate = CAST(FLOOR( CAST( @fromdate AS FLOAT ) )AS DATETIME	)
	select @todate = CAST(FLOOR( CAST( @todate AS FLOAT ) )AS DATETIME	)*/
	
	

    Insert INTO outnabout (username,notes, status, fromdt, todt,createdon) VALUES (@username,@comments,@statusid,  CAST(FLOOR( CAST( @fromdate AS FLOAT ) )AS DATETIME	),  CAST(FLOOR( CAST( @todate AS FLOAT ) )AS DATETIME	), getdate())

END



GO
