USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRxCareSelectEntry]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spRxCareSelectEntry]
(
	@Lastname varchar(50),
	@Firstname varchar(50),
	@Initial varchar(50),
	@Gender varchar(10),
	@Address1 varchar(255),
	@Address2 varchar(255),
	@City varchar(255),
	@State varchar(50),
	@Zip varchar(20),
	@Email varchar(255),
	@Pharmacy varchar(255)
)
AS
BEGIN
	INSERT INTO RxCareSelect (Firstname, Initial, Lastname, Gender, Address1, Address2, City, State, Zip, Email, Pharmacy)
	VALUES (@Firstname, @Initial, @Lastname, @Gender, @Address1, @Address2, @City, @State, @Zip, @Email, @Pharmacy)
END
GO
