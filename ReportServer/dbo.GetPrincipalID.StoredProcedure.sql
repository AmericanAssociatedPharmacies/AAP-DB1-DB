USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetPrincipalID]    Script Date: 12/22/2020 5:04:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- looks up a principal, if not there looks up regular users and turns them into principals
-- if not, it creates a principal
CREATE PROCEDURE [dbo].[GetPrincipalID]
@UserSid varbinary(85) = NULL,
@UserName nvarchar(260),
@AuthType int,
@UserID uniqueidentifier OUTPUT
AS
-- windows auth
IF @AuthType = 1
BEGIN
    -- is this a principal?
    SELECT @UserID = (SELECT UserID FROM Users WHERE Sid = @UserSid AND UserType = 1 AND AuthType = @AuthType)
END
ELSE
BEGIN
    -- is this a principal?
    SELECT @UserID = (SELECT UserID FROM Users WHERE UserName = @UserName AND UserType = 1 AND AuthType = @AuthType)
END
IF @UserID IS NULL
   BEGIN
        IF @AuthType = 1 -- Windows
        BEGIN
            -- Is this a regular user
            SELECT @UserID = (SELECT UserID FROM Users WHERE Sid = @UserSid AND UserType = 0 AND AuthType = @AuthType)
        END
        ELSE
        BEGIN
            -- Is this a regular user
            SELECT @UserID = (SELECT UserID FROM Users WHERE UserName = @UserName AND UserType = 0 AND AuthType = @AuthType)
        END
      -- No, create a new principal
      IF @UserID IS NULL
         BEGIN
            SET @UserID = newid()
            INSERT INTO Users
            (UserID, Sid,   UserType, AuthType, UserName)
            VALUES 
            (@UserID, @UserSid, 1,    @AuthType, @UserName)
         END 
      ELSE
         BEGIN
             UPDATE Users SET UserType = 1 WHERE UserID = @UserID
         END
    END
GO
