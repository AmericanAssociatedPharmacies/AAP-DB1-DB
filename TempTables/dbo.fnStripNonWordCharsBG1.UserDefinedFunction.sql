USE [TempTables]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStripNonWordCharsBG1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fnStripNonWordCharsBG1](@sInput [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssHayes1].[UserDefinedFunctions].[fnStripNonWordCharsBG1]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnStripNonWordCharsBG1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'fnHayes1.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnStripNonWordCharsBG1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=28 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnStripNonWordCharsBG1'
GO
