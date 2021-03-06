USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_Pharmacy1_Groups]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_Pharmacy1_Groups]
AS

	SELECT p.*,gr.group_name from pharmacy1 p
	left outer join
	(
	SELECT group_name,x.pmid from pm_groups_xref x
	join pm_groups g on x.group_id = g.group_id
	) gr
	on p.pmid= gr.pmid
GO
