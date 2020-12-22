USE [API]
GO
/****** Object:  StoredProcedure [Staging].[usp_APISalesDetail_setTypeNull]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2009>
-- Description:	<Weekly  sales for the month by ndc>
-- Edited: <Yodi Haile> rename the sproc name 
-- Date: <03/28/2019>
-- Edited: <Yodi Haile> create new sproc to refere Staging table Per Scott request 
-- Date: <05/10/2019>
-- =============================================
CREATE PROCEDURE [Staging].[usp_APISalesDetail_setTypeNull]
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
        
	update Staging.APISalesDetail  set type = null where type  = ''

	/*
	UPDATE APISalesDetail
	SET Type = NULL 
	WHERE APIItemNbr = 'SHOWCM'
	*/

	END










GO
