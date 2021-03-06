USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmPageStatisticsInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmPageStatisticsInsert]
		@Path [varchar](255),
		@QueryString [varchar](1024),
		@RequestType [varchar](4),
		@ElapsedTime [int],
		@UserAgent [varchar](255),
		@UserHostAddress [varchar](39)
	AS
	BEGIN
		SET NOCOUNT ON;

		INSERT INTO dmPageStatistics ([Path],[QueryString],[RequestType],[ElapsedMilliseconds],[UserAgent],[UserHostAddress])
		VALUES (@Path,@QueryString,@RequestType,@ElapsedTime,@UserAgent,@UserHostAddress)
	END
GO
