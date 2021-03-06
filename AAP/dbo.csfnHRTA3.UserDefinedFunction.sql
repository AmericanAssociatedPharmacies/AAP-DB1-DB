USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[csfnHRTA3]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[csfnHRTA3](@dAmountArg [float], @sAffiliate [nvarchar](4000))
RETURNS [float] WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssfnTiers].[UserDefinedFunctions].[csfnHRTA3]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnHRTA3'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'csfnHRTA3.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnHRTA3'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=9 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'csfnHRTA3'
GO
