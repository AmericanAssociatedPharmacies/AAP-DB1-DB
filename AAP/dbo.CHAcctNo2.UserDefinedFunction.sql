USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[CHAcctNo2]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[CHAcctNo2]
(
	-- Add the parameters for the function here
	@pmid int
)
RETURNS varchar(50)
AS
BEGIN
	
	DECLARE @result varchar(50)
	select @result = primaryCAaccountno
		from aap.dbo.newpharmacymasterfortest where pmid=@pmid

	IF @result is null
		begin
			select @result = (select top 1 w.acct_num
				from newpharmacymasterfortest a left join reporting..ud_wholesaler_store w on a.UDaccountno = w.store_id
					where a.pmid = @pmid 
					and a.UDaccountno is not null
					and vendor_id in (65,86)
					and acct_type='PRIMARY')
		end


	RETURN @result

END
GO
