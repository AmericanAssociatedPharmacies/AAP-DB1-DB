USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnWebUserDescription]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		B.Grant
-- Create date: 3/20/12
-- Description:	website logged in member description see v_web_userdata. removed Elite 7/27/16 belatedly
-- =============================================
CREATE FUNCTION [dbo].[fnWebUserDescription]
(
	@accountname varchar(100),
	@city varchar(50),
	@state varchar(20)
	,@isElite int --deprecated
)
RETURNS varchar(255)
AS
BEGIN
	DECLARE @desc varchar(255)

	set @desc = @accountname + '<br />' + @city 
	+ case when @city is null then '' else ', ' end 
	+ @state + '<br />' 
	--+ case when @isElite = 1 then 'AAP Elite Member<br />' else '' end 

	RETURN @desc

END

GO
