USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spTest_x_deprecated]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spTest_x_deprecated]
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
