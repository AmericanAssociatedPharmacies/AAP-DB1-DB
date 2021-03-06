USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PMRx30Last]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 05/08/09
-- Description:	To Store the Last RxID used for the Profit Minder Reporting
-- =============================================
CREATE PROCEDURE [dbo].[spud_PMRx30Last]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @maxid int
	SELECT @maxid = MAX(RxID) FROM Rx30Master

    -- Insert statements for procedure here
	INSERT INTO Rx30PMLast(RxID,Type, GeneratedOn) VALUES (@maxid,1, getdate())

END


GO
