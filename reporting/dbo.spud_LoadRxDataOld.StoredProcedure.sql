USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadRxDataOld]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spud_LoadRxDataOld] 
	-- in this case the filename = the table name
	--@filename varchar(1000)
AS
DECLARE @SQL varchar(2000)
DECLARE @filename varchar(1000)
Select @filename = 'Rx30Load.csv';
BEGIN 

	Begin Tran RxLoad

		-- Refresh RxMaster bak
		set @SQL = 'IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=''Rx30Masterbak'') DROP TABLE Rx30Masterbak'
		exec(@SQL);		
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Rx30Masterbak'
				Rollback Tran RxLoad
				Return
			End	

		set @SQL = 'Select * INTO Rx30Masterbak FROM Rx30Master'
		exec(@SQL);		
		If @@error <> 0 
			Begin												
				Print 'Error on Bulk Insert into Rx30Masterbak from Rx30Master'
				Rollback Tran RxLoad
				Return
			End	

		-- Delete tmp table RxLoad
		set @SQL = 'IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=''RxLoad'') DROP TABLE RxLoad'
		exec(@SQL);
		If @@error <> 0 
			Begin												
				Print 'Error on Delete RxLoad'
				Rollback Tran RxLoad
				Return
			End		

	--1.	Create table
	set @SQL = 'CREATE TABLE [dbo].[RxLoad](
	[Pharm ID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BIN Nbr] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCN] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group Nbr] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Submitted] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rx Date] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Qty Dispensed] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Day Supply] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NDC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fee Submitted] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cost Submitted] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Fee Paid] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cost Paid] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Plan Amount] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Co Pay Amount] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[U and C] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Total Price] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[B] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OI] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]'

	exec(@SQL);
	If @@error <> 0 
			Begin												
				Print 'Error on Create RxLoad'
				Rollback Tran RxLoad
				Return
			End	
	
	--2.	Insert New records to Table
	set @SQL = 'bulk insert RxLoad from ''C:\data\Rx30Import\Rx30Load.csv';
	set @SQL = @SQL + ''' with (fieldterminator=''|'',firstrow=2,rowterminator=''
'') ';
	--set @SQL = @SQL + 'errorfile=''C:\data\RxImport\RxLoad.err'')';
	SET NOCOUNT ON;
	exec(@SQL);

		If @@error <> 0 
			Begin												
				Print 'Error on Bulk insert from file to RxLoad'
				Rollback Tran RxLoad
				Return
			End	
		
		--4.	Format Fields
		exec spud_formatfieldsRX		
		If @@error <> 0 
			Begin												
				Print 'Error on Format RxLoad'
				Rollback Tran RxLoad
				Return
			End	

	
		--5.	Append new fields to master Table
		Insert into Rx30Master([Pharm ID],[BIN Nbr],PCN,[Group Nbr],Submitted,[Rx Date],[Qty Dispensed],[Day Supply],NDC,[Fee Submitted],[Cost Submitted],
		[Fee Paid],[Cost Paid],[Plan Amount],[Co Pay Amount],[U and C],[Total Price],B,OI)
		 Select * from RxLoad
		If @@error <> 0 
			Begin												
				Print 'Error on Insert into Rx30Master'
				Rollback Tran RxLoad
				Return
			End	
		
		Update Rx30Master Set updatedon = getdate() WHERE (updatedon is null or updatedon = '')
		If @@error <> 0 
			Begin												
				Print 'Error on Updating Rx30Master'
				Rollback Tran RxLoad
				Return
			End	
		Select count(*) as TotalCount, count(distinct [Pharm ID]) as StoreCount from RxLoad		
		--Select [Pharm ID] FROM RxLoad Where [Pharm ID] NOT IN (Select distinct NABP from StoreMember)

		SET NOCOUNT OFF

	Commit Tran
END






GO
