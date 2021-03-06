USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PatDivRebate_mailmerge_Bashas]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE
[dbo].[sppm_PatDivRebate_mailmerge_Bashas]
(@include_Bashas varchar(1))


AS
-- NOTE the sppm_PatDivRebate_mailmerge must have already run before this 


BEGIN
 
	
	IF(@include_Bashas = 1)
		BEGIN
			-- BASHAS only
			SELECT m.* FROM  reports..tmp_PatDiv_mailmerge m
			join
			(
				SELECT * FROM pharmacymaster..pm_pharmacy where groupno    = '11377'  
			) b
			on m.[vendor id] = b.pmid
		END
	ELSE
		BEGIN
			-- All with No Bashas
			SELECT m.* FROM  reports..tmp_PatDiv_mailmerge m
			join
			(
				SELECT * FROM pharmacymaster..pm_pharmacy where groupno   != '11377' or aapparentno is null
			) b
			on m.[vendor id] = b.pmid
		END

 
END



GO
