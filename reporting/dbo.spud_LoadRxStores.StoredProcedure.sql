USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadRxStores]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spud_LoadRxStores]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	bulk insert Rx30StoresLoad from 'C:\data\Rx30Import\RxStores.csv' with (fieldterminator='|',firstrow=1,rowterminator='')

	INSERT INTO Rx30Stores(NABP,Name) Select * from Rx30StoresLoad WHERE NABP NOT IN (Select NABP From Rx30Stores)
END

GO
