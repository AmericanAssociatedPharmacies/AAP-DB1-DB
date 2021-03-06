USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[csfnRangeString2]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[csfnRangeString2](@dAmountArg [float], @dRangeAmount [float], @dMinAmount [float], @imode [int])
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssfnTiers].[UserDefinedFunctions].[csfnRangeString2]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnRangeString2'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'csfnRangeString2.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnRangeString2'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnRangeString2'
GO
