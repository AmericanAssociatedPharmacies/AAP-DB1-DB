USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_udVolume_update]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_udVolume_update]
	-- Add the parameters for the stored procedure here
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select udv.acct_no,udv.June ,  vol.acct_no,vol.June
 
 FROM udVolume udv
		inner join 
		 openquery(UNITEDDB,'select acct_no, JUNE from united.volume where fy_end = 2009 and VENDOR_ID = 65 and june != 0')as vol       
		 on udv.acct_no = vol.acct_no and fy_end = '2009' 
END

GO
