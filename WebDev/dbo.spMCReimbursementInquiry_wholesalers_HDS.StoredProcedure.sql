USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCReimbursementInquiry_wholesalers_HDS]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spMCReimbursementInquiry_wholesalers_HDS]
AS
BEGIN
	select id,wholesaler from rform_wholesalers_hds order by id
END
GO
