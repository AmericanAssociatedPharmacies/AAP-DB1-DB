USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[MonthFromNumber]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[MonthFromNumber]
(
	@monthNumber int
)
RETURNS varchar(3)
AS
BEGIN
 DECLARE @Result varchar(3) ;
		IF ( @monthNumber = 1 ) Begin Set @Result =  'Jan' END
		IF ( @monthNumber = 2)  Begin Set @Result =  'Feb' END
		IF ( @monthNumber = 3)  Begin Set @Result =  'Mar' END
		IF ( @monthNumber = 4)  Begin Set @Result =  'Apr' END
		IF ( @monthNumber = 5)  Begin Set @Result =  'May' END
		IF ( @monthNumber = 6)  Begin Set @Result =  'Jun' END
		IF ( @monthNumber = 7)  Begin Set @Result =  'Jul' END
		IF ( @monthNumber = 8)  Begin Set @Result =  'Aug' END
		IF ( @monthNumber = 9)  Begin Set @Result =  'Sep' END
		IF ( @monthNumber = 10)  Begin Set @Result =  'Oct' END
		IF ( @monthNumber = 11)  Begin Set @Result =  'Nov' END
		IF ( @monthNumber = 12)  Begin Set @Result =  'Dec' END
 RETURN @Result;
END
GO
