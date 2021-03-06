USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[HighVolPaidToAffCalc]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[HighVolPaidToAffCalc]
(@HighVol numeric(18,2),@PaidToAFF numeric(18,2)) 
--return the calculated Volume Retained
RETURNS numeric(18,2)
AS
BEGIN

DECLARE @ReturnVal numeric(18,2)
--
--IF (@HighVol is null)
--	BEGIN
--		SET @ReturnVal = isnull(@PaidToAFF,0)  
--	END
-- 
--ELSE 
--	BEGIN
		SET @ReturnVal =  isnull(@HighVol,0) + isnull(@PaidToAFF,0)  
--	END

RETURN @ReturnVal
END
GO
