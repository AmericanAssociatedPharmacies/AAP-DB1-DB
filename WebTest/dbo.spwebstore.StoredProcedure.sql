USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spwebstore]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spwebstore]
	@pharmid nvarchar(20),
	@demo nvarchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	if @demo=1
	BEGIN
		Select 'Your Pharmacy' as accountname 
	END
	else
	BEGIN
		Select accountname from PharmacyMaster..v_PM_AllWithAffiliates WHERE ncpdp=@pharmid
	END
END
GO
