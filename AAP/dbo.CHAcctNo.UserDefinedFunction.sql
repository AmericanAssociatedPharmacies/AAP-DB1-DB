USE [AAP]
GO
/****** Object:  UserDefinedFunction [dbo].[CHAcctNo]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[CHAcctNo]
(
	-- Add the parameters for the function here
	@aapid bigint
)
RETURNS varchar(50)
AS
BEGIN
	
	DECLARE @result varchar(50)
	select @result = primaryCAaccountno
		from aap.dbo.newpharmacymasterfortest where aapaccountno=@aapid

	IF @result is null
		begin
			select @result = (select top 1 w.acct_num
				from aapaccount a left join reporting..ud_wholesaler_store w on a.PreviousAcctNo = w.store_id
					where a.aapid = @aapid 
					and a.previousacctno is not null
					and vendor_id in (65,86)
					and acct_type='PRIMARY')
		end


	RETURN @result

END
GO
