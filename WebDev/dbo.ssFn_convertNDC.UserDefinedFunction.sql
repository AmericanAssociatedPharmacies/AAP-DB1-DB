USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[ssFn_convertNDC]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[ssFn_convertNDC](@sNDCIn [nvarchar](4000))
RETURNS [nvarchar](4000) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ssFnWebdev].[UserDefinedFunctions].[ssFn_convertNDC]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ssFn_convertNDC'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'ssFn_convertNDC.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ssFn_convertNDC'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=14 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'ssFn_convertNDC'
GO
