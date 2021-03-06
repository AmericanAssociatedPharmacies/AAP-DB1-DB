USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadRxDataTest]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spud_LoadRxDataTest] 
	-- in this case the filename = the table name
	--@filename varchar(1000)
AS
DECLARE @SQL varchar(2000)
DECLARE @filename varchar(1000)
Select @filename = 'Rx30Load.csv';
BEGIN

	/*-- Refresh RxMaster bak
	set @SQL = 'IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=''RxMasterbak'') DROP TABLE RxMasterbak'
	exec(@SQL);	
	
	set @SQL = 'Select * INTO RxMasterbak FROM RxMaster'
	exec(@SQL);	*/

	-- Delete tmp table RxLoad
	set @SQL = 'IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME=''RxLoadTest'') DROP TABLE RxLoadTest'
	exec(@SQL);	

	--1.	Create table
	set @SQL = 'CREATE TABLE [dbo].[RxLoadTest](
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

	
	--2.	Insert New records to Table
	set @SQL = 'bulk insert RxLoadtest from ''C:\data\Rx30Import\' + @filename;
	set @SQL = @SQL + ''' with (fieldterminator=''|'',firstrow=2,rowterminator=''
'') ';
	--set @SQL = @SQL + 'errorfile=''C:\data\RxImport\RxLoad.err'')';
	SET NOCOUNT ON;
	exec(@SQL);
	
	--4.	Format Fields
	exec spud_formatfieldsRX

	
	--5.	Append new fields to master Table
	Insert into Rx30Load1([Pharm ID],[BIN Nbr],PCN,[Group Nbr],Submitted,[Rx Date],[Qty Dispensed],[Day Supply],NDC,[Fee Submitted],[Cost Submitted],
	[Fee Paid],[Cost Paid],[Plan Amount],[Co Pay Amount],[U and C],[Total Price],B,OI)
	 Select * from RxLoadTest
	
		
	Select count(*) as TotalCount, count(distinct [Pharm ID]) as StoreCount from RxLoadTest
	
	--Select [Pharm ID] FROM RxLoad Where [Pharm ID] NOT IN (Select distinct NABP from StoreMember)

	SET NOCOUNT OFF

END





GO
