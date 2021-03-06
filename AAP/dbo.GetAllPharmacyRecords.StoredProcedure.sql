USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[GetAllPharmacyRecords]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 2-4-2010
-- Description:	Return all Pharmacy records
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPharmacyRecords]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.PharmacyMaster ORDER BY AccountName 
END
GO
