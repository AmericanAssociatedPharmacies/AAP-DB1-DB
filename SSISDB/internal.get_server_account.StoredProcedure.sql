USE [SSISDB]
GO
/****** Object:  StoredProcedure [internal].[get_server_account]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [internal].[get_server_account]
	@account_name [internal].[adt_name] OUTPUT
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [ISSERVER].[Microsoft.SqlServer.IntegrationServices.Server.ServerApi].[GetServerAccount]
GO
