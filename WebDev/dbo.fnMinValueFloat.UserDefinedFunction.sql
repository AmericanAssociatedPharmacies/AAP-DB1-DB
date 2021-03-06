USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[fnMinValueFloat]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnMinValueFloat]
(@Param1 Float, @Param2 Float)
RETURNS float
AS
BEGIN
IF (@Param1 is null and @Param2 is null)
	return NULL
if (@Param1 is null)
	return @Param2
if (@Param2 is null)
	return @Param1
Return(Select Case When @Param1 < @Param2 
                   Then @Param1 Else @Param2 End MinValue)END
GO
