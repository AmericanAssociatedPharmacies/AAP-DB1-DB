USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[APIOTCContributions]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[APIOTCContributions]
(@OTCVolume numeric(18,2))
--return the calculated Volume Retained
RETURNS numeric(18,2)
AS
BEGIN

DECLARE @contributions numeric(18,2)
DECLARE @OTCPerc float


SET @OTCPerc = 0.07

SET @contributions = @OTCVolume * @OTCPerc

RETURN @contributions
END
GO
