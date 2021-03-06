USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[APIBrandContributions]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[APIBrandContributions]
(@BrandVolume numeric(18,2))
--return the calculated Volume Retained
RETURNS numeric(18,2)
AS
BEGIN

DECLARE @contributions numeric(18,2)
DECLARE @brandPerc float


SET @brandPerc = 0.0025

SET @contributions = @BrandVolume * @brandPerc

RETURN @contributions
END
GO
