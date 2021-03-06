USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_MailList_test]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 04/29/2009
-- Description:	Create Mail List
-- =============================================
CREATE PROCEDURE  [dbo].[spaap_create_MailList_test]
(@in_co varchar(3),@in_udstores varchar(200),@in_aapstores varchar(200),@in_APIBusCls varchar(200),@in_corp varchar(200),@in_programs varchar(200),
@in_inex_udstores varchar(2),@in_inex_aapstores varchar(2),@in_inex_APIBusCls varchar(2),@in_inex_corp varchar(2),@in_inex_programs varchar(2),
@in_isNPP varchar(1))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--TEST DATA
--   SET @in_co = '1'
-- 	SET @in_aapstores = '0'  
--   SET @in_udstores = ' ''NPP''  '  
--   SET @in_APIBusCls = '0'
--   SET @in_corp = '0'
--  SET @in_inex_aapstores = 'i'
--   SET @in_inex_udstores = 'i'
--   SET @in_isNPP = 'Y'
--   SET @in_programs = 'MC'
--   SET @in_inex_programs = 'i'
--   SET @in_inex_corp = '0'
--       SET @in_corp = '''API-NPSC'''
-- SET @in_aapstores =  ' ''Pipco''  ' 
 --  SET @in_aapstores = '0'
-- SET @in_udstores = '0'
-- SET @in_udstores = ' ''Pipco'',''ML'',''NPP'',''Bashas''  '  
-- SET @in_aapstores = ' ''Pipco'',''Miami-Luken'',''NPP'',''Bashas''  '  
 -- 'C02','C06','C12','C14','C16','C17','C18',
 --SET @in_APIBusCls = '''C02'',''C06'',''C12'',''C14'',''C16'',''C17'',''C18'', '  


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

 
    DECLARE @SQL VARCHAR(2500);
    SET @SQL = '';
    DECLARE @WHERE_FOR_AAP VARCHAR(200);
    DECLARE @WHERE_FOR_AAP_PIPCO_NPP VARCHAR(200);
    DECLARE @WHERE_FOR_AAP_OTHER_STORE VARCHAR(200);
    DECLARE @WHERE_FOR_UD_STORES VARCHAR(200);
    DECLARE @AAP_BUS_CLS    VARCHAR(200);
    DECLARE @PROGRAMS_ONLY   VARCHAR(200);
    DECLARE @HQ_SELECT VARCHAR(1000);

    SET @WHERE_FOR_AAP  = '';
    SET @WHERE_FOR_AAP_PIPCO_NPP  = '';
    SET @WHERE_FOR_AAP_OTHER_STORE  = '';
    SET @WHERE_FOR_UD_STORES  = '';
    SET @AAP_BUS_CLS = '';
    SET @PROGRAMS_ONLY = '';
    SET @HQ_SELECT =  ' SELECT am.Source,am.AccountName,am.Addr1,am.Addr2,am.City,am.State,am.Zip,am.ContactFullName,am.ContactFirst,am.ContactLast, ' +
                             ' am.Territory,am.AreaCode,am.Phone,am.FaxAreaCode,am.Fax,am.Email,am.Status,am.BusinessClass,am.AAPAccountNo,AAPParentNo, ' +  
                             ' am.APIAccountNo,am.UDAccountNo,am.UDParentNo,cast('''' as varchar(10)) as ChainCode,cast('''' as varchar(25)) as type,  '+
                             ' cast(null as smallint) as IsNPP,cast('''' as varchar(50)) as GroupDesignation ';
 --Initialize
 

--Set  @WHERE_FOR_AAP
   IF(@in_co = '1' or @in_co = '12' or @in_co = '13' )
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE   aapaccountno is not null '
	END

   IF( @in_co = '2'  or @in_co = '12' )
	BEGIN
		SET  @WHERE_FOR_AAP =  ' WHERE   aapaccountno is not null and  udaccountno is not null '
	END
   IF( @in_co = '3' or @in_co = '13')
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE   aapaccountno is not null and  apiaccountno is not null '
	END
 
   IF(@in_co = '123' or @in_co = '23')
	BEGIN
        SET  @WHERE_FOR_AAP =  ' WHERE   aapaccountno is not null and  udaccountno is not null and  apiaccountno is not null ';
	END
   IF(@in_co = '24'   )
	BEGIN
		SET    @WHERE_FOR_AAP =  ' WHERE  udaccountno is not null '
    END
   IF(@in_co = '35'  )
	BEGIN
		SET    @WHERE_FOR_AAP =  ' WHERE   apiaccountno is not null '
    END
  
   IF(@in_co = '4'  )
       BEGIN
		SET    @WHERE_FOR_AAP =  ' WHERE   aapaccountno  is null and   udaccountno is not null '
       END
   IF(@in_co = '5'  )
	BEGIN
		SET    @WHERE_FOR_AAP =  ' WHERE   aapaccountno  is null and   apiaccountno is not null '
    END
  IF(@in_co = '0') -- Change this for All
	BEGIN
		SET @WHERE_FOR_AAP = ' WHERE (( aapaccountno is not null or aapaccountno is null )or ( apiaccountno is not null or apiaccountno is null) ' +
							 ' or ( udaccountno is not null or udaccountno is null)) ' ;
	END 

