USE [AAP]
GO
/****** Object:  View [dbo].[v_sales1]    Script Date: 12/22/2020 9:04:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_sales1]
as
select top 1 * from API..API_Sum_Totamt_Mnthly
GO
