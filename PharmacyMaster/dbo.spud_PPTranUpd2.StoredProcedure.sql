USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPTranUpd2]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_PPTranUpd2]
	(		
		@Volume numeric(18,2),
		@Rebate numeric(18,2),
		@PMID int,
		@ID int
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE VendorVolumeRebate 
	SET PMID = @PMID, 
	VolumeAmt = @Volume, 
	RebateAmt = @Rebate 
WHERE ID=@ID

END
GO
