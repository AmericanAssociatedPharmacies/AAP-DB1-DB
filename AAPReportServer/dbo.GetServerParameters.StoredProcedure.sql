USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetServerParameters]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetServerParameters]
@ServerParametersID nvarchar(32)
AS
DECLARE @now as DATETIME
SET @now = GETDATE()
SELECT Child.Path, Child.ParametersValues, Parent.ParametersValues
FROM [dbo].[ServerParametersInstance] Child
LEFT OUTER JOIN [dbo].[ServerParametersInstance] Parent
ON Child.ParentID = Parent.ServerParametersID
WHERE Child.ServerParametersID = @ServerParametersID 
AND Child.Expiration > @now
GO
