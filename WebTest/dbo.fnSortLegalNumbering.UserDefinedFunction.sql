USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSortLegalNumbering]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[fnSortLegalNumbering](@sInput [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssSortLegalNumbering].[UserDefinedFunctions].[fnSortLegalNumbering]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnSortLegalNumbering'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'ssSortLegalNumbering.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnSortLegalNumbering'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=10 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'fnSortLegalNumbering'
GO
