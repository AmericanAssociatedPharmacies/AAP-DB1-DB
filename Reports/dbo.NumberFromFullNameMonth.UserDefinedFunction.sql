USE [Reports]
GO
/****** Object:  UserDefinedFunction [dbo].[NumberFromFullNameMonth]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[NumberFromFullNameMonth]
(
	@monthName varchar(15)
)
RETURNS varchar(2)
AS
BEGIN
 DECLARE @Result varchar(2) ;
		IF ( @monthName = 'January' ) Begin Set @Result =  '01' END
		IF ( @monthName = 'February')  Begin Set @Result =  '02' END
		IF ( @monthName = 'March')  Begin Set @Result =  '03' END
		IF ( @monthName = 'April')  Begin Set @Result =  '04' END
		IF ( @monthName = 'May')  Begin Set @Result =  '05' END
		IF ( @monthName = 'June')  Begin Set @Result =  '06' END
		IF ( @monthName = 'July')  Begin Set @Result =  '07' END
		IF ( @monthName = 'August')  Begin Set @Result =  '08' END
		IF ( @monthName = 'September')  Begin Set @Result =  '09' END
		IF ( @monthName = 'October')  Begin Set @Result =  '10' END
		IF ( @monthName = 'November')  Begin Set @Result =  '11' END
		IF ( @monthName = 'December')  Begin Set @Result =  '12' END
 RETURN @Result;
END
GO
