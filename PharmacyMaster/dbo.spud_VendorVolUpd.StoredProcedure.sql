USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_VendorVolUpd]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 03/11/2011
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_VendorVolUpd]
	(
		@PMID int,
		@UDNo int
	)
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @cnt int

	Select @cnt=count(*) from PM_Pharmacy WHERE PMID=@PMID

	if @cnt > 0

		BEGIN

			UPDATE VendorVolumeRebate SET PMID=@PMID WHERE UDNo=@UDNo

			Insert INTO CHACCT_PMID (CHAccount, PMID) VALUES(@UDNo,@PMID)
		END


	Select @cnt as cnt
END
GO
