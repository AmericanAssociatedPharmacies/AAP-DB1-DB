USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[csfnRank1]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[csfnRank1](@dAmount [float], @dRankAmount [float])
RETURNS [int] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssfnRank1].[UserDefinedFunctions].[csfnRank1]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnRank1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'csfnRank1.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnRank1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnRank1'
GO
