USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[APIGenericContributions]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[APIGenericContributions]
(@GenVolume numeric(18,2))
--return the calculated Volume Retained
RETURNS numeric(18,2)
AS
BEGIN

DECLARE @contributions numeric(18,2)
DECLARE @genPerc float


SET @genPerc = 0.085

SET @contributions = @GenVolume * @genPerc

RETURN @contributions
END
GO
