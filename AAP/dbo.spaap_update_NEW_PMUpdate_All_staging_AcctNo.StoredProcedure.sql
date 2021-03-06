USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_update_NEW_PMUpdate_All_staging_AcctNo]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update account numbers  and other fields in staging table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_update_NEW_PMUpdate_All_staging_AcctNo]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  

-- Case:1 Update AAP with UDAccountNO
	UPDATE  am  set 
			UDAccountNo =   aap.UDAccountNo ,
            UDParentNo = aap.UDParentNo ,
            UDQuitDate = aap.UDQuitDate,
            UDStatus = aap.UDStatus
	   FROM NEW_PMUpdate_All_staging am 
	   join 
	  (select ud.UDAccountNo,ud.UDParentNo ,ud.dea ,ud.UDQuitDate,ud.UDStatus from NEW_PMUpdate_All_staging aap 
				join (select * from NEW_PMUpdate_All_staging where source = 'UD')ud
	  on aap.dea = ud.dea where aap.source = 'AAP' ) aap
      on aap.dea   = am.dea where am.source = 'AAP'



-- Case:2 Update UD with APIAccountNO -- didn't copy over other api fields here because api outranks UD and it will be there 
			-- Edited added in BusinessClass because if the api is inactive and ud is active ud will outrank 

	UPDATE  am  set 
			APIAccountNo =   ud.APIAccountNo ,
            BusinessClass = 
                CASE WHEN (ud.BusinessClass = 'CZZ' and ud.AAPAccountNo is null and ud.UDAccountNo is null ) or ud.BusinessClass  != 'CZZ'
				THEN ud.BusinessClass ELSE null END,
           Wholesaler = ud.Wholesaler,
		   WholesalerAccountNo = ud.WholesalerAccountNo, -- Added JMW 041610
		   APIMemberNo  = ud.APIMemberNo, -- Added JMW 041610
           DateOpened = ud.DateOpened,      -- Added JMW 041610  
           CAHStatus = ud.CAHStatus,
           CardinalDC = ud.CardinalDC,
           PrimaryCAAccountNo = ud.PrimaryCAAccountNo , 
           ContractDate = ud.ContractDate,
           CustPayTermsAPI = ud.CustPayTermsAPI,
           APIStatus = ud.APIStatus,
           QPS = ud.QPS
	   FROM NEW_PMUpdate_All_staging am 
	   join 
	  (select api.APIAccountNo ,api.AAPAccountNo ,api.UDAccountNo, api.dea ,api.BusinessClass,
                api.Wholesaler,api.WholesalerAccountNo,api.APIMemberNo,api.DateOpened,
                api.CAHStatus,api.CardinalDC ,api.PrimaryCAAccountNo,api.ContractDate,api.QPS,
                api.CustPayTermsAPI,api.APIStatus from NEW_PMUpdate_All_staging ud 
				join (select * from NEW_PMUpdate_All_staging where source = 'API')api
	  on ud.dea = api.dea where ud.source = 'UD' ) ud
      on ud.dea   = am.dea where am.source = 'UD'

-- Case:3 Update UD with AAPAccountNO

	UPDATE  am  set 
			AAPAccountNo =   ud.AAPAccountNo,
            AAPParentNo = ud.AAPParentNo , 
            AAPQuitDate = ud.AAPQuitDate,
            AAPStatus = ud.AAPStatus
	   FROM NEW_PMUpdate_All_staging am 
	   join 
	  (select aap.AAPAccountNo,aap.AAPParentNo ,aap.dea,aap.AAPQuitDate,aap.AAPStatus from NEW_PMUpdate_All_staging ud 
				join (select * from NEW_PMUpdate_All_staging where source = 'AAP')aap
	  on ud.dea = aap.dea where ud.source = 'UD' ) ud
      on ud.dea   = am.dea where am.source = 'UD'

