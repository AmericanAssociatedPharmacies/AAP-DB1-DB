USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_list_GroupNoExceptions]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <06/16/2011>
-- Description:	Exceptions for Groups
-- =============================================
CREATE PROCEDURE [dbo].[sppm_list_GroupNoExceptions]
 

AS
BEGIN

	SELECT  * FROM PMGroupNoExceptions order by  VerifiedAsOK
	 
	
END










GO
