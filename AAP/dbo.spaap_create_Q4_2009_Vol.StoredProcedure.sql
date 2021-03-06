USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_Q4_2009_Vol]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Update account numbers for the  AccountMasterActive_Distinct table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_Q4_2009_Vol]

AS
	BEGIN


 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
        IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_q4_ud_jmw')
          DROP TABLE tmp_q4_ud_jmw
 
	select * into tmp_q4_ud_jmw from (
	select nv.acct_no,
	sum(october) as october,sum(november) as november,sum(december)as december,
	sum(october + november + december) as total from reporting..newvolume nv

	left outer join reporting..storemember sm
	on nv.acct_no = sm.acct_no 
	where  fy_end = 2010 and  vendor_id in 
	('65','86')  
	 
	  group by nv.acct_no
	)ch


     IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_q4_pm_jmw')
          DROP TABLE tmp_q4_pm_jmw

select t1.acct_no ,t1.october,t1.november,t1.december,t1.total,
cast ('' as varchar(5) )as Territory,
cast ('' as varchar(20)) as AAPAccountNo,
cast ('' as varchar (100)) as Name,
cast ('' as varchar (100)) as City,
cast ('' as varchar (10)) as State,
cast ('' as varchar (12) ) as Effective
 into tmp_q4_pm_jmw from (
select acct_no,october,november,december,total from tmp_q4_ud_jmw ) t1

update am set
	Territory = aap.nsterritory,
    AAPAccountNo = aap.aapid,
    Name = aap.StoreName,
    City = aap.City,
    State = aap.State,
    Effective = aap.effective
    from tmp_q4_pm_jmw am
	join
	 (	select nsterritory,aapid,storename,city,state,effective,previousacctno  from aapaccount ) aap
    on am.acct_no = aap.previousacctno


update am set
	Territory = sm.nsterritory,
    Name = sm.store,
    City = sm.City,
    State = sm.State,
    Effective = sm.effective
    from tmp_q4_pm_jmw am
	join
	 (	select nsterritory,store,city,state,effective,acct_no  from reporting..storemember ) sm
    on am.acct_no = sm.acct_no
    where Territory = ''

update am set
	Territory = aap.nsterritory,
    AAPAccountNo = aap.aapid,
    Name = aap.StoreName,
    City = aap.City,
    State = aap.State,
    Effective = aap.effective
    from tmp_q4_pm_jmw am
	join
	 (	select nsterritory,aapid,storename,city,state,effective  from aapaccount) aap
    on am.acct_no = aap.aapid
    where Territory = ''

update  tmp_q4_pm_jmw   set
		october = am1.october,
        november = am1.november,
        december = am1.december,
        total = am1.total 
		from  
    
		 (	select  sum(october) as october, sum(november) as november,
            sum(december) as  december,sum(total) total from tmp_q4_pm_jmw where acct_no in  ('10860','4543') )am1
       where   acct_no = '10860'

update  tmp_q4_pm_jmw   set
		october = am1.october,
        november = am1.november,
        december = am1.december,
        total = am1.total 
		from  
    
		 (	select  sum(october) as october, sum(november) as november,
            sum(december) as  december,sum(total) total from tmp_q4_pm_jmw where acct_no in  ('10889','4580') )am1
       where   acct_no = '10889'

delete from tmp_q4_pm_jmw where acct_no = '4543'
delete from tmp_q4_pm_jmw where acct_no = '4580'


     IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_q4_pm_rpt_jmw')
          DROP TABLE tmp_q4_pm_rpt_jmw

select * into tmp_q4_pm_rpt_jmw from 
(
select t1.AAPAccountNo as [AAP #] ,t1.acct_no as [UD #] , t1.Name,t1.City,t1.State,t1.Territory,t1.Effective,t1.October as 
[Oct. 2009],t1.november as [Nov. 2009],t1.december as [Dec. 2009], t1.total as [Q4 2009 Total]  from  tmp_q4_pm_jmw t1
left outer join reporting..storemember sm
on t1.acct_no = sm.acct_no
where   (
((sm.quitdate > '01/01/2008' and (october != 0 or november!= 0 or december != 0))
  or sm.quitdate is null) or t1.acct_no = '8888' )

)ch

--select t1.AAPAccountNo as [AAP #] ,t1.acct_no as [UD #] , t1.Name,t1.City,t1.State,t1.Territory,t1.Effective,t1.October as 
--[Oct. 2009],t1.november as [Nov. 2009],t1.december as [Dec. 2009], t1.total as [Q4 2009 Total]  from  tmp_q4_pm_jmw t1
--left outer join reporting..storemember sm
--on t1.acct_no = sm.acct_no
--where   (
--((sm.quitdate > '01/01/2008' and (october != 0 or november!= 0 or december != 0))
--  or sm.quitdate is null) or t1.acct_no = '8888' )
--order by territory desc
     
 
-- Case:1 Update AAP with UDAccountNO
--	UPDATE  am  set 
--			UDAccountNo =   aap.UDAccountNo ,
--            UDParentNo = aap.UDParentNo 
--	   FROM PMUpdate_Active_staging am 
--	   join 
--	  (select ud.UDAccountNo,ud.UDParentNo ,ud.dea from PMUpdate_Active_staging aap 
--				join (select * from PMUpdate_Active_staging where source = 'UD')ud
--	  on aap.dea = ud.dea where aap.source = 'AAP' ) aap
--      on aap.dea   = am.dea where am.source = 'AAP'

    END









GO
