USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spDC_SearchByNDC]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chandni
-- Create date: 10/5/2015
-- Description:	Return pricing details for an NDC from 'RxCare Select Patient Pay Lookup Tool' webpage
-- =============================================
CREATE proc [dbo].[spDC_SearchByNDC]
(
@ndc varchar(11)
)
as



 /* -- OLD CODE
declare @UIC float
declare @RI varchar(25)
select top 1 @UIC = [Unit Ing.Cost] from v_DCAll where ndc=@ndc and [Unit Ing.Cost] is not null
select top 1 @RI = [Reimbursement Indictor] from DCNonMAC where ndc=@ndc
select distinct
	[Grp#]
      ,[Disp Fee]
      ,isnull([Unit Ing.Cost],@UIC) as [Unit Ing.Cost]
      --,[Reimbursement Indicator]
      ,isnull(@RI,[Reimbursement Indicator]) as [Reimbursement Indicator]
      ,[Brand]
      ,[Non-MAC Generic]
      ,[MAC]    
from v_DCAll
where (ndc=@ndc or ndc is null)
and [Grp#] is not null

*/
 --NEW CODE

--delete pricing result temp table
delete from DCALLweb

--initial cost as zero in Unit Ing. cost column from DCGroupsWeb table
insert into DCALLweb(Grp#,[Disp Fee],[Reimbursement Indictor],Brand,[Non-MAC Generic],MAC,[Unit Ing.Cost]) 
select [Grp#]
      ,[Disp Fee]
      ,[Reimbursement Indictor]
      ,[Brand]
      ,[Non-MAC Generic]
      ,[MAC],0 from DCGroupsWeb


declare @UnitCost1 float,@UnitCost2 float,@AWP float,@RX4 int,@RX5 int
declare @RI varchar(10)

--check if the drug has unit value for MAC01/ MAC02 group in MAC list
select @UnitCost1=  [Unit Ing.Cost] from DCPRiceweb where ndc=@ndc and Grp#='RXC01'
select @UnitCost2=  [Unit Ing.Cost] from DCPRiceweb where ndc=@ndc and Grp#='RXC02'

--NDC not found in MAC list
if((@UnitCost1 is null)or(@UnitCost2 is null))
 begin
   select @RX4=case when AWP is not null then 1 else 0 end  from DCUDIRX4 where ndc=@ndc
   select @RX5=case when AWP is not null then 1 else 0 end from DCPRiceRX05 where ndc=@ndc
  
--Average Wholesale Price (AWP)
   select @AWP=AWP from DCNonMac where ndc=@ndc
   select @RI=[Reimbursement Indictor]from DCNonMAC where ndc=@ndc
 end

--NDC found in MAC list
IF(@UnitCost1 is not null)
 update DCALLweb set [Unit Ing.Cost]=@UnitCost1 where Grp#<>'RXC02'

ELSE

--NDC not found in MAC list i.e. NDc is in Non-Mac list
BEGIN

update DCALLweb set [Reimbursement Indictor]='AWP' where Grp#<>'RXC02'

update  DCALLweb set [Unit Ing.Cost]= case when (@RI='NMG') then @AWP-(@AWP*0.2) when (@RI='Brand') then @AWP-(@AWP*0.1) end  where Grp#='RXC01'

update  DCALLweb set [Unit Ing.Cost]= case when (@RI='NMG') then @AWP-(@AWP*0.18) when (@RI='Brand') then @AWP-(@AWP*0.09)end  where Grp#='RXC03'

update  DCALLweb set [Unit Ing.Cost]=  case when (@RI='NMG') then @AWP-(@AWP*0.1667) when (@RI='Brand') then @AWP-(@AWP*0.0833)end where Grp#='RXC04'

update  DCALLweb set [Unit Ing.Cost]=  case when (@RI='NMG') then @AWP-(@AWP*0.16) when (@RI='Brand') then @AWP-(@AWP*0.08)end where Grp#='RXC05'

update  DCALLweb set [Unit Ing.Cost]= case when (@RI='NMG') then @AWP-(@AWP*0.14) when (@RI='Brand') then @AWP-(@AWP*0.07)end  where Grp#='RXC06'

update  DCALLweb set [Unit Ing.Cost]=  case when (@RI='NMG') then @AWP-(@AWP*0.12) when (@RI='Brand') then @AWP-(@AWP*0.06)end where Grp#='RXC07'

update  DCALLweb set [Unit Ing.Cost]=  case when (@RI='NMG') then @AWP-(@AWP*0.1) when (@RI='Brand') then @AWP-(@AWP*0.05)end where Grp#='RXC08'

update  DCALLweb set [Unit Ing.Cost]=  case when (@RI='NMG') then @AWP-(@AWP*0.1) when (@RI='Brand') then @AWP-(@AWP*0.05)end where Grp#='RXC09'

update  DCALLweb set [Unit Ing.Cost]=  case when (@RI='NMG') then @AWP-(@AWP*0.08) when (@RI='Brand') then @AWP-(@AWP*0.04)end where Grp#='RXC10'

--$4.00 Product
if(@RX4=1) 

BEGIN

update DCALLweb set [Reimbursement Indictor]='Product is on the RxCARE $4.00 NDC Product List'
, [Disp Fee]=null 
, [Unit Ing.Cost]=null 
,  [Brand]=null 
,[Non-MAC Generic]=null 
,[MAC]=null 
where Grp#='RXC04'

END

--$5.00 Product
if(@RX5=1) 

BEGIN

update DCALLweb Set
[Reimbursement Indictor]='Product is on the RxCARE $5.00 NDC Product List' 
,[Disp Fee]=null 
,[Unit Ing.Cost]=null 
,[Brand]=null 
,[Non-MAC Generic]=null 
,[MAC]=null 
where Grp#='RXC05'

END

END

IF(@UnitCost2 is not null)
  update DCALLweb set [Unit Ing.Cost]=@unitCost2 where Grp#='RXC02' 
ELSE
 begin
--NDC is in Non MAC list
 update  DCALLweb set 
[Unit Ing.Cost]= case when (@RI='NMG') then @AWP-(@AWP*0.2) when (@RI='Brand') then @AWP-(@AWP*0.1) end  
,[Reimbursement Indictor]='AWP' 
where Grp#='RXC02'

end
select distinct [Grp#],[Disp Fee],[Unit Ing.Cost],[Reimbursement Indictor],[Brand],[Non-MAC Generic],[MAC] from DCALLweb

GO
