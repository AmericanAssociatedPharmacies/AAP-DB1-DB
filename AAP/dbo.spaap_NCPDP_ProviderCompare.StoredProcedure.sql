USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_NCPDP_ProviderCompare]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ================================================================================================
-- This procedure updates the vendormaster table
-- to be insync with UDmain.volvndrs without any duplicates and TODO:UNITED.vendor, VNDLLABL.vendor
-- TODO: Change vvcopy to linked table
-- ================================================================================================

CREATE PROCEDURE [dbo].[spaap_NCPDP_ProviderCompare]
As

DECLARE @accountname varchar(150)
DECLARE @dea varchar(25)
DECLARE @count int
DECLARE @substr_name varchar(7)
DECLARE @SQL   varchar(500)
DECLARE @ncpdpName varchar(150)


Begin Transaction provComp

TRUNCATE table tmp_NCPDP_Comp
DECLARE  cu_Compare CURSOR
	FOR SELECT accountName,dea FROM pharmacymasterfortest  where dea is not null and dea != 'DEA - DEA'
	
	OPEN cu_Compare
	FETCH NEXT FROM cu_Compare INTO		
		@accountname,
		@dea			
	
	
	WHILE  (@@FETCH_STATUS = 0)
	
	BEGIN		
		SET @substr_name = substring(@accountname,1,7)
		DECLARE @holder  TABLE ( Acct_Name nvarchar(150), DEA varchar(25))

    	 INSERT    @holder  (Acct_Name,DEA)    
			 (SELECT name, dea from reporting..ncpdp_Provider where dea =   @dea  and name like '%'+@substr_name+'%')

		 If @@error <> 0 
				Begin
					Rollback Tran provComp
					CLOSE cu_Compare
					DEALLOCATE cu_Compare					
					Print 'Failed to insert into @holder table DEA: ' + @dea + ' AccountName ' + @accountname
					Return
				End	
	 
         print '%'+@substr_name+'%';
         IF not  exists (select top 1 null from @holder)
         BEGIN
         SET @ncpdpName = (select name from reporting..ncpdp_Provider where dea =   @dea )
         Insert into tmp_NCPDP_Comp (AccountName,DEA,NCPDPNameForDEA) values (@accountName,@dea,@ncpdpName);
         END

		 If @@error <> 0 
				Begin
					Rollback Tran provComp
					CLOSE cu_Compare
					DEALLOCATE cu_Compare					
					Print 'Failed to get record from NCPDP_Provider'
					Return
				End	 
	
		FETCH NEXT FROM cu_Compare INTO
			@accountname,
		    @dea
			

	END
	CLOSE cu_Compare
	DEALLOCATE cu_Compare

Commit Tran provComp
	








GO
