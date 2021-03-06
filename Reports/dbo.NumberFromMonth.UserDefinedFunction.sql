USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[NumberFromMonth]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[NumberFromMonth]
(
	@monthName varchar(3)
)
RETURNS int
AS
BEGIN
 DECLARE @Result int ;
		IF ( @monthName = 'Jan' ) Begin Set @Result =  1 END
		IF ( @monthName = 'Feb')  Begin Set @Result =  2 END
		IF ( @monthName = 'Mar')  Begin Set @Result =  3 END
		IF ( @monthName = 'Apr')  Begin Set @Result =  4 END
		IF ( @monthName = 'May')  Begin Set @Result =  5 END
		IF ( @monthName = 'Jun')  Begin Set @Result =  6 END
		IF ( @monthName = 'Jul')  Begin Set @Result =  7 END
		IF ( @monthName = 'Aug')  Begin Set @Result =  8 END
		IF ( @monthName = 'Sep')  Begin Set @Result =  9 END
		IF ( @monthName = 'Oct')  Begin Set @Result =  10 END
		IF ( @monthName = 'Nov')  Begin Set @Result =  11 END
		IF ( @monthName = 'Dec')  Begin Set @Result =  12 END
 RETURN @Result;
END
GO
