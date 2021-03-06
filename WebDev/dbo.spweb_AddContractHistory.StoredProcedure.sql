USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_AddContractHistory]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spweb_AddContractHistory]
(
	@PMID int,
	@Name varchar(255),
	@Contract varchar(15),
	@date datetime
)
as
begin
insert into history_contracts
(pmid,name,contract,date) values(@PMID,@Name,@Contract,@date)
end

--grant insert,select on history_contracts to webdevuser
GO
