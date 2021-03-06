USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[uspSwitchDataCardinalComplete_backup_CH30]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspSwitchDataCardinalComplete_backup_CH30]

AS

SET NOCOUNT ON;

BEGIN

	TRUNCATE TABLE [Archive].[CardinalComplete];

	ALTER TABLE [dbo].[CardinalComplete]
	SWITCH TO [Archive].[CardinalComplete];

	ALTER TABLE [Staging].[CardinalComplete]
	SWITCH TO [dbo].[CardinalComplete];

	UPDATE STATISTICS [dbo].[CardinalComplete];

END
GO
