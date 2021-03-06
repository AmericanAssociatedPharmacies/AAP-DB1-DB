USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[NewPatDiv]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[NewPatDiv](@effMonthIn [int], @effYearIn [int], @quitMonthIn [int], @quitYearIn [int], @type [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [Functions].[UserDefinedFunctions].[NewPatDiv]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'NewPatDiv'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'NewPatDiv.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'NewPatDiv'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=11 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'NewPatDiv'
GO
