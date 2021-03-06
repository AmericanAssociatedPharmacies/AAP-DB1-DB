USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_GMFDBLoad]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spud_GMFDBLoad]

	
AS
BEGIN 

	Begin Tran FDBLoad
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	DECLARE @SQL varchar(2000)
	
	DELETE  FROM GMRNP2
	If @@error <> 0 
			Begin												
				Print 'Failure on DELETE'
				Rollback Tran FDBLoad
				Return
			End	

	set @SQL = 'bulk insert GMRNP2 from ''C:\Data\MAGMA\RNP2.txt';
	set @SQL = @SQL + ''' with (fieldterminator=''|'', firstrow=1 )';	
	exec(@SQL);

	If @@error <> 0 
			Begin												
				Print 'Failure on bulk insert'
				Rollback Tran FDBLoad
				Return
			End	

  
	
	
	
	SET NOCOUNT OFF;

	Commit Tran
END


















GO
