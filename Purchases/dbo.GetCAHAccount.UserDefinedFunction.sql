USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[GetCAHAccount]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCAHAccount] 
(	
	
	@Invoice nvarchar(50)	
)

RETURNS nvarchar(50)
AS
BEGIN

declare @iRet nvarchar(50)
set @iRet = '0'


IF @iRet = '0'
BEGIN
		
	BEGIN
		
		--CAH
		select @iRet = Customer_No from CHPH_AAP 
		where Invoice_No =@Invoice
			
		
	END
END

return @iRet
end
GO
