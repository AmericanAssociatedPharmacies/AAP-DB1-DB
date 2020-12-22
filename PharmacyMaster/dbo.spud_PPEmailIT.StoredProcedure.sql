USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spud_PPEmailIT]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spud_PPEmailIT] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
	EXEC msdb.dbo.sp_send_dbmail 
		--@recipients='6026780772@faxorama.com', 
		--@recipients='jnarayanan@uniteddrugs.com', 
		@recipients='jnarayanan@uniteddrugs.com;ITOperations@uniteddrugs.com', 
		@body='	Preferred Partners Checks are ready to be mailed! Please generate the sales reports. 
		',  
		@subject = 'PP Checks Are Ready!' , 
		@profile_name = 'UnderPaidClaims'
		

END
GO
