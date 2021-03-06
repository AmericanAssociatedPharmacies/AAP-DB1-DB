USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadVendor]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 09/20/2008
-- Description:	LOAD LATEST VENDOR LIST
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadVendor] 
	
AS
BEGIN

	SET NOCOUNT ON;	

	BEGIN TRAN lvendor
	  
		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='vvcopy') DROP TABLE vvcopy
		--select * INTO vvcopy FROM OPENQUERY(ACCESS_UDMAINCOPY, 'select * from UD_Main.volvndrs') AS Rowset_1
		select * into vvcopy from UDMAIN...volvndrs
		If @@error <> 0 
			Begin												
				Print 'ERROR ON Create vvcopy '
				Rollback Tran lvendor
				Return
			End	

		/*select * into vvcopy from view_volvndrs */

		EXEC spud_vendormasterupd
		If @@error <> 0 
			Begin												
				Print 'ERROR ON Create vendor master '
				Rollback Tran lvendor
				Return
			End	

    COMMIT TRAN lvendor

	
END





GO
