USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[PatDivFunction]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[PatDivFunction](@effectiveDate [sql_variant], @quitDate [sql_variant], @type [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [Functions].[UserDefinedFunctions].[PatDivFunction]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'PatDivFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'PatDivFunction.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'PatDivFunction'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=13 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'PatDivFunction'
GO
