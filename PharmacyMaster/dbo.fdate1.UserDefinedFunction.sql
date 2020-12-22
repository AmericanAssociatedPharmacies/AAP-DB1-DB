USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[fdate1]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fdate1]
(
	-- Add the parameters for the function here
	@dt datetime
)
RETURNS varchar(6)
AS
BEGIN
RETURN left(datename(mm,@dt),3) + ' ' + right('00' + cast(year(@dt)-2000 as varchar(2)),2)


END
GO
