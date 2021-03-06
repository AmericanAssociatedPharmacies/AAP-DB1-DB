USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[csfnHRTA]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[csfnHRTA](@dAmountArg [float])
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssfnTiers].[UserDefinedFunctions].[csfnHRTA]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnHRTA'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'csfnHRTA.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnHRTA'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnHRTA'
GO
