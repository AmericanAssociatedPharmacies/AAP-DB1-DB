USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_test2]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_test2](@NDC_CH varchar(50),@mode int)
RETURNS varchar(50)
AS 
BEGIN
declare @ret varchar(8000)
declare @GPI_FDB varchar(50), @GPI_API varchar(50)
declare @APIbyNDC varchar(50)
select @ret = ''
select @APIbyNDC = (select top 1 APIItemNbr from purchases..v_APIPrice_mostrecent2 where NDC = @NDC_CH)
if @APIbyNDC is not null
	BEGIN
		select @ret = case when @mode=0 then @APIbyNDC else 'NDC' end
	END
else
	BEGIN
		select @GPI_FDB = (select top 1 GPI from fdb..ndcgpi where ndc=@NDC_CH)
		select @GPI_API = (select top 1 isnull(APIItemnbr,'nomatch') from purchases..v_APIPrice_mostrecent2 where GPI = @GPI_FDB)
		select @ret = case when @GPI_API is not null then
			case when @mode = 0 then
				(SELECT
				top 1 itemnos = replace(replace(replace((SELECT APIItemNbr from purchases..v_APIPrice_mostrecent2 p2
				where p2.GPI=p1.GPI order by p2.GPI FOR xml PATH('')),'</APIItemNbr><APIItemNbr>',','),'<APIItemNbr>',''),'</APIItemNbr>','')
				from purchases..v_APIPrice_mostrecent2 p1 
				where p1.GPI=@GPI_FDB
				)
			else 'GPI' end
		else
			case when @mode = 0 then @APIbyNDC else '' end
		end
	END

return @ret
END

--select top 1 dbo.fn_test2('62856024330',0), dbo.fn_test2('62856024330',1) from purchases..v_APIPrice_mostrecent2
GO
