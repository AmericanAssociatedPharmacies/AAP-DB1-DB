USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[AAPGenAdminRetained]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AAPGenAdminRetained]
(@SRCVolume numeric(18,2),@Affiliate varchar(125))
--return the calculated Volume Retained
RETURNS numeric(18,2)
AS
BEGIN

DECLARE @retained numeric(18,2)
DECLARE @nonPIPCOPoints float
DECLARE @PIPCOPoints float

SET @nonPIPCOPoints = 0.025
SET @PIPCOPoints = 0.020


IF @Affiliate = '' or @Affiliate is null SET @retained = @SRCVolume * @nonPIPCOPoints
IF @Affiliate != '' and @Affiliate is not null SET @retained = @SRCVolume * @nonPIPCOPoints
IF @Affiliate = 'PIPCO' SET @retained = @SRCVolume * @PIPCOPoints


RETURN @retained
END
GO
