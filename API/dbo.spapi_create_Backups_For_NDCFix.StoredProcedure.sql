USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_create_Backups_For_NDCFix]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Remove duplicates from StoreMember for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[spapi_create_Backups_For_NDCFix]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
 
 

	SELECT * into api..tmp_APISalesDetailBKP_02112013 from api..APISalesDetail
 
  
END








GO
