USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_update_PMUpdate_Active_staging_AcctNo]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update account numbers for the  AccountMasterActive_Distinct table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_update_PMUpdate_Active_staging_AcctNo]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  

-- Case:1 Update AAP with UDAccountNO
	UPDATE  am  set 
			UDAccountNo =   aap.UDAccountNo ,
            UDParentNo = aap.UDParentNo 
	   FROM PMUpdate_Active_staging am 
	   join 
	  (select ud.UDAccountNo,ud.UDParentNo ,ud.dea from PMUpdate_Active_staging aap 
				join (select * from PMUpdate_Active_staging where source = 'UD')ud
	  on aap.dea = ud.dea where aap.source = 'AAP' ) aap
      on aap.dea   = am.dea where am.source = 'AAP'

-- Case:2 Update AAP with APIAccountNO
	UPDATE  am  set 
			APIAccountNo =   aap.APIAccountNo  ,
            --BusinessClass = aap.BusinessClass, -- changed so the closed status is not copied over when there are other accounts with dea (it would be filter out on mailing lists)
            BusinessClass = 
                CASE WHEN (aap.BusinessClass = 'CZZ' and aap.AAPAccountNo is null and aap.UDAccountNo is null ) or aap.BusinessClass  != 'CZZ'
				THEN aap.BusinessClass ELSE null END,
            Wholesaler = aap.Wholesaler,
            CAHStatus = aap.CAHStatus,
            CardinalDC = aap.CardinalDC,
            PrimaryCAAccountNo = aap.PrimaryCAAccountNo , 
            ContractDate = aap.ContractDate,
            QPS = aap.QPS
	   FROM PMUpdate_Active_staging am 
	   join 
	  (select api.APIAccountNo ,api.AAPAccountNo ,api.UDAccountNo, api.dea ,api.BusinessClass, api.Wholesaler,api.CAHStatus,api.CardinalDC,api.PrimaryCAAccountNo  ,
               api.Territory,api.ContractDate,api.QPS   from PMUpdate_Active_staging aap 
				join (select * from PMUpdate_Active_staging where source = 'API')api
	  on aap.dea = api.dea where aap.source = 'AAP' ) aap
      on aap.dea   = am.dea where am.source = 'AAP'

-- Case:3 Update UD with APIAccountNO

	UPDATE  am  set 
			APIAccountNo =   ud.APIAccountNo,
            BusinessClass = 
                CASE WHEN (ud.BusinessClass = 'CZZ' and ud.AAPAccountNo is null and ud.UDAccountNo is null ) or ud.BusinessClass  != 'CZZ'
				THEN ud.BusinessClass ELSE null END,
           Wholesaler = ud.Wholesaler,
           CAHStatus = ud.CAHStatus,
           CardinalDC = ud.CardinalDC,
           PrimaryCAAccountNo = ud.PrimaryCAAccountNo , 
           ContractDate = ud.ContractDate,
           QPS = ud.QPS  
	   FROM PMUpdate_Active_staging am 
	   join 
	  (select api.APIAccountNo ,api.AAPAccountNo ,api.UDAccountNo, api.dea ,api.BusinessClass,
                api.Wholesaler,  api.CAHStatus,api.CardinalDC ,api.PrimaryCAAccountNo,api.ContractDate,api.QPS from PMUpdate_Active_staging ud 
				join (select * from PMUpdate_Active_staging where source = 'API')api
	  on ud.dea = api.dea where ud.source = 'UD' ) ud
      on ud.dea   = am.dea where am.source = 'UD'

-- Case:4 Update UD with AAPAccountNO

	UPDATE  am  set 
			AAPAccountNo =   ud.AAPAccountNo,
            AAPParentNo = ud.AAPParentNo  
	   FROM PMUpdate_Active_staging am 
	   join 
	  (select aap.AAPAccountNo,aap.AAPParentNo ,aap.dea from PMUpdate_Active_staging ud 
				join (select * from PMUpdate_Active_staging where source = 'AAP')aap
	  on ud.dea = aap.dea where ud.source = 'UD' ) ud
      on ud.dea   = am.dea where am.source = 'UD'

-- Case:5 Update API with UDAccountNO

	UPDATE  am  set 
			UDAccountNo =   api.UDAccountNo ,
             UDParentNo =   api.UDParentNo  ,
            ChainCode = api.ChainCode -- added JMW need to get chaincode in for matches with API
	   FROM PMUpdate_Active_staging am 
	   join 
	  (select ud.UDAccountNo,ud.UDParentNo ,ud.dea, ud.ChainCode from PMUpdate_Active_staging api 
				join (select * from PMUpdate_Active_staging where source = 'UD')ud
	  on api.dea = ud.dea where api.source = 'API' ) api
      on api.dea   = am.dea where am.source = 'API'

-- Case:6 Update API with AAPAccountNO

	UPDATE  am  set 
			AAPAccountNo =   api.AAPAccountNo  ,
            AAPParentNo = api.AAPParentNo   ,
             ChainCode = api.ChainCode -- added JMW need to get chaincode in for matches with API
	   FROM PMUpdate_Active_staging am 
	   join 
	  (select aap.AAPAccountNo,aap.AAPParentNo ,aap.dea  , aap.ChainCode from PMUpdate_Active_staging api 
				join (select * from PMUpdate_Active_staging where source = 'AAP')aap
	  on api.dea = aap.dea where api.source = 'API' ) api
      on api.dea   = am.dea where am.source = 'API'


    END









GO
