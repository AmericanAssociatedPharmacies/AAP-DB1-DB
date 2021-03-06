USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_MailList_orig]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 04/29/2009
-- Description:	Create Mail List
-- =============================================
CREATE PROCEDURE  [dbo].[spaap_create_MailList_orig]
(@in_co varchar(3),@in_udstores varchar(200),@in_aapstores varchar(3),@in_APIBusCls varchar(200),@in_corp varchar(100))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--TEST DATA
  --SET @in_co = '35'
  --SET @in_aapstores = '0'
  --SET @in_udstores = '0'
 -- SET @in_udstores = ' ''Pipco'',''ML'',''NPP'',''Bashas''  '  
 -- SET @in_APIBusCls = '0'
 -- 'C02','C06','C12','C14','C16','C17','C18',
 --SET @in_APIBusCls = '''C02'',''C06'',''C12'',''C14'',''C16'',''C17'',''C18'', '  
 -- SET @in_corp = '''API-NPSC'''
 -- SET @in_corp = '0'
   IF(@in_APIBusCls = '0')
		BEGIN
			SET @in_APIBusCls = '';
		END

	--END TEST DATA
    -- Comment on in Paramters
	--@in_co  1 = AAP Only , 2 = AAP and UD Only , 3 = AAP and UD and API (these are includes)
    --@in_aapstores 0 = None, 1 = Pipco, 2= NPP, 3 = Bashas (these are exclusions)
     --@in_udstores 0 = None, 1 = Pipco, 2= NPP, 3 = Bashas (these are exclusions)
    --@in_corp - a string is created at UI to select where IN ex: select from blahblah where blah in ('Pipco','Bashas') this is to include corporate addresses

 
    DECLARE @SQL VARCHAR(2000);
    SET @SQL = '';
    DECLARE @WHERE_FOR_AAP VARCHAR(200);
    DECLARE @WHERE_FOR_API VARCHAR(200);
    DECLARE @WHERE_FOR_UD VARCHAR(200);
    DECLARE @WHERE_FOR_UD_NO_MATCH VARCHAR(200);
    DECLARE @WHERE_FOR_API_NO_MATCH VARCHAR(200);
    DECLARE @AAP_BUS_CLS VARCHAR(200);

   IF(@in_co = '1' or @in_co = '12' or @in_co = '13' )
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE  am.aapaccountno is not null '
	END
   IF((@in_co = '1' or @in_co = '12' ) and  @in_udstores != '0')
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE  am.aapaccountno is not null and am.udaccountno is null'
	END
   IF( @in_co = '2' )
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE  am.aapaccountno is not null and am.udaccountno is not null '
	END
      IF( @in_co = '3' )
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE  am.aapaccountno is not null and am.apiaccountno is not null '
	END
 
    IF(@in_co = '123')
	BEGIN
        SET  @WHERE_FOR_AAP =  '';
	END


    IF(@in_co = '3' or @in_co = '13' or @in_co = '123'or @in_co = '35')
	BEGIN
		SET  @WHERE_FOR_API =  ' AND  am.apiaccountno is not null and am.aapaccountno is not null '
    END
   IF(@in_co = '23')
	BEGIN
		SET  @WHERE_FOR_API =  ' AND  am.apiaccountno is not null and am.aapaccountno is not null and am.udaccountno is not null '
	END
 

  IF(@in_co = '1' or @in_co = '2'or @in_co = '24' or @in_co = '12' or @in_co = '123')
	BEGIN
		SET  @WHERE_FOR_UD =  ' WHERE  am.udaccountno is not null and am.aapaccountno is not null '
    END
   IF(@in_co = '23')
	BEGIN
		SET  @WHERE_FOR_UD =  ' WHERE  am.apiaccountno is not null and am.aapaccountno is not null and am.udaccountno is not null '
	END

    IF(@in_co = '4' or @in_co = '24' )
	BEGIN
		SET    @WHERE_FOR_UD_NO_MATCH =  ' WHERE  am.aapaccountno  is null and  am.udaccountno is not null'
    END
    IF(@in_co = '5'  or @in_co = '35')
	BEGIN
		SET    @WHERE_FOR_API_NO_MATCH =  ' AND  am.aapaccountno  is null and  am.apiaccountno is not null'
    END

   
 
   SET @AAP_BUS_CLS = '(BusinessClass   not in (' + @in_APIBusCls + ' ''C99'',''SDFT'') or businessclass is null) ';



	 BEGIN
	 IF(@in_co = '1' or @in_co = '2'  or @in_co = '3' or @in_co = '13' or @in_co = '12'or @in_co = '123') -- Everything except 23 (UD and API)
		 BEGIN
		 SET @SQL = ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
					' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo  ' +  
					' FROM PharmacyMasterActive_Distinct am  ' ;
 
             IF(@in_aapstores = '0')
					SET @SQL = @SQL + @WHERE_FOR_AAP ;

              IF(@in_aapstores = '1')
				   BEGIN
                        SET @SQL = @SQL + ' JOIN aapaccount aap on am.aapaccountno = aap.aapid ' +
                                           @WHERE_FOR_AAP +
                                          ' and (GroupDesignation  != ''PIPCO'' or GroupDesignation is null)'; 
                   END
              IF(@in_aapstores = '2')
                   BEGIN
						SET @SQL = @SQL + ' JOIN aapaccount aap on am.aapaccountno = aap.aapid ' +
                                           @WHERE_FOR_AAP +
                                          ' and aap.IsNpp = 0 ';
                   END
              IF(@in_aapstores = '12')
				   BEGIN
                        SET @SQL = @SQL + ' JOIN aapaccount aap on am.aapaccountno = aap.aapid ' +
                                           @WHERE_FOR_AAP +
                                          ' and aap.IsNpp = 0 and (GroupDesignation  != ''PIPCO'' or GroupDesignation is null)'; 
                   END
               IF(@in_co = '3'or @in_co = '13'or  @in_co = '123' or @in_APIBusCls != '')
				BEGIN
                   SET @SQL =  @SQL + ' and ' + @AAP_BUS_CLS;
                END

		 END
     IF(@in_co = '3'or @in_co = '13'or @in_co = '23' or @in_co = '123' or @in_co = '35')  -- Anything with API
		 BEGIN
            IF ( @in_co = '3' or @in_co = '13'   or @in_co = '123')
				BEGIN
					 SET @SQL = @SQL + ' UNION ';
				END
			SET @SQL = @SQL + ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
					    ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo  ' +  
					    ' FROM PharmacyMasterActive_Distinct am where ' +
		                ' (BusinessClass   not in (' + @in_APIBusCls + ' ''C99'',''SDFT'')  or businessclass is null)' + @WHERE_FOR_API;
              print @sql;
         END
     IF(@in_co = '2' or @in_co = '12'or @in_co = '24' or @in_co = '23' or @in_co = '123' or (@in_co = '1' and @in_udstores != '0' )) -- Anything with UD Stores
		 BEGIN
              IF(@in_co != '24')
				BEGIN
					SET @SQL = @SQL + ' UNION ';
				END
				 
			SET @SQL = @SQL + ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
					 ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo  ' +  
					 ' FROM PharmacyMasterActive_Distinct am  ' + 
					 ' JOIN reporting.dbo.active_members_withtypes sm  on '+
					 ' am.udaccountno = sm.acct_no '+ @WHERE_FOR_UD;
		 
 
                    IF(@in_udstores != '0')
						BEGIN
							 SET @SQL = @SQL + ' and sm.type not in ('+ @in_udstores + ')';
						END
                    
			
            
		 END
--       IF(@in_corp != '0')
--       BEGIN
--           SET @SQL = @SQL + ' UNION ' + 
--                             ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
--                             ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo, ' +  
--                             ' am.APIAccountNo,am.UDAccountNo,am.UDParentNo '+
--                             ' FROM AAPCorporateMailList am where am.Source in (' + @in_corp + ')';
--       END

    --New Additions 
      IF(@in_co = '4' or @in_co = '24' )
         BEGIN
             IF(@in_co = '24')
             BEGIN
				SET @SQL = @SQL + ' UNION ' ;
			 END
			SET @SQL =  @SQL + ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
					 ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo  ' +  
					 ' FROM PharmacyMasterActive_Distinct am   ' +   @WHERE_FOR_UD_NO_MATCH;
            
         END 
     IF(@in_co = '5' or @in_co = '35')
         BEGIN
            IF(@in_co = '35')
             BEGIN
				SET @SQL = @SQL + ' UNION ' ;
           
			 END
		 SET @SQL = @SQL + ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
					    ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo,am.APIAccountNo,am.UDAccountNo,am.UDParentNo  ' +  
					    ' FROM PharmacyMasterActive_Distinct am where ' +
		                ' (BusinessClass   not in (' + @in_APIBusCls + ' ''C99'',''SDFT'')  or businessclass is null)' + @WHERE_FOR_API_NO_MATCH;
 
         END 
     IF(@in_corp != '0')
       BEGIN
           SET @SQL = @SQL + ' UNION ' + 
                             ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
                             ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo, ' +  
                             ' am.APIAccountNo,am.UDAccountNo,am.UDParentNo '+
                             ' FROM AAPCorporateMailList am where am.Source in (' + @in_corp + ')';
       END
   
	 EXEC (@SQL)
	 END	
				 
END
GO