-- Case:4 Update API with UDAccountNO

	UPDATE  am  set 
			UDAccountNo =   api.UDAccountNo ,
            UDParentNo =   api.UDParentNo  ,
            UDQuitDate = api.UDQuitDate,
            UDStatus = api.UDStatus,
            -- added JMW need to get chaincode in for matches with API - only copy if quitdate is null
          -- ChainCode = CASE WHEN api.UDQuitDate is null then api.ChainCode ELSE NULL END - changed again to always copy chain code
           ChainCode =   api.ChainCode  
	   FROM NEW_PMUpdate_All_staging am 
	   join 
	  (select ud.UDAccountNo,ud.UDParentNo ,ud.dea,ud.ChainCode,ud.UDQuitDate,ud.UDStatus  from NEW_PMUpdate_All_staging api 
				join (select * from NEW_PMUpdate_All_staging where source = 'UD')ud
	  on api.dea = ud.dea where api.source = 'API' ) api
      on api.dea   = am.dea where am.source = 'API'

-- Case:5 Update API with AAPAccountNO

	UPDATE  am  set 
			AAPAccountNo =   api.AAPAccountNo  ,
            AAPParentNo = api.AAPParentNo,
            AAPQuitDate = api.AAPQuitDate,
            AAPStatus = api.AAPStatus,
            -- added JMW need to get chaincode in for matches with API
            -- ChainCode = CASE WHEN api.AAPQuitDate is null then api.ChainCode ELSE NULL END - changed again to always copy chain code
            ChainCode =  api.ChainCode  
	   FROM NEW_PMUpdate_All_staging am 
	   join 
	  (select aap.AAPAccountNo,aap.AAPParentNo ,aap.dea ,aap.ChainCode,aap.AAPQuitDate,aap.AAPStatus  from NEW_PMUpdate_All_staging api 
				join (select * from NEW_PMUpdate_All_staging where source = 'AAP')aap
	  on api.dea = aap.dea where api.source = 'API' ) api
      on api.dea   = am.dea where am.source = 'API'

-- Case:6 Update AAP with APIAccountNO (need to put this last when put in case statement for BusinessClass - changed JMW
	UPDATE  am  set 
			APIAccountNo =   aap.APIAccountNo  ,
            --BusinessClass = aap.BusinessClass, -- changed so the closed status is not copied over when there are other accounts with dea (it would be filter out on mailing lists)
            BusinessClass = 
                CASE WHEN (aap.BusinessClass = 'CZZ' and aap.AAPAccountNo is null and aap.UDAccountNo is null ) or aap.BusinessClass  != 'CZZ'
				THEN aap.BusinessClass ELSE null END,
            Wholesaler = aap.Wholesaler,
            WholesalerAccountNo = aap.WholesalerAccountNo, -- Added JMW 041610
		    APIMemberNo  = aap.APIMemberNo, -- Added JMW 041610
            DateOpened = aap.DateOpened,      -- Added JMW 041610  
            CAHStatus = aap.CAHStatus,
            CardinalDC = aap.CardinalDC,
            PrimaryCAAccountNo = aap.PrimaryCAAccountNo , 
            ContractDate = aap.ContractDate,
            CustPayTermsAPI = aap.CustPayTermsAPI,
            APIStatus = aap.APIStatus,
            NumReactivated = aap.NumReactivated,
            QPS = aap.QPS
	   FROM NEW_PMUpdate_All_staging am 
	   join 
	  (select api.APIAccountNo ,api.AAPAccountNo ,api.UDAccountNo, api.dea ,api.BusinessClass, api.Wholesaler,
               api.WholesalerAccountNo,api.APIMemberNo,api.DateOpened,
               api.CAHStatus,api.CardinalDC,api.PrimaryCAAccountNo  ,
               api.Territory,api.ContractDate,api.QPS, api.CustPayTermsAPI,api.APIStatus ,api.NumReactivated   from NEW_PMUpdate_All_staging aap 
				join (select * from NEW_PMUpdate_All_staging where source = 'API')api
	  on aap.dea = api.dea where aap.source = 'AAP' ) aap
      on aap.dea   = am.dea where am.source = 'AAP'
    END









GO
