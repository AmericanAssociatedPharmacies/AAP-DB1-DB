USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PharmacySystemsCount]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_PharmacySystemsCount]
as
select ComputerSoftware, 
s.software,
sum([AAP Active]) as [AAP Active],
sum([MC Active]) as [MC Active],
sum([PM All]) as [PM All]
from
(
select ComputerSoftware, 
count(ComputerSoftware) as [PM all],
0 as [AAP Active],
0 as [MC Active]
from pm_pharmacy
where ComputerSoftware is not null
group by ComputerSoftware


union

select ComputerSoftware, 
0 as [PM all],
count(ComputerSoftware)  as [AAP Active],
0 as [MC Active]
from pm_pharmacy
where ComputerSoftware is not null
and (AAPAccountno is not null and AAPquitdate is null)
group by ComputerSoftware


union

select ComputerSoftware, 
0 as [PM all],
0 as [AAP Active],
count(ComputerSoftware)  as [MC Active]
from pm_pharmacy
where ComputerSoftware is not null
and isManagedCare<>0
group by ComputerSoftware
) dt
left join software s on s.id=dt.computersoftware
group by ComputerSoftware,s.software
--order by [AAP active] desc
GO
