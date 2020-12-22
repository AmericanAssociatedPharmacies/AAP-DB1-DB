USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spCGStoreCredStatus]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spCGStoreCredStatus]
(
	@ncpdp varchar(15),
	@pmid int
)
AS
BEGIN
SELECT *
	FROM
		v_CA_StoreCredentialingStatus
	WHERE 
		NCPDP=@ncpdp And PMID=@pmid
END
GO
