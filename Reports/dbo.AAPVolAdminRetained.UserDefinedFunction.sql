USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[AAPVolAdminRetained]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[AAPVolAdminRetained]
(@Volume numeric(18,2),@Affiliate varchar(125))
--return the calculated Volume Retained
RETURNS numeric(18,2)
AS
BEGIN

DECLARE @retained numeric(18,2)
DECLARE @nonAffiliatePoints float
DECLARE @affiliatePoints float
DECLARE @vietnamesePoints float

SET @nonAffiliatePoints = 0.0035
SET @affiliatePoints = 0.0015
SET @vietnamesePoints = .0020
--originally 0

IF @Affiliate = '' or @Affiliate is null set @retained = @Volume * @nonAffiliatePoints
IF @Affiliate != '' and @Affiliate is not null set @retained = @Volume * @affiliatePoints
IF @Affiliate = 'VPhA-USA' set @retained = @Volume * @vietnamesePoints


RETURN @retained
END
GO
