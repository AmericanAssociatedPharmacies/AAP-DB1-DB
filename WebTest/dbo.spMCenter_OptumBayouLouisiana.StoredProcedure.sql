USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_OptumBayouLouisiana]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spMCenter_OptumBayouLouisiana]
(
	@PMID int
)
as
-- Message Center return 'result' field, value 1 to show message else 0
-- Specialty Pharmacy participants 11/14
BEGIN

select case when @pmid in (106944, 105972 , 106675 , 103198 , 104017 , 108313) then 1 else 0 end result from v_web_programinfo where pmid=@PMID 
END
GO
