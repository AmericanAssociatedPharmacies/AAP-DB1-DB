USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[GetPMID]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetPMID] 
(
@DEA varchar(50),
@AAPAccountNo varchar(20),
@APIAccountNo varchar(20),
@UDAccountNo varchar(20)
)
RETURNS int
AS
BEGIN
declare @iRet int
set @iRet = NULL

IF @DEA is not null and LEN(@DEA)>0
BEGIN
select @iRet = PMID from Pharmacy1 where DEA=@DEA 
END

IF @iRet is null
BEGIN
	IF @AAPAccountNo is not null and LEN(@AAPAccountNo)>0
	BEGIN
		select @iRet = PMID from Pharmacy1 where AAPAccountNo=@AAPAccountNo 
	END
END

IF @iRet is null
BEGIN
	IF @APIAccountNo is not null and LEN(@APIAccountNo)>0
	BEGIN
		select @iRet = PMID from Pharmacy1 where APIAccountNo=@APIAccountNo 
	END
END

IF @iRet is null
BEGIN
	IF @UDAccountNo is not null and LEN(@UDAccountNo)>0
	BEGIN
		select @iRet = PMID from Pharmacy1 where UDAccountNo=@UDAccountNo 
	END
END
return @iRet
end
GO
