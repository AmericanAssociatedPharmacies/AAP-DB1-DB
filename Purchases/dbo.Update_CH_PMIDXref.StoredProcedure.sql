USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[Update_CH_PMIDXref]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Rudy Hinojosa
-- Create date: 7-8-2010
-- Description:	Populates purchases..ch_pmidxref from tables chph_aap,chph_api and chph_ud for matching to the API website.
-- =============================================
CREATE PROCEDURE [dbo].[Update_CH_PMIDXref] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
DECLARE @objNo VARCHAR(50)
DECLARE @objName VARCHAR(50)
DECLARE @bIsResearched SMALLINT
DECLARE @address VARCHAR(255)
DECLARE @city varchar(255)
DECLARE @state varchar(50)
DECLARE @zip varchar(50)

SET	@objName = ''
set @objNo = ''
set @bIsResearched = 0
set @address = ''
set @city = ''
set @state = ''
set @zip = ''

--only delete non researched records incase of updates
delete purchases..ch_pmidxref where isresearched = 0

WHILE	@objNo IS NOT NULL
	BEGIN
		select distinct @objNo = MIN (chaccountno) from pharmacymaster..chaap_sales where pmid is null 
		AND chaccountno > @objNo

		IF	@objNo IS NOT NULL
			select top 1 @objName = accountname from pharmacymaster..chaap_sales where chaccountno = @objNo
			select top 1 @address = address,@city = city, @state = state, @zip = zip from pharmacymaster..chaap_sales where chaccountno = @objNo
			Select @bIsReSearched = max (isresearched) from purchases..ch_pmidxref where chaccountno = @objNo
			if @bIsResearched = 0 or @bisResearched is null
				insert into purchases..ch_pmidxref (chaccountno,accountname,address,city,state,zip) values (@objNo,@objName,@address,@city,@state,@zip)
				
END
SET	@objName = ''
SET @objNo = ''
SET @bIsResearched = 0
set @address = ''
set @city = ''
set @state = ''
set @zip = ''

WHILE	@objNo IS NOT NULL
	BEGIN
		select distinct @objNo = MIN (chaccountno) from pharmacymaster..chaap_admin where pmid is null 
		AND chaccountno > @objNo

		IF	@objNo IS NOT NULL
			select top 1 @objName = accountname from pharmacymaster..chaap_admin where chaccountno = @objNo
			Select @bIsReSearched = max (isresearched) from purchases..ch_pmidxref where chaccountno = @objNo
			if @bIsResearched = 0 or @bisResearched is null
				insert into purchases..ch_pmidxref (chaccountno,accountname) values (@objNo,@objName)
				
END
SET	@objName = ''
SET @objNo = ''
SET @bIsResearched = 0
set @address = ''
set @city = ''
set @state = ''
set @zip = ''

WHILE	@objNo IS NOT NULL
	BEGIN
		select distinct @objNo = MIN (chaccountno) from pharmacymaster..chaap_genrebate where pmid is null 
		AND chaccountno > @objNo

		IF	@objNo IS NOT NULL
			select top 1 @objName = accountname from pharmacymaster..chaap_genrebate where chaccountno = @objNo
			select top 1 @address = address,@city = city, @state = state, @zip = zip from pharmacymaster..chaap_genrebate where chaccountno = @objNo			
			Select @bIsReSearched = max (isresearched) from purchases..ch_pmidxref where chaccountno = @objNo
			if @bIsResearched = 0 or @bisResearched is null
				insert into purchases..ch_pmidxref (chaccountno,accountname,address,city,state,zip) values (@objNo,@objName,@address,@city,@state,@zip)
				
END
SET	@objName = ''
SET @objNo = ''
SET @bIsResearched = 0
set @address = ''
set @city = ''
set @state = ''
set @zip = ''

WHILE	@objNo IS NOT NULL
	BEGIN
		select distinct @objNo = MIN (customer_no) from purchases..chph_api where pmid is null 
		AND CUSTOMER_NO > @objNo

		IF	@objNo IS NOT NULL
			select top 1 @objName = customer_name from purchases..chph_api where customer_no = @objNo
			Select @bIsReSearched = max (isresearched) from purchases..ch_pmidxref where chaccountno = @objNo
			if @bIsResearched = 0 or @bisResearched is null
				insert into purchases..ch_pmidxref (chaccountno,accountname) values (@objNo,@objName)
				
END
SET	@objName = ''
SET @objNo = ''
SET @bIsResearched = 0

WHILE	@objNo IS NOT NULL
	BEGIN
		
        select distinct @objNo = MIN (customer_no) from purchases..chph_aap where pmid is null
		AND CUSTOMER_NO > @objNo

		IF	@objNo IS NOT NULL
			select top 1 @objName = customer_name from purchases..chph_aap where customer_no = @objNo
			Select @bIsReSearched = max (isresearched) from purchases..ch_pmidxref where chaccountno = @objNo
			if @bIsResearched = 0 or @bisResearched is null
				insert into purchases..ch_pmidxref (chaccountno,accountname) values (@objNo,@objName)
				
END
SET	@objName = ''
SET @objNo = ''
SET @bIsResearched = 0

WHILE	@objNo IS NOT NULL
	BEGIN
		
        select distinct @objNo = MIN (customer_no) from purchases..chph_ud where pmid is null
		AND CUSTOMER_NO > @objNo

		IF	@objNo IS NOT NULL
			select top 1 @objName = customer_name from purchases..chph_ud where customer_no = @objNo
			Select @bIsReSearched = max (isresearched) from purchases..ch_pmidxref where chaccountno = @objNo
			if @bIsResearched = 0 or @bisResearched is null
				insert into purchases..ch_pmidxref (chaccountno,accountname) values (@objNo,@objName)
				
END
SET	@objName = ''
SET @objNo = ''
SET @bIsResearched = 0

--now remove duplicate cardinal account numbers
drop table purchases..purchases_work

--remove dupes
select * into purchases..purchases_work from ch_pmidxref where id in (
select id from ( 
select id, rank() over (partition by chaccountno order by [id]) as rank
from (select * from ch_pmidxref ) sm
) tmp where rank = 1 and chaccountno is not null
) order by chaccountno 

--alter purchases and drop the id field
alter table purchases..purchases_work drop column [id] 

--delete data from table ch_pmidxref
delete purchases..ch_pmidxref

--repopulate data from purchases_work
insert into purchases..ch_pmidxref select * from purchases..purchases_work

--reapply primary key
alter table purchases..ch_pmidxref add constraint pk_id PRIMARY KEY NONCLUSTERED ([id]) 

END



GO
