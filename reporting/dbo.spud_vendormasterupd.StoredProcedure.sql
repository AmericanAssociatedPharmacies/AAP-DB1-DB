USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_vendormasterupd]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ================================================================================================
-- This procedure updates the vendormaster table
-- to be insync with UDmain.volvndrs without any duplicates and TODO:UNITED.vendor, VNDLLABL.vendor
-- TODO: Change vvcopy to linked table
-- ================================================================================================

CREATE PROCEDURE [dbo].[spud_vendormasterupd]
As

DECLARE @vendorname nvarchar(25)
DECLARE @active bit
DECLARE @effectdate smalldatetime
DECLARE @vendorid int
DECLARE @vendorpair int
DECLARE @status int
DECLARE @prevvendorname nvarchar(25)
DECLARE @count int


Begin Transaction venupd

----------------------------Delete existing vendors---------------------------------------------
Delete from vendormaster
 If @@error <> 0 
					Begin
						Rollback Tran venupd											
						Print 'Failed to delete'
						Return
					End	 

----------------------------Add all unique vendors to vendor master table---------------------------

select @prevvendorname = 'test'
DECLARE  cu_vendor CURSOR
	FOR SELECT vendor,[active?],vendor_id FROM vvcopy order by vendor
	
	OPEN cu_vendor
	FETCH NEXT FROM cu_vendor INTO		
		@vendorname,
		@active,			
		@vendorid
	
	WHILE  (@@FETCH_STATUS = 0)
	
	BEGIN		
		

		If UPPER(RTRIM(@prevvendorname)) <> UPPER(RTRIM(@vendorname))
		
			Insert into vendormaster(vendorname, effectivedate, oldvendorid, vendorpair) 
			select vendor, effectdate,vendor_id,vendorpair from VVcopy where vendor_id = @vendorid 
			
			 If @@error <> 0 
					Begin
						Rollback Tran venupd
						CLOSE cu_vendor
						DEALLOCATE cu_vendor					
						Print 'Failed to insert vendor'
						Return
					End	 
			
-------------------------------------UPDATE STATUS-----------------------------------------------------------

			Select @status=1
					
			if (@vendorname = 'CARD ADMIN REBATE' OR @vendorname = 'CARDPIPADMIN' OR @vendorname = 'ML ADMIN' OR @active = 'False' )
			Begin
				Select @status = 2
			End 

			Update vendormaster set status = @status where oldvendorid = @vendorid

				If @@error <> 0 
					Begin
						Rollback Tran venupd
						CLOSE cu_vendor
						DEALLOCATE cu_vendor					
						Print 'Failed to update vendor'
						Return
					End	
			Select @prevvendorname = @vendorname 
		
	
		FETCH NEXT FROM cu_vendor INTO
			@vendorname,
			@active,			
			@vendorid
			

	END
	CLOSE cu_vendor
	DEALLOCATE cu_vendor

---------------------Check if vendorpair of a vendor exist in the vendormaster table, if so tag them ------------

	Update vendormaster set diffname = 1 where vendorpair in  (select oldvendorid from vendormaster)
	If @@error <> 0 
					Begin
						Rollback Tran venupd											
						Print 'Failed to update diffname'
						Return
					End	


Commit Tran venupd
	








GO
