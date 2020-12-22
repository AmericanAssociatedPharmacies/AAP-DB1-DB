USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CHP_APP_Archive_Delete]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CHP_APP_Archive_Delete]

	@InvDate DATETIME

AS

SET NOCOUNT ON;


BEGIN

	DELETE x
	FROM dbo.CHPH_AAP AS x
	WHERE INV_DATE = @InvDate;

	CHECKPOINT;

END


GO
