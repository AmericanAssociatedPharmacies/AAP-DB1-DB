USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spSCANdata]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spSCANdata]
(
	@ncpdp varchar(15)
)
AS
BEGIN
	select top 1 ncpdp from 
		(select distinct ncpdp from qc_scanesidaily union select distinct ncpdp from qc_scanesimonthly) dt 
		where ncpdp=@ncpdp;
END
GO
