USE [Medispan]
GO
/****** Object:  UserDefinedFunction [dbo].[f_MediDrugtypefull]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/23/2012
-- Description:	Find DrugType from medispan Data
-- =============================================
CREATE function [dbo].[f_MediDrugtypefull]
(
	@MC as varchar(1),
	@BC as varchar(1)
)
returns varchar(50)
as

begin
declare @ret as varchar(50)
set @ret = 
case @MC
	when 'M' then
		case @BC
			when 'T' then 'SINGLE-SOURCE BRAND'
			when 'B' then 'SINGLE-SOURCE BRAND'
			when 'G' then 'MULTI-SOURCE GENERIC'
			else 'UNK'		
		end	
	when 'N' then
		case @BC
			when 'T' then 'SINGLE-SOURCE BRAND'
			when 'B' then 'SINGLE-SOURCE BRAND'	
			when 'G' then 'MULTI-SOURCE GENERIC'
			else 'UNK'		
		end	
	when 'O' then
		case @BC
			when 'T' then 'MULTI-SOURCE BRAND'
			when 'B' then 'MULTI-SOURCE BRAND'
			when 'G' then 'MULTI-SOURCE GENERIC'	
			else 'UNK'	
		end

	when 'Y' then
		case @BC
			when 'T' then 'MULTI-SOURCE BRAND' -- OLD GENERIC
			when 'B' then 'MULTI-SOURCE GENERIC'
			when 'G' then 'MULTI-SOURCE GENERIC'
			else 'UNK'			
		end

/*	
	when 'O' then
	case @BC
		when 'G' then 'MULTI-SOURCE GENERIC'	
		else 'UNK'	
	end

	when 'M' then
		case @BC
			when 'G' then 'MULTI-SOURCE GENERIC'
			else 'UNK'
		end
	when 'N' then
		case @BC
			when 'G' then 'MULTI-SOURCE GENERIC'
			else 'UNK'
		end */
	else 'UNK'
end
return @ret
END

GO
