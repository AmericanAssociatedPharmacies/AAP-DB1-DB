USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_programLog]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_programLog]
(
	@program varchar(50),
	@program_id int,
	--date defaults to getdate
	@event varchar(50),
	@PMID int,
	@field1 varchar(255),
	@field2 varchar(255),
	@field3 varchar(255),
	@field4 varchar(255),
	@field5 varchar(255)
)
as
insert into 
program_log
(program,program_id,[event],pmid,field1,field2,field3,field4,field5)
values
(@program,@program_id,@event,@pmid,@field1,@field2,@field3,@field4,@field5)
GO
