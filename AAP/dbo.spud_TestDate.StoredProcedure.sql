USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spud_TestDate]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson - Test date input
-- Create date: 12/21/2009
-- Description:	
-- =============================================
Create PROCEDURE [dbo].[spud_TestDate]
(
	@date datetime
)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    print @date
END
GO
