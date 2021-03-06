USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[csfnPatDivDate]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[csfnPatDivDate](@sqlTranDate [datetime], @sqlEffDate [datetime], @sqlQuitdate [datetime], @iPatDivYear [int])
RETURNS [bit] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssUDDW1Reports].[UserDefinedFunctions].[csfnPatDivDate]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnPatDivDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'csfnPatDivDate.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnPatDivDate'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=15 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnPatDivDate'
GO
