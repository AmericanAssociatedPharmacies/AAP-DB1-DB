USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[FindObjectsNonRecursive]    Script Date: 12/22/2020 5:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindObjectsNonRecursive]
@Path nvarchar (425),
@AuthType int
AS
SELECT 
    C.Type,
    C.PolicyID,
    SD.NtSecDescPrimary,
    C.Name, 
    C.Path, 
    C.ItemID,
    DATALENGTH( C.Content ) AS [Size],
    C.Description,
    C.CreationDate, 
    C.ModifiedDate,
    SUSER_SNAME(CU.Sid), 
    CU.[UserName],
    SUSER_SNAME(MU.Sid),
    MU.[UserName],
    C.MimeType,
    C.ExecutionTime,
    C.Hidden, 
    C.SubType,
    C.ComponentID
FROM
   Catalog AS C 
   INNER JOIN Catalog AS P ON C.ParentID = P.ItemID
   INNER JOIN Users AS CU ON C.CreatedByID = CU.UserID
   INNER JOIN Users AS MU ON C.ModifiedByID = MU.UserID
   LEFT OUTER JOIN SecData SD ON C.PolicyID = SD.PolicyID AND SD.AuthType = @AuthType
WHERE P.Path = @Path
GO
