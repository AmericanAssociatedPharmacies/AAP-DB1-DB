USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_UPStatus_backup110414]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRLGL_UPStatus_backup110414]
(
		@NCPDP nvarchar(10),
		@RxNbr nvarchar(50),  --was 11
		@filldatearg nvarchar(15),
		@includeStateMACif1 int --0 or 1
)

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @RxDate datetime;

	if (ISNULL(@RxNbr,0) = 0 OR DATALENGTH(@RxNbr) = 0 ) --return all
		BEGIN
			Select  
			--BIN, 
			case when PlanName is null then 'BIN:' + BIN else PlanName end as [Plan]
			,RxNbr 
			,convert(varchar(12),RxDate,1) as RxDate
			,Status
			,convert(varchar(12),UpdatedOn,1) as Updated
			--Result
			,case when @includeStateMACif1 = 1 then
			dbo.fnUPStatusResult(Result,APIPriceStatus,CAHPriceStatus,Notes) 
			else
			dbo.fnUPStatusResult(Result,APIPriceStatus,CAHPriceStatus,null) 
			end as Result
			,left(Source,1) + ' ' + convert(varchar(12),CreatedOn ,1) as Source
			--,convert(varchar(12),CreatedOn ,1) as Created 
			--,NDC
			,DrugName
			from UPStatus WHERE (PharmID = @NCPDP) 
			--ORDER BY Status DESC,PlanName ASC,RxNbr ASC
			ORDER BY UpdatedOn DESC,RxNbr ASC
		END
	ELSE
		BEGIN
			if (ISNULL(@RxDate,0) = 0 OR DATALENGTH(@RxDate) = 0 ) --return all dates for rxnum
			BEGIN
				Select  
				--BIN, 
				case when PlanName is null then 'BIN:' + BIN else PlanName end as [Plan]
				,RxNbr 
				,convert(varchar(12),RxDate,1) as RxDate
				,Status
				,convert(varchar(12),UpdatedOn,1) as Updated
				,case when @includeStateMACif1 = 1 then
				dbo.fnUPStatusResult(Result,APIPriceStatus,CAHPriceStatus,Notes) 
				else
				dbo.fnUPStatusResult(Result,APIPriceStatus,CAHPriceStatus,null) 
				end as Result
				,left(Source,1) + ' ' + convert(varchar(12),CreatedOn ,1) as Source
				--,convert(varchar(12),CreatedOn ,1) as Created 
				--,NDC
				,DrugName	
  				from WebDev.dbo.UPStatus WHERE (PharmID = @NCPDP) AND RxNbr = @RxNbr --AND RxDate = @FillDate
  			END
			ELSE  --return rxnum+rxdate match
			BEGIN
				set @RxDate = convert(datetime,@filldatearg)
				Select  
				--BIN, 
				case when PlanName is null then 'BIN:' + BIN else PlanName end as [Plan]
				,RxNbr 
				,convert(varchar(12),RxDate,1) as RxDate
				,Status
				,convert(varchar(12),UpdatedOn,1) as Updated
				,case when @includeStateMACif1 = 1 then
				dbo.fnUPStatusResult(Result,APIPriceStatus,CAHPriceStatus,Notes) 
				else
				dbo.fnUPStatusResult(Result,APIPriceStatus,CAHPriceStatus,null) 
				end as Result
				,left(Source,1) + ' ' + convert(varchar(12),CreatedOn ,1) as Source
				--,convert(varchar(12),CreatedOn ,1) as Created 
				--,NDC
				,DrugName	
  				from WebDev.dbo.UPStatus WHERE (PharmID = @NCPDP) AND RxNbr = @RxNbr AND RxDate = @RxDate
  			END
		END
		
END

GO
