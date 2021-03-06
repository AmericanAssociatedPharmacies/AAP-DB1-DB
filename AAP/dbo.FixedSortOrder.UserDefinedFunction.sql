USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[FixedSortOrder]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Joni Wilson>
-- Create date: <01/12/2009>
-- Description:	<Create sort order to use for Active ,Inactive,Closed status>
-- =============================================
CREATE FUNCTION [dbo].[FixedSortOrder]

	(@in_status varchar(25))
RETURNS int  
AS
BEGIN
    DECLARE @new_status int;
    
	IF (@in_status = 'ACTIVE' or @in_status = 'active' or @in_status = 'Active')
		BEGIN
			SET @new_status = 0;
		END
  	IF (@in_status = 'INACTIVE' or @in_status = 'inactive' or @in_status = 'Inactive')
		BEGIN
			SET @new_status = 1;
		END
	IF (@in_status = 'CLOSED' or @in_status = 'closed' or @in_status = 'Closed')
		BEGIN
			SET @new_status = 2;
		END
	return @new_status
END
GO
