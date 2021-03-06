USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spdocadd]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 10/21/2008
-- Description:	Document information
-- =============================================
CREATE PROCEDURE [dbo].[spdocadd]
	(
		@displayname nvarchar(50),
		@description text,
		@deptid int,
		@catid int,
		@filename nvarchar(100),
		@docsize nvarchar(10),
		@doctype nvarchar(50),
		@uploadedby nvarchar(50)
		
	)
AS

BEGIN
	
	SET NOCOUNT ON;

    Insert INTO documents (displayname,description,deptid,catid,filename,docsize,uploadedby,uploadedon) VALUES (@displayname,@description,@deptid,@catid,@filename,@docsize,@uploadedby,getdate())

END


GO
