USE [SSISDB]
GO
/****** Object:  StoredProcedure [internal].[create_key_information]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [internal].[create_key_information]
	@algorithm_name [nvarchar](255),
	@key [varbinary](8000) OUTPUT,
	@IV [varbinary](8000) OUTPUT
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.Security.CryptoGraphy].[CreateKeyInformation]
GO
