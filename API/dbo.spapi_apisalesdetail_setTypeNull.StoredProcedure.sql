USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_apisalesdetail_setTypeNull]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2009>
-- Description:	<Weekly  sales for the month by ndc>
-- =============================================
CREATE PROCEDURE [dbo].[spapi_apisalesdetail_setTypeNull]
AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
        
	update APISalesDetail  set type = null where type  = ''

	/*
	UPDATE APISalesDetail
	SET Type = NULL 
	WHERE APIItemNbr = 'SHOWCM'
	*/

	END










GO
