USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[fColOrder]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
--1,2,3/1/2010 => 1_10_03_2
-- =============================================
CREATE FUNCTION [dbo].[fColOrder]
(
	@iSection int,
	@iColumn int,
	@dt datetime
)
RETURNS varchar(15)
AS
BEGIN
	RETURN right('00' + cast(@iSection as varchar(2)),2) + '_' + right(cast(year(@dt) as varchar(4)),2) 
		+ '_' + right('00' + cast(month(@dt) as varchar(2)),2) + '_' + right('00' + cast(@iColumn as varchar(2)),2)
END
GO
