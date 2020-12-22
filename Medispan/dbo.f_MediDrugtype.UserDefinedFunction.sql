USE [Medispan]
GO
/****** Object:  UserDefinedFunction [dbo].[f_MediDrugtype]    Script Date: 12/22/2020 4:38:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 04/23/2012
-- Description:	Find DrugType from medispan Data
-- =============================================
CREATE function [dbo].[f_MediDrugtype]
(
	@MC as varchar(1),
	@BC as varchar(1)
)
returns varchar(3)
as

begin
declare @ret as varchar(3)
set @ret = 
case @MC
	when 'M' then
		case @BC
			when 'T' then 'SSB'
			when 'B' then 'SSB'	
			when 'G' then 'GEN'	
			else 'UNK'	
		end	
	when 'N' then
		case @BC
			when 'T' then 'SSB'
			when 'B' then 'SSB'	
			when 'G' then 'GEN'			
			else 'UNK'
		end	
	when 'O' then
		case @BC
			when 'T' then 'MSB'
			when 'B' then 'MSB'	
			when 'G' then 'GEN'		
			else 'UNK'	
		end
	
	when 'Y' then
		case @BC
			when 'T' then 'MSB'
			when 'B' then 'GEN'
			when 'G' then 'GEN'		
			else 'UNK'	
		end

/*	when 'O' then
		case @BC
			when 'G' then 'GEN'
			else 'UNK'			
		end

	when 'M' then
		case @BC
			when 'G' then 'GEN'
			else 'UNK'
		end
	when 'N' then
		case @BC
			when 'G' then 'GEN'
			else 'UNK'
		end */
	else 'UNK'
end
return @ret
END
GO
