USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRxCareParticipationBankEntry]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spRxCareParticipationBankEntry]
(
	@Name varchar(255),
	@BusinessName varchar(255),
	@BankName varchar(255),
	@BankAddress1 varchar(255),
	@BankAddress2 varchar(255),
	@BankCity varchar(255),
	@BankState varchar(50),
	@BankZip varchar(20),
	@RoutingNumber varchar(25),
	@AccountNumber varchar(25)
)
AS
BEGIN
	INSERT INTO RxCareParticipationBankInfo (Name, BusinessName, BankName, BankAddress1, BankAddress2, BankCity, BankState, BankZip, RoutingNumber, AccountNumber)
	VALUES (@Name, @BusinessName, @BankName, @BankAddress1, @BankAddress2, @BankCity, @BankState, @BankZip, @RoutingNumber, @AccountNumber)
END
GO
