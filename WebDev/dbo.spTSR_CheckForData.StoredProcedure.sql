USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spTSR_CheckForData]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spTSR_CheckForData]
(
@NCPDP varchar(50)
)
as
declare @TSR3_Start_Date as datetime
set @TSR3_Start_Date = '1/1/2015'
select lastpaid from cpay..TSR_AretePaymentSummary where NCPDP=@NCPDP and lastpaid >= @TSR3_Start_Date
GO
