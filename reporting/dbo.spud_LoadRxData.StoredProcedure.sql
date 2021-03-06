USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadRxData]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[spud_LoadRxData] 
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
		set @SQL = 'IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=''Rx30Load'') DROP TABLE Rx30Load'
		exec(@SQL);
		If @@error <> 0 
			Begin												
				Print 'Error on Delete RxLoad'
				Rollback Tran RxLoad
				Return
			End		

	--1.	Create table
	CREATE TABLE [dbo].[Rx30Load](
	[Pharm ID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BIN Nbr] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PCN] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Group Nbr] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Submitted] [datetime] NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 0) NULL,
	[Day Supply] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NDC] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,	
	[Fee Submitted] [numeric](38, 3) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Plan Amount] [numeric](38, 3) NULL,
	[Co Pay Amount] [numeric](38, 3) NULL,
	[U and C] [numeric](38, 3) NULL,
	[Total Price] [numeric](38, 3) NULL,
	[BS] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BR] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[OI] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DAW] [nvarchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DAW Desc] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Patient Paid] [numeric](38, 3) NULL,
	[Gross Amt Due] [numeric](38, 3) NULL,
	[Bill Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rej Code] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Message Response] [nvarchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Tx Response] [nvarchar](3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Rx Nbr] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RfNbr] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PID_Q] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Doctor] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RA] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[NDCWritten] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
	
	If @@error <> 0 
			Begin												
				Print 'Error on Create Rx30Load'
				Rollback Tran RxLoad
				Return
			End	
	
	--2.	Insert New records to Table
	set @SQL = 'bulk insert Rx30Load from ''C:\data\Rx30Import\Rx30Load.csv';
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

	/*	set @SQL = 'Update Rx30Load Set	[Fee Paid] = 0 Where [Fee Paid] = '''''
		exec(@SQL);

		set @SQL = 'Update Rx30Load Set	[Cost Paid] = 0 Where [Cost Paid] = '''''
		exec(@SQL); */

		
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
		[Fee Paid],[Cost Paid],[Plan Amount],[Co Pay Amount],[U and C],[Total Price],BS,BR,OI,DAW,[DAW Desc],[Patient Paid], [Gross Amt Due],[Bill Code],[Rej Code],[Message Response],[Tx Response],[Rx Nbr],RfNbr,PID_Q,PID,Doctor,RA,NDCWritten)
		 Select * from Rx30Load
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
		Select count(*) as TotalCount, count(distinct [Pharm ID]) as StoreCount from Rx30Load		
		--Select [Pharm ID] FROM RxLoad Where [Pharm ID] NOT IN (Select distinct NABP from StoreMember)

		SET NOCOUNT OFF

	Commit Tran
END
















GO
