USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMLoadCAHPrice]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spud_GMLoadCAHPrice] 
	(
		@WSDate smalldatetime

	)

AS



BEGIN 

	Begin Tran WSLoad

		Delete from WSPrice
		If @@error <> 0 
			Begin												
				Print 'Error on Delete CAHPrice'
				Rollback Tran WSLoad
				Return
			End	
	
		Insert INTO WSPrice Select * FROM WSPRICEALL WHERE DateLoaded = @WSDate	
		If @@error <> 0 
			Begin												
				Print 'Error on Insert CAHPrice'
				Rollback Tran WSLoad
				Return
			End	


		SET NOCOUNT OFF

	Commit Tran
END






GO
