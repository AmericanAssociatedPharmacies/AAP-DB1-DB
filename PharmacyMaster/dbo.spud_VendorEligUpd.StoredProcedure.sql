USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_VendorEligUpd]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 03/11/2011
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_VendorEligUpd]
	(		
		@Eligibility int,
		@PayToPMID nvarchar(50),
		@PMID int
	)
AS
BEGIN
	
	SET NOCOUNT ON;
	
	if @PayToPMID=0
	Begin
		set @PayToPMID = Null
	End

	if RTRIM(@PayToPMID)=''
	Begin
		set @PayToPMID = Null
	End

	UPDATE VendorVolumeRebate SET Eligibility = @Eligibility, 
		PayTo=@PayToPMID
WHERE VendorVolumeRebate.PMID=@PMID AND VendorVolumeRebate.StorePaidDt IS NULL 
	
END
GO
