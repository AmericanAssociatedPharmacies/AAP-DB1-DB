USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[GetAllAccountRecords]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 2-3-2010
-- Description:	Beta stored procedure for testing data results from scottsboro
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAccountRecords]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.AAPAccount 
END


GO
