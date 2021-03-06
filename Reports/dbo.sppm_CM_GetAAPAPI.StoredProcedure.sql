USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CM_GetAAPAPI]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <5/11/2015>
-- Description:	Get valid Programs for Communications
-- =============================================
CREATE PROCEDURE [dbo].[sppm_CM_GetAAPAPI]
(@affiliates varchar(500),@programs varchar(500),@excludeMC varchar(2) ,@excludeML varchar(2),@includeMC varchar(2),@includeML varchar(2),
 @isNPP varchar(2),@isBashasHQOnly varchar(2),@isMLHQOnly varchar(2),@incAffHQOnly varchar(2),@listType varchar(20),@parentSelected varchar(10))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @SQL varchar(max)
SET @SQL = '';
DECLARE @ParentCode varchar(max);

DECLARE @affCode varchar(max);
DECLARE @proCode varchar(max);

DECLARE @excludeMCCode varchar(max);  
DECLARE @excludeMLCode varchar(max); 
DECLARE @includeMLCode varchar(max); 

DECLARE @emailListTypeCode  varchar(max); 
DECLARE @faxListTypeCode  varchar(max); 
DECLARE @emailFaxFaxListTypeCode  varchar(max); -- this is for when they are sending both fax and emails
DECLARE @listTypeCode  varchar(max);
SET @listTypeCode = '';

DECLARE @MCIncNPP varchar(max);
DECLARE @MCNoNPP varchar(max);

DECLARE @APIMCCode varchar(max);
DECLARE @APINoMCParentCode varchar(max);
DECLARE @AAPAPINoMCParentCode varchar(max);
DECLARE @IncAffHQOnlyCode varchar(max);

 

DECLARE @unionCode varchar(10);
 
SET @unionCode = ' UNION ';
 
--This will be for AAP Members only (or with MC or ML)
IF(@parentSelected = 'AAP')
	BEGIN
		SET @ParentCode =  ' SELECT  * from pharmacymaster..v_Address_CommMaster where AAPAccountNo is not null and
		AAPAccountNo != '''' and AAPQuitDate is null ';
	END

--This will be for API Customers only (or with MC or ML)
IF(@parentSelected = 'API')
	BEGIN
		SET @ParentCode =  ' SELECT  * from pharmacymaster..v_Address_CommMaster where APIAccountNo is not null and
		APIAccountNo != '''' and APIAccountNo not like ''%-%'' and APIStatus in (''Active'',''Suspended'')';
	END

--This will be for AAP Members and API Customers only (or with MC or ML)
IF(@parentSelected = 'AAPAPI')
	BEGIN
		SET @ParentCode = ' SELECT  * from pharmacymaster..v_Address_CommMaster where ((AAPAccountNo is not null and
		AAPAccountNo != '''' and AAPQuitDate is null ) or ( APIAccountNo is not null and
		APIAccountNo != '''' and APIAccountNo not like ''%-%'' and APIStatus in (''Active'',''Suspended'')) )';
	END

SET @emailListTypeCode = (SELECT EmailListTypeCode from CommCode);
SET @faxListTypeCode = (SELECT FaxListTypeCode from CommCode);
SET @emailFaxFaxListTypeCode= (SELECT EmailFaxFaxListTypeCode from CommCode);

-- Want to put in email or fax filters for the HQ as well
IF(@listType = 'e' or @listType = 'efe')  
	BEGIN
		SET @listTypeCode =   @emailListTypeCode;
	END
IF(@listType = 'f' )
	BEGIN
		SET @listTypeCode =   @faxListTypeCode;
	END
IF(@listType = 'eff')
	BEGIN
		SET @listTypeCode = @emailFaxFaxListTypeCode;
	END
 
SET @MCNoNPP = (SELECT IncludeMCNoNPPCode from CommCode);
 
SET @MCIncNPP =  (SELECT IncludeMCNPPCode from CommCode);

SET @APIMCCode = ' and ' + @MCIncNPP;

