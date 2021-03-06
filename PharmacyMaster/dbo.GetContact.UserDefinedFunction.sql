USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[GetContact]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		BG
-- Create date: 
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[GetContact] 
(
	-- GetContact(contactfullname,contactfirst,contactlast)
	@cfn varchar(255),@cf varchar(255),@cl varchar(255)
)
RETURNS varchar(255)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result varchar(255)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = isnull(case 
		when @cfn is null then @cf + ' ' + @cl
		else @cfn
		end,'')

	-- Return the result of the function
	RETURN @Result

END
GO
