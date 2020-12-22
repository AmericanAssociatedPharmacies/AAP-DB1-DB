USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spCGStoreEmployee]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spCGStoreEmployee]
(
	@ncpdp varchar(15)
)
AS
BEGIN
SELECT *
    FROM 
        CA_StoreEmployee
    WHERE 
        NCPDP=@ncpdp AND IsActive=1
END
GO
