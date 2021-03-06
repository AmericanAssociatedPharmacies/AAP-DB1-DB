USE [WebDev]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_CommaListToTable]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[ufn_CommaListToTable](@pmidlist nvarchar(50))
returns @plist table
(
	PMID int
)
as
begin
declare @v int
DECLARE @pos        int,
           @nextpos    int,
           @valuelen   int
  SELECT @pos = 0, @nextpos = 1

   WHILE @nextpos > 0
   BEGIN
      SELECT @nextpos = charindex(',', @pmidlist, @pos + 1)
      SELECT @valuelen = CASE WHEN @nextpos > 0
                              THEN @nextpos
                              ELSE len(@pmidlist) + 1
                         END - @pos - 1
      INSERT @plist (PMID)
         VALUES (convert(int, substring(@pmidlist, @pos + 1, @valuelen)))
      SELECT @pos = @nextpos
   END
	RETURN
end
GO
