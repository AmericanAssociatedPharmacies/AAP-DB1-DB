USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_test1]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_test1](@GPI varchar(50))
RETURNS TABLE
AS RETURN
(
SELECT
DISTINCT p1.GPI, itemnos = replace(replace(replace((SELECT APIItemNbr from purchases..v_APIPrice_mostrecent2 p2
where p2.GPI=p1.GPI order by p2.GPI FOR xml PATH('')),'</APIItemNbr><APIItemNbr>',','),'<APIItemNbr>',''),'</APIItemNbr>','')
from purchases..v_APIPrice_mostrecent2 p1 
where p1.GPI=@GPI
)
GO
