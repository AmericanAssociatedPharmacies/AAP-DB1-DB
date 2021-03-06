USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_MatchAPIfromCHNDC]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_MatchAPIfromCHNDC](@NDC_CH varchar(50),@mode int)
RETURNS varchar(50)
AS 
-- mode 0 return itemnbr or comma-sep list of itemnumbers in GPI
-- mode 1 return match type NDC, GPI or null (option:force match by GPI even if ndc matches)
-- mode 2 return itemnbr with min price in gpi 
--		3 return min price
--		4 return api price
--		5 return api size

BEGIN
declare @ret varchar(8000)
declare @GPI_FDB varchar(50), @GPI_API varchar(50)
declare @APIbyNDC varchar(50)
select @ret = ''
select @APIbyNDC = (select top 1 APIItemNbr from purchases..v_APIPrice_mostrecent2 where NDC = @NDC_CH)
if @APIbyNDC is not null
	BEGIN
		select @ret = case @mode
			when 0 then @APIbyNDC 
			when 1 then 'NDC' 
			when 2 then @APIbyNDC 
			when 3 then 
				(select cast(min(PricePerUnit) as varchar(20)) from purchases..v_APIPrice_mostrecent2 where  NDC = @NDC_CH)
			when 4 then 
				(select cast(min(APIPrice) as varchar(20)) from purchases..v_APIPrice_mostrecent2 where  NDC = @NDC_CH)
			when 5 then 
				(select size from purchases..v_APIPrice_mostrecent2 where  NDC = @NDC_CH)
			else ''
			end
	END
else
	BEGIN
		--get GPI from FDB, and convert nulls so GPI_API doesn't match on them
		select @GPI_FDB = (select top 1 isnull(GPI,'APIwillNotMatchThis') from fdb..ndcgpi where ndc=@NDC_CH) --todo also xref CH price list
		select @GPI_API = (select top 1 APIItemnbr from purchases..v_APIPrice_mostrecent2 where GPI = @GPI_FDB)
		select @ret = case when @GPI_API is not null then
			case @mode
			when 0 then
				(SELECT
				top 1 itemnos = replace(replace(replace((SELECT APIItemNbr from purchases..v_APIPrice_mostrecent2 p2
				where p2.GPI=p1.GPI order by p2.GPI FOR xml PATH('')),'</APIItemNbr><APIItemNbr>',','),'<APIItemNbr>',''),'</APIItemNbr>','')
				from purchases..v_APIPrice_mostrecent2 p1 
				where p1.GPI=@GPI_FDB
				)
			when 1 then 'GPI'
			when 2 then 
				(select top 1 APIItemnbr from purchases..v_APIPrice_mostrecent2 
					where gpi=@GPI_FDB and PricePerUnit = (select min(PricePerUnit) from purchases..v_APIPrice_mostrecent2
							where gpi = @GPI_FDB))
			when 3 then 
				(select cast(min(PricePerUnit) as varchar(20)) from purchases..v_APIPrice_mostrecent2 where gpi = @GPI_FDB)
			when 4 then 
				(select top 1 cast(min(APIPrice) as varchar(20)) from purchases..v_APIPrice_mostrecent2 
					where gpi=@GPI_FDB and PricePerUnit = (select min(PricePerUnit) from purchases..v_APIPrice_mostrecent2
							where gpi = @GPI_FDB))
			when 5 then 
				(select top 1 size from purchases..v_APIPrice_mostrecent2 
					where gpi=@GPI_FDB and PricePerUnit = (select min(PricePerUnit) from purchases..v_APIPrice_mostrecent2
							where gpi = @GPI_FDB))
			else '' end
		else
			case @mode
			when 0 then @APIbyNDC
			when 1 then ''
			when 2 then ''
			when 3 then ''
			when 4 then ''
			when 5 then ''
			else ''
			end
		end
	END

return @ret
END

--select top 1 dbo.fn_test2('62175013637',0), dbo.fn_test2('62175013637',1) from purchases..v_APIPrice_mostrecent2
GO
