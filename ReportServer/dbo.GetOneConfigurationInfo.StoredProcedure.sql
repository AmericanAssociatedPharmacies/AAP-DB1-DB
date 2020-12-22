USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetOneConfigurationInfo]    Script Date: 12/22/2020 5:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOneConfigurationInfo]
@Name nvarchar (260)
AS
SELECT [Value]
FROM [ConfigurationInfo]
WHERE [Name] = @Name
GO
