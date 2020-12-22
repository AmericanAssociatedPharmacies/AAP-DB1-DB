USE [TempTables]
GO
/****** Object:  UserDefinedFunction [dbo].[fnStripAddressBG1]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fnStripAddressBG1](@sInput [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssHayes1].[UserDefinedFunctions].[fnStripAddressBG1]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnStripAddressBG1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'fnHayes1.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnStripAddressBG1'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=10 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnStripAddressBG1'
GO