SET @APINoMCParentCode = ' SELECT  APIAccountNo from pharmacymaster..v_Address_CommMaster where APIAccountNo is not null and ' 
                        + 'APIAccountNo != '''' and APIAccountNo not like ''%-%'' and APIStatus in (''Active'',''Suspended'')' ;

SET @AAPAPINoMCParentCode = ' SELECT  pmid from pharmacymaster..v_Address_CommMaster where ((AAPAccountNo is not null and ' +
		' AAPAccountNo != '''' and AAPQuitDate is null ) or ( APIAccountNo is not null and  ' +
		' APIAccountNo != '''' and APIAccountNo not like ''%-%'' and APIStatus in (''Active'',''Suspended'')) )  ' +
        ' and ' + @MCIncNPP;
 
 
SET @affCode = ' select pmid from  pharmacymaster..pm_groups_xref   where group_id  in  (' + @affiliates  +')';
 
 
SET @proCode =  ' select pmid from pharmacymaster..PM_memberprograms   where programid in (' + @programs  + ') '+
' and startdate is not null and enddate is null ';

--This is only used if they've selected to include Affiliate HQ's only (not all affiliates)
SET @IncAffHQOnlyCode = ' SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where businessclass in (  '+
		  ' SELECT  businessclass from pharmacymaster..pm_corporate p  '+
			' join(  '+
			' select * from pharmacymaster..pm_groups where group_id in (' + @affiliates  +')  '+
			' ) a on p.businessclass = a.buscls ) ';
 
--SET @excludeMCCode = ' and (ChainCode is null or mcquitdate is not null) ';
SET @excludeMCCode =  (select ExcludeMCCode from CommCode);
--SET @excludeMLCode = ' and pmid not in (select pmid from dbo.PM_VendorAccts where vendorid = 44 ) ';
SET @excludeMLCode =  (select ExcludeMLCode from CommCode);

SET @includeMLCode =  (select IncludeMLCode from CommCode);

-- Now start code for query - start with the Parent -- if no other options set the SQL to just parent Code

IF(@affiliates = '0' and @programs  = '0' and @excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and 
 @isNPP  = '0' and @isBashasHQOnly  = '0' )
	BEGIN
		SET @SQL = @ParentCode;
    END
--Check to see if excluding Managed Care
--NEED TO PUT IN CODE TO WORK WITH ANY ABOVE SELECTIONS

 --NEW CODE BELOW TO DEAL WITH API DIFFERENTLY -SOME OF THE NPP's are API Customers
IF(@excludeMC != '0' and @SQL = '')
	BEGIN
		IF(@parentSelected  = 'AAP')
			BEGIN
				SET @SQL =  @ParentCode + @excludeMCCode;
			END
		ELSE IF (@parentSelected  = 'API')
			BEGIN
				SET @SQL =  @ParentCode + ' and APIAccountNo not in ( ' + @APINoMCParentCode + @APIMCCode + ')';
			END
       ELSE IF (@parentSelected  = 'AAPAPI')
			BEGIN
				SET @SQL =  @ParentCode + ' and PMID not in ( ' + @AAPAPINoMCParentCode + @APIMCCode + ')';
			END
	END 
ELSE IF (@excludeMC != '0' and @SQL != '')
	BEGIN
		IF(@parentSelected  = 'AAP')
			BEGIN
				SET @SQL =  @SQL + @excludeMCCode;
			END
		ELSE IF (@parentSelected  = 'API')
			BEGIN
				SET @SQL =  @SQL +    ' and APIAccountNo not in ( '  + @APINoMCParentCode + @APIMCCode + ')';
			END
       ELSE IF (@parentSelected  = 'AAPAPI')
			BEGIN
				SET @SQL =  @SQL + ' and PMID not in ( ' + @AAPAPINoMCParentCode + @APIMCCode + ')';
			END
	END 


--Check for Includes MC
 
IF(@includeMC != '0' and @excludeMC ='0') -- if they  do not want to exclude manage care

	BEGIN
      IF(@isNPP = '0') --If 0 says No NPP
		BEGIN
			IF(@parentSelected = 'AAP')
				BEGIN
					SET @SQL = @ParentCode +  ' and ' + @MCNoNPP;
				END
			ELSE 
				BEGIN
					SET @SQL = @ParentCode + @APIMCCode;
				END
		END
	  ELSE
		BEGIN -- Need to check to see if the Managed Care check box was checked - if not it will give NPP only
           IF(@parentSelected  = 'AAP')
				BEGIN
					IF(@includeMC != '0') -- IF MC was checked along with NPP with AAP as Parent
						BEGIN
							SET @SQL = ' SELECT  * from pharmacymaster..v_Address_CommMaster where  ' +  @MCIncNPP;
						END
				END
		  ELSE
		    	BEGIN
					IF(@includeMC != '0') -- IF MC was checked along with NPP with API or AAPAPI  as Parent
						BEGIN
							SET @SQL = @ParentCode + @APIMCCode;
						END
		    	END
		  END
    
	 END
 
--Check to see if excluding Miami Luken
IF(@excludeML != '0' and @SQL = '') -- Nothing prior included in SQL
	BEGIN
		SET @SQL = @ParentCode + @excludeMLCode; 
  
	END 
	ELSE IF (@excludeML != '0' and @SQL != '') -- Need to incorporate previous SQL generated
		BEGIN
			SET @SQL =  @SQL + @excludeMLCode;
  
		END 

 -- If there is code for Managed Care need to remove the affiliates because they've selected Affiliate HQ Only
IF ((@excludeMC != '0' or @includeMC != '0') and @SQL != '' and @incAffHQOnly = '1' )
		BEGIN
			SET @SQL =  @SQL  + '  and pmid not in (' + @affCode + ')' ;  
		END 
 
--Check to see if including Miami Luken  -- changed 061715
--IF(@includeML != '0'  and @SQL = '' and @excludeML = '0') -- Nothing prior included in SQL
IF(@includeML != '0'  and @SQL = '' and @excludeML = '0' and @isMLHQOnly = '0') -- Nothing prior included in SQL
	BEGIN
		SET @SQL = @ParentCode + @includeMLCode;
	END 


IF(@includeML != '0'  and @SQL != '' and @SQL  =  @ParentCode and @isMLHQOnly = '0' and @excludeML = '0') 
	BEGIN
 
		SET @SQL = @SQL + @includeMLCode
	END


 
--Bashas Only HQ  
IF(@isBashasHQOnly = '1')
	BEGIN
		IF(@SQL != '' and @includeMC != '0' ) --Need to include previous SQL
			BEGIN
                SET @SQL = @SQL + ' and pmid not in (select pmid from pharmacymaster..v_pm_allwithaffiliates  where groupno = ''11377'' )';
			END
        ELSE IF (@SQL = '' and @includeMC != '0' ) -- No prior SQL generated - include the Parent Code
				BEGIN
	                SET @SQL = @ParentCode + ' and pmid not in (select pmid from pharmacymaster..v_pm_allwithaffiliates  where groupno = ''11377'' )';
				END
	END 

 
IF(@isMLHQOnly = '1' )  -- If Miami Luken HQ is selected
	BEGIN
		IF(@SQL != '')
			BEGIN
				SET @SQL = @SQL + '  and pmid not in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 ) ';
			END
		ELSE
			BEGIN
			  SET @SQL = @ParentCode + '  and pmid not in (select pmid from pharmacymaster..PM_VendorAccts where vendorid = 44 ) ';
			END 
 	END

 
 -- CHANGED 06/29/2015
 IF(@incAffHQOnly = '1' and ((@includeML = '0' and @isMLHQOnly = '0') or @isMLHQOnly = '1' or @excludeML = '1'   ) and @includeMC = '0')
	BEGIN
		IF(@SQL != '')
			BEGIN
            
				SET @SQL = @SQL + '  and pmid not in (' + @affCode + ')' ;
           
			END
		ELSE
			BEGIN
			  SET @SQL = @ParentCode + '  and pmid not in (' + @affCode + ')' ;
			END 
	END

 --THIS IS START OF UNIONS
-- Want to put in email or fax filters if any before the first UNION
IF( @SQL != '')
	BEGIN
		SET @SQL = @SQL + @listTypeCode;
	END
--This was moved to be just before other unions -- PROBLEM HERE MEED TO ADD @ParentCode + @includeMLCode + LIST TYPE CODE
IF(@includeML != '0'  and @SQL != '' and  @SQL !=  @ParentCode + @includeMLCode + @listTypeCode  and @isMLHQOnly = '0' and @excludeML = '0') --changed used to end with ParentCode

	BEGIN
		SET @SQL = @SQL + ' UNION ' +  @ParentCode + @includeMLCode + @listTypeCode
	END
 
--New 6/22/2015 -- this was to exclude MC from the ML if they selected exclude Managed Care  -- take out if this isn't what they wanted Need to move this
IF(@includeML != '0' and @isMLHQOnly = '0' and @excludeMC !='0' and @SQL != '' and @excludeML = '0')

	BEGIN
		SET  @SQL = @SQL + @excludeMCCode;
	END 

 IF(@incAffHQOnly = '1' and @includeML != '0' and @isMLHQOnly = '0'  and @excludeML = '0')--If any code was generated that included the Union above need to check for affilate HQ only to remove it
	BEGIN
		IF(@SQL != '')
			BEGIN
				SET @SQL = @SQL + '  and pmid not in (' + @affCode + ')' ;
			END
		ELSE
			BEGIN
			  SET @SQL = @ParentCode + '  and pmid not in (' + @affCode + ')' ;
                 
			END 
	END
-- I think here to exclude Affiliates if Affiliate HQ only selected ---------------------------

--Need to put unions for HQ at end of all the rest - otherwise queries turned out wrong
--
--IF(@isBashasHQOnly = '1')
--	BEGIN
--		IF(@SQL != '' and @includeMC != '0' )
--			BEGIN
--                SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS''';
--			END
--        ELSE IF (@SQL = '' and @includeMC != '0' )
--				BEGIN
--                    SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS''';
--				END
--
-- END
--
--IF(@isBashasHQOnly = '1')
--	BEGIN
--		IF(@SQL != '' and @includeMC  = '0' )
--			BEGIN
--				IF(@isNPP !='0')
--					BEGIN
--                        SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS'''; --ADDED 060915
--					END
--				ELSE
--					BEGIN
--                        SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS'''; --ADDED 060915
--
--					END
--			END
--	END 

IF(@isBashasHQOnly = '1' and @includeMC != '0') 
	BEGIN
        SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-BASHAS''';
        -- Want to put in email or fax filters for the HQ as well
 
		SET @SQL = @SQL + @listTypeCode;
 
	END
 