-- Pull out Npp
      IF( @in_isNPP = 'Y' and @in_inex_aapstores = 'e')
		BEGIN
			 SET @WHERE_FOR_AAP_PIPCO_NPP =   ' and  ( ( IsNpp = 0 or IsNpp is null) and ( type != ''NPP'' or type is null ) ) '; -- 0 is false
		END

      IF(@in_isNPP = 'Y' and @in_inex_aapstores = 'i')
		BEGIN --Need to add another paran here if other stuff
              IF(@in_aapstores = '0')
				BEGIN
					 SET @WHERE_FOR_AAP_PIPCO_NPP =   ' and ( (( type = ''NPP''  ) or  IsNpp = -1)) '; -- -1 i s true
                END
              ELSE
				BEGIN
					SET @WHERE_FOR_AAP_PIPCO_NPP =   ' and (( (( type = ''NPP''  ) or  IsNpp = -1)) '; -- -1 is true added one more paran to beginning
				END
          print (@WHERE_FOR_AAP_PIPCO_NPP )
		END
  

--Set @WHERE_FOR_AAP_PIPCO_NPP to filter out those in AAP that are Pipco  
   IF(@in_aapstores != '0' and @in_inex_aapstores = 'e' and @in_co != '4' ) -- Set to exclude
	   BEGIN
         SET @WHERE_FOR_AAP_OTHER_STORE =  ' and ((type not in ('+ @in_udstores + ' ) or type is null) and ( GroupDesignation not in ( '+
                                  @in_aapstores +'  ) or GroupDesignation is null)) ';    
       END

   IF(@in_aapstores != '0' and @in_inex_aapstores = 'i' and  @in_co != '4' ) -- Set to include only
	   BEGIN
		 IF(@in_isNPP = 'N')
			 BEGIN
				SET @WHERE_FOR_AAP_OTHER_STORE = ' and (type   in ('+ @in_udstores + ' ) or GroupDesignation in ('+ @in_aapstores + ') ) ';    
			 END
          IF(@in_isNPP = 'Y')
			 BEGIN 
                SET @WHERE_FOR_AAP_OTHER_STORE = ' or (type   in ('+ @in_udstores + ' ) or GroupDesignation in ('+ @in_aapstores + ') )) ';  
			 END
       END



      --  This is only for UD stores not in aap - don't want to look at GroupDesignation
      IF(@in_inex_udstores = 'e'  and @in_co = '4' and @in_aapstores != '0')
		BEGIN
			 SET @WHERE_FOR_UD_STORES = ' and (type not in ('+ @in_udstores + ') ) ';
		END
      IF(@in_inex_udstores = 'i' and @in_co = '4' and @in_aapstores != '0')
		BEGIN
			 SET @WHERE_FOR_UD_STORES = ' and (type in ('+ @in_udstores + ')  )) ';
		END

	-- This is for Managed Care
      IF((charindex('MC',@in_programs,0) > 0) and @in_inex_programs = 'i')
		BEGIN
			 SET @PROGRAMS_ONLY =   ' and ChainCode is not null ';
		END
      IF((charindex('MC',@in_programs,0) > 0) and @in_inex_programs = 'e')
		BEGIN
			 SET @PROGRAMS_ONLY =   ' and ChainCode is null ';
		END


	-- This is for the API Business Classes
     IF(@in_inex_APIBusCls = 'e' and @in_APIBusCls != '')
		BEGIN
			SET @AAP_BUS_CLS = ' and (BusinessClass   not in (' + @in_APIBusCls + ', ''C99'',''SDFT'') or businessclass is null) ';
		END
    IF(@in_inex_APIBusCls = 'i' and @in_APIBusCls != '')
		BEGIN
			SET @AAP_BUS_CLS = ' and (BusinessClass    in (' + @in_APIBusCls +') ) ';
		END

 	 SET @SQL = ' SELECT * from v_PharmacyMaster_MailingListForSP ' ;
          
	 SET @SQL = @SQL + @WHERE_FOR_AAP ;

   
     IF( @in_isNPP = 'Y')
		   BEGIN
		       SET @SQL = @SQL + @WHERE_FOR_AAP_PIPCO_NPP;
		   END

    IF(@in_aapstores != '0' )
		   BEGIN
		       SET @SQL = @SQL + @WHERE_FOR_AAP_OTHER_STORE;
		   END
    
     IF(@in_udstores != '0')
 	   BEGIN
	 	      SET @SQL = @SQL + @WHERE_FOR_UD_STORES;
       END
     IF(@in_programs != '0')
	   BEGIN
	      SET @SQL = @SQL + @PROGRAMS_ONLY;
		   END

     SET @SQL = @SQL + @AAP_BUS_CLS;
    -- IF(@in_corp != '0')
   --    BEGIN
      IF(@in_inex_corp = '0')
		 BEGIN
			 SET @SQL = @SQL + ' UNION ' +  @HQ_SELECT + ' FROM AAPCorporateMailList am where am.Source in (' + @in_corp + ')';
         END
      IF(@in_inex_corp = 'e' )
         BEGIN
             SET @SQL = @SQL + ' UNION ' +  @HQ_SELECT + ' FROM AAPCorporateMailList am where am.Source not in (' + @in_corp + ')';
         END
      IF(@in_inex_corp = 'i')
         BEGIN
             SET @SQL =  @HQ_SELECT + ' FROM AAPCorporateMailList am where am.Source in (' + @in_corp + ')';
         END
     PRINT (@SQL)
	 EXEC (@SQL)
 	
				 
END
GO
