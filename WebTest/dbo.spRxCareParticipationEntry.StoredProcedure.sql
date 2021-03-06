USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRxCareParticipationEntry]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRxCareParticipationEntry]
(
	@Pharmacy varchar(255),
	@NCPDP varchar(10),
	@NPI varchar(10),
	@Phone varchar (25),
	@Fax varchar(25),
	@Email varchar(255),
	@AltEmail varchar(255),
	@Address1 varchar(255),
	@Address2 varchar(255),
	@City varchar(255),
	@State varchar(50),
	@Zip varchar(20),
	@MailAddress1 varchar(255),
	@MailAddress2 varchar(255),
	@MailCity varchar(255),
	@MailState varchar(50),
	@MailZip varchar(20),
	@PharmacyOwner varchar(255),
	@ManagerName varchar(255),
	@SoftwareSystem varchar(255),
	@Name varchar(255),
	@Title varchar(255),
	@Referral varchar(50),
	@ReferralText varchar(255)
)
AS
BEGIN
	INSERT INTO RxCareParticipation (Pharmacy, NCPDP, NPI, Phone, Fax, Email, [Alt.Email], Address1, Address2, City, State, Zip, MailAddress1, MailAddress2, MailCity, MailState, MailZip, PharmacyOwner, ManagerName, SoftwareSystem, Name, Title, Referral, ReferralText)
	VALUES (@Pharmacy, @NCPDP, @NPI, @Phone, @Fax, @Email, @AltEmail, @Address1, @Address2, @City, @State, @Zip, @MailAddress1, @MailAddress2, @MailCity, @MailState, @MailZip, @PharmacyOwner, @ManagerName, @SoftwareSystem, @Name, @Title, @Referral, @ReferralText)
END
GO
