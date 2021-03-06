USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[DrugsComURLFromName]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[DrugsComURLFromName](@sDrugNameArg [nvarchar](4000), @bReportErrors [bit])
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SSFunctionsUDDW1Reporting1].[UserDefinedFunctions].[DrugsComURLFromName]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'DrugsComURLFromName'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'DrugsComURLFromName.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'DrugsComURLFromName'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'DrugsComURLFromName'
GO