--IF(@isMLHQOnly = '1' and @includeML = '0')
--	BEGIN
--	   SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-ML''';
--	   IF((@listType = 'e' or @listType = 'efe') and @SQL != '')
--			BEGIN
--				SET @SQL = @SQL + @emailListTypeCode;
--			END
--		IF(@listType = 'f' and @SQL != '')
--			BEGIN
--				SET @SQL = @SQL + @faxListTypeCode;
--			END
--		IF(@listType = 'eff' and @SQL != '')
--			BEGIN
--				SET @SQL = @SQL + @emailFaxFaxListTypeCode;
--			END
--	END

IF(@isMLHQOnly = '1' and @includeML != '0')
	BEGIN
       IF(@SQL = '' or (@SQL != '' and @SQL = @ParentCode)) -- I don't think this needs to be in here
			BEGIN
				SET @SQL = ' SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-ML''';
				SET @SQL = @SQL + @listTypeCode;
			END
 
		IF(@SQL != '' and @SQL != @ParentCode and @SQL != ' SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-ML''')
			BEGIN
			    SET @SQL = @SQL + ' UNION SELECT * from pharmacymaster..v_Address_CommMaster_Corporate where Source = ''UD-ML''';
                SET @SQL = @SQL + @listTypeCode;
			END
	END
 

