USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCReimbursementInquiry]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spMCReimbursementInquiry]
AS
BEGIN
	select id,wholesaler from rform_wholesalers order by id
END
GO
