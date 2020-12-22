USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[fdate4]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fdate4]
(
	-- Add the parameters for the function here
	@dt datetime
)
RETURNS varchar(8)
AS
BEGIN
RETURN left(datename(mm,@dt),3)   + ' ' + cast(year(@dt)  as varchar(4)) 


END
GO
