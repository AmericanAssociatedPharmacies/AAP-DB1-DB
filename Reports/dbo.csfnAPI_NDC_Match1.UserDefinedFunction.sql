USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[csfnAPI_NDC_Match1]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[csfnAPI_NDC_Match1](@_NDC [nvarchar](4000), @_imode [int])
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssUDDW1Reports].[UserDefinedFunctions].[csfnAPI_NDC_Match1]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnAPI_NDC_Match1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'csfnAPINDCMatch.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnAPI_NDC_Match1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=12 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnAPI_NDC_Match1'
GO
