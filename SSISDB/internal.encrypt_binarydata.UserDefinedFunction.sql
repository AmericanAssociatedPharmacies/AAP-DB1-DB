USE [SSISDB]
GO
/****** Object:  UserDefinedFunction [internal].[encrypt_binarydata]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [internal].[encrypt_binarydata](@algorithmName [nvarchar](255), @key [varbinary](8000), @IV [varbinary](8000), @binary_value [varbinary](max))
RETURNS [varbinary](max) WITH EXECUTE AS CALLER
AS 
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.Security.CryptoGraphy].[EncryptBinaryData]
GO
