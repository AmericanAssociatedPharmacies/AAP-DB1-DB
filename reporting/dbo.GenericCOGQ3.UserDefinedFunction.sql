USE [reporting]
GO
/****** Object:  UserDefinedFunction [dbo].[GenericCOGQ3]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[GenericCOGQ3](@volume [float])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [SqlServerProject1].[UserDefinedFunctions].[GenericCOGQ3]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'GenericCOGQ3'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'GenericCOGQ3.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'GenericCOGQ3'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'GenericCOGQ3'
GO
