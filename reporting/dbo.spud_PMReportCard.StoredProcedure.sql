USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMReportCard]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANANAN
-- Create date: 04/21/09
-- Description:	GENERATE Rejected Claims report for PM clients
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMReportCard]
(
	@ID int,
	@Value numeric(18,2),
	@NABP nvarchar(50)
)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  INSERT INTO PMReportCardValue VALUES(@ID,@value,@NABP)


END
GO