-- Here maybe to add in any affiliates  start with a union with  previous code
-- '0' indciates no affiliates were selected
-- This addidtion to the SQL will pull affiliates and no programs

--Need to find out if you need a Union or if this is the start 
--This next set of code checks if anything   other than AAP Members was selected under the Parent Column 
--These if else are assuming there was something other than AAP Members  selected under the Parent Column 

--No Affiliate HQ - Affiliates and Programs selected when Include or Exclude of  Managed Care and Miami Luken were selected
 
IF((@excludeMC != '0' or @excludeML != '0' or @includeMC != '0'  or @includeML != '0') and ( @affiliates!='0' and  @programs !='0') and @incAffHQOnly = '0') 
	BEGIN
 
 
		   -- Want to put in email or fax filters if any before any of the following UNIONS -- MAY NOT NEED THIS ONE
			--SET @SQL = @SQL + @listTypeCode;


		   IF ((@includeMC != '0'  or @includeML != '0') and (@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly = '0')) -- Either of the includes and no excludes
				BEGIN
				   SET @SQL =  @SQL + @unionCode + @ParentCode + ' and pmid in (' + @affCode + ' )'  + @listTypeCode +   @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' ; 
				END 
           IF(@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly = '0') -- Excluded Managed Care Only
				BEGIN
				   SET @SQL =  @SQL + @unionCode + @ParentCode + ' and pmid in (' + @affCode + ' )' + @excludeMCCode + @listTypeCode +  @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' + @excludeMCCode; 
                END
           IF((@excludeMC = '0' and @excludeML != '0' and @isMLHQOnly = '0') or (@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly != '0'))-- Excluded Miami Luken Only or Miami Luke HQ Only
               BEGIN
				   SET @SQL =  @SQL + @unionCode + @ParentCode + ' and pmid in (' + @affCode + ' )' + @excludeMLCode + @listTypeCode +  @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' + @excludeMLCode; 
                END
            IF((@excludeMC != '0' and @excludeML != '0' and @isMLHQOnly = '0') or (@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly != '0')) -- Excluded Managed Care and ( Miami Luken Only or Miami Luke HQ Only )
               BEGIN
				   SET @SQL =  @SQL + @unionCode + @ParentCode + ' and pmid in (' + @affCode + ' )' + @excludeMLCode +   @excludeMCCode + @listTypeCode + @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' + @excludeMLCode + @excludeMCCode; 
                END
            SET @SQL = @SQL + @listTypeCode;

	END
