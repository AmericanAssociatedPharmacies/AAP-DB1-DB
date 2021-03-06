USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spdocupd]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/21/2008
-- Description:	Document information
-- =============================================
CREATE PROCEDURE [dbo].[spdocupd]
	(
		@id int,
		@displayname nvarchar(50),
		@description text,
		@deptid int,
		@catid int,		
		@updatedby nvarchar(50)
		
	)
AS

BEGIN
	
	SET NOCOUNT ON;

    Update documents
		Set displayname = @displayname,
			description = @description,
			deptid = @deptid,
			catid = @catid,
			updatedby = @updatedby,
			updatedon = getdate()

	Where docid=@id

END

GO
