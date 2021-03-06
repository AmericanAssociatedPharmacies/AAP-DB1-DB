USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[GlobalReport_KludgeSort]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		BGrant 7/20/10
-- Description:	see spGlobalReport_2
-- =============================================
CREATE FUNCTION [dbo].[GlobalReport_KludgeSort]
(
@pmid int
)
RETURNS int
AS
BEGIN
	declare @ret int	
	select @ret = case when @pmid < 100000 then 200000+@pmid else @pmid end
	
	RETURN @ret

END

GO