--No Affiliate HQ - Only Programs selected when Include or Exclude of  Managed Care and Miami Luken were selected
ELSE IF((@excludeMC != '0' or @excludeML != '0' or @includeMC != '0'  or @includeML != '0') and ( @affiliates ='0' and  @programs !='0') and @incAffHQOnly = '0')  
	BEGIN

            		   -- Want to put in email or fax filters if any before any of the following UNIONS - MAY NOT NEED
		--	SET @SQL = @SQL + @listTypeCode;

			IF ((@includeMC != '0'  or @includeML != '0') and (@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly = '0')) -- Either of the includes and no excludes
				BEGIN
					SET @SQL = @SQL +  @unionCode  + @ParentCode + ' and pmid in (' + @proCode + ')' ;
				END
            IF(@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly = '0') -- Excluded Managed Care Only
				BEGIN
					SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' + @excludeMCCode ; 
				END 
            IF((@excludeMC = '0' and @excludeML != '0' and @isMLHQOnly = '0') or (@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly != '0'))-- Excluded Miami Luken Only or Miami Luke HQ Only
               BEGIN
					SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' + @excludeMLCode ; 
			   END
			IF((@excludeMC != '0' and @excludeML != '0' and @isMLHQOnly = '0') or (@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly != '0')) -- Excluded Managed Care and ( Miami Luken Only or Miami Luke HQ Only )
               BEGIN
					SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')' + @excludeMLCode +   @excludeMCCode ; 
			   END
          SET @SQL = @SQL + @listTypeCode;
	END
--No Affiliate HQ - Affiliates Only - No Programs selected when Include or Exclude of  Managed Care and Miami Luken were selected
ELSE IF((@excludeMC != '0' or @excludeML != '0' or @includeMC != '0' or @includeML != '0') and ( @affiliates !='0' and  @programs ='0') and @incAffHQOnly = '0')  
	BEGIN

        		   -- Want to put in email or fax filters if any before any of the following UNIONS -- MAY NOT NEED
			--SET @SQL = @SQL + @listTypeCode;

		IF ((@includeMC != '0'  or @includeML != '0') and (@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly = '0')) -- Either of the includes and no excludes
			BEGIN
              SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @affCode + ')'  ; 
			END
        IF(@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly = '0') -- Excluded Managed Care Only
			BEGIN
				SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @affCode + ')' + @excludeMCCode ; 
			END 
        IF((@excludeMC = '0' and @excludeML != '0' and @isMLHQOnly = '0') or (@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly != '0'))-- Excluded Miami Luken Only or Miami Luke HQ Only
            BEGIN
				SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @affCode + ')' + @excludeMLCode ; 
			END
		IF((@excludeMC != '0' and @excludeML != '0' and @isMLHQOnly = '0') or (@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly != '0')) -- Excluded Managed Care and ( Miami Luken Only or Miami Luke HQ Only )
           BEGIN
				SET @SQL = @SQL +  @unionCode + @ParentCode + ' and pmid in (' + @affCode + ')' +  @excludeMLCode +   @excludeMCCode ;  ; 
		   END 
        SET @SQL = @SQL + @listTypeCode;
	END


-- Want Affil HQ Only - no programs selected
ELSE IF((@excludeMC != '0' or @excludeML != '0' or @includeMC != '0'  or @includeML != '0' ) and ( @affiliates!='0' and  @programs  ='0') and @incAffHQOnly = '1') 
	BEGIN
     		   -- Want to put in email or fax filters if any before any of the following UNIONS
		--SET @SQL = @SQL + @listTypeCode;
		SET @SQL = @SQL + @unionCode + @IncAffHQOnlyCode + @listTypeCode;  

  
	END 
 -- Want Affil HQ Only - with programs --  and either something in Managed Care or Miami Luken was selected
