USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spDelete_test_plot]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spDelete_test_plot]
with execute as 'devuser'
as
select * from testdb..slx_fieldmap --pharmacymaster..v_test2 --reports..tmp_ControlSub_3mo
return
GO