ELSE IF((@excludeMC != '0' or @excludeML != '0' or @includeMC != '0'  or @includeML != '0') and ( @affiliates!='0' and  @programs  !='0') and @incAffHQOnly = '1')
	BEGIN

        		   -- Want to put in email or fax filters if any before any of the following UNIONS
		

        IF(@excludeMC != '0' and @excludeML = '0' and @isMLHQOnly = '0')
		BEGIN
			SET @SQL = @SQL + @unionCode + @IncAffHQOnlyCode + @listTypeCode+ @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')'  +  ' and pmid not  in (' +  @affCode + ')'  + @excludeMCCode; 
		END
		IF(@excludeMC = '0' and (@excludeML != '0'or @isMLHQOnly != '0'))
		BEGIN
			SET @SQL = @SQL + @unionCode + @IncAffHQOnlyCode +  @listTypeCode + @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')'  +  ' and pmid not  in (' +  @affCode + ')' + @excludeMLCode ; 
		END
		IF(@excludeMC != '0' and (@excludeML != '0'or @isMLHQOnly != '0'))
		BEGIN
			SET @SQL = @SQL + @unionCode + @IncAffHQOnlyCode + @listTypeCode  + @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')'  +  ' and pmid not  in (' +  @affCode + ')' + @excludeMLCode  + @excludeMCCode; 
		END
		IF(@excludeMC = '0' and @excludeML = '0' and @isMLHQOnly = '0')
		BEGIN
			SET @SQL = @SQL + @unionCode + @IncAffHQOnlyCode +  @listTypeCode +  @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')'  +  ' and pmid not  in (' +  @affCode + ')'  ;
		END
 
          -- Want to put in email or fax filters if any of previous code was executed because they all have a union
		SET @SQL = @SQL + @listTypeCode;
     END
 
 

--- Affiliate HQ and no programs and no Managed Care or Miami Luken
IF((@excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and @includeML  = '0') and   @affiliates!='0' and  @programs  ='0'  and @incAffHQOnly = '1') 
	BEGIN
		SET @SQL =   @IncAffHQOnlyCode + @listTypeCode + @unionCode + @ParentCode  +  ' and pmid not  in (' +  @affCode + ')'; -- CHANGED 6/23/15
        SET @SQL = @SQL + @listTypeCode;
	END
--  Affiliate HQ and Programs and no Managed Care or Miami Luken
IF((@excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and @includeML  = '0' ) and   @affiliates!='0' and  @programs  !='0'  and @incAffHQOnly = '1') 
	BEGIN
		SET @SQL = @IncAffHQOnlyCode +  @listTypeCode + @unionCode + @ParentCode  + ' and pmid in (' + @proCode + ')'  +  ' and pmid not  in (' +  @affCode + ')'
       SET @SQL = @SQL + @listTypeCode;
	END
--  Affiliates only - No Affiliate HQ affiliates and No Programs and no Managed Care or Miami Luken
IF((@excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and @includeML  = '0') and @affiliates != '0' and @programs = '0'  and @incAffHQOnly = '0')
	BEGIN
		SET @SQL = @ParentCode + ' and pmid in (' +  @affCode + ')';
        SET @SQL = @SQL + @listTypeCode;
	END 
--  Affiliates and Programs No Affiliate HQ  and no Managed Care or Miami Luken
IF((@excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and @includeML  = '0') and   @affiliates!='0' and  @programs  !='0'  and @incAffHQOnly = '0') 
	BEGIN
		SET @SQL = @ParentCode + ' and pmid in (' + @affCode + ' )'  + @listTypeCode +   @unionCode + @ParentCode + ' and pmid in (' + @proCode + ')'; 
        SET @SQL = @SQL + @listTypeCode;
	END
--  Programs only - No Affiliate HQ NO affiliates  and no Managed Care or Miami Luken
IF((@excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and @includeML  = '0') and @affiliates  = '0' and @programs != '0'  and @incAffHQOnly = '0')
	BEGIN
		SET @SQL = @ParentCode + ' and pmid in (' +  @proCode + ')';
        SET @SQL = @SQL + @listTypeCode;
	END 

--Yeah don't know if this is right - putting in at end because all of this code for affilates and programs either
-- has a union in it or parent code that would need the email fax at the end
--IF((@excludeMC  = '0' and @excludeML  = '0' and @includeMC  = '0' and @includeML  = '0') and (@affiliates  != '0' or  @programs != '0'))
--	BEGIN
--       -- Want to put in email or fax filters if any of previous code was executed because they all have a union
--		SET @SQL = @SQL + @listTypeCode;
--	END
PRINT @SQL; 

EXEC (@SQL)
 
END
 









GO
