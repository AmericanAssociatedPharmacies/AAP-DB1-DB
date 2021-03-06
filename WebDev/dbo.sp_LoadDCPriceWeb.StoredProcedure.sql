USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[sp_LoadDCPriceWeb]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================================
-- Author:		Chandni Lyla
-- Create date: 08/18/2015
-- Description:Loads the table DCPriceWeb -Scheduled weekly 
-- ===========================================================
CREATE PROCEDURE [dbo].[sp_LoadDCPriceWeb]

AS
BEGIN

        DECLARE @SQL varchar(2000)
		Truncate table MACFileWeb

		--Loop through files in  T drive Web directory and insert into Staging Table MACFileWeb

		declare  @files table  (id int IDENTITY(1,1),"FileName" nvarchar(100),depth int,isfile bit)
		insert into @files EXEC master.sys.xp_dirtree 'T:\Data\DCPrice\Price Reports\Web',1,1
		delete from @files where id not in( SELECT id FROM @files WHERE isfile = 1 AND RIGHT(FileName,4) = '.txt')
		declare @filename nvarchar(100)
		declare ID cursor for select "FileName" from @files
		open ID

		FETCH NEXT FROM ID into @filename
		WHILE @@FETCH_STATUS = 0
		BEGIN
			 
			 set  @filename='T:\Data\DCPrice\Price Reports\Web\'+@filename;
			 set @SQL = 'BULK INSERT MACFileWeb FROM ''' + @filename + ''' WITH (KEEPIDENTITY,fieldterminator=''|'',firstrow=1,rowterminator=''\n'')';
			 SET NOCOUNT ON;
			 EXEC(@SQL);

		FETCH NEXT FROM ID into @filename
		END
		CLOSE ID
		DEALLOCATE ID

    --Insert to DCPriceWeb
     truncate table DCPriceWeb
   
     insert into DCPriceWeb select NDCMFG+NDCPDT+NDCPKG as NDC,m.Drugname,case when MAC_ID='MACRXC01' then 'RXC01' when d.MAC_ID='MACRXC02' then 'RXC02'end as Grp#,
     case when d.MAC_ID='MACRXC01' then 3.9 when d.MAC_ID='MACRXC02' then 3.9 end as "Disp Fee",
     Convert(float,substring(UNITCOST,0,9)+'.'+substring(UNITCOST,9,12))as "Unit Ing.Cost",
    'MAC' as "Reimbursement Indictor",case when MAC_ID='MACRXC01' then 'AWP-10%' when MAC_ID='MACRXC02' then 'AWP-10%' end as "Brand",case when MAC_ID='MACRXC01' then 'AWP-20%' when MAC_ID='MACRXC02' then 'AWP-20%' end as "Non-MAC Generic",case when MAC_ID='MACRXC01' then 'Competitive MAC Pricing' when MAC_ID='MACRXC02' then 'Competitive MAC Pricing with higher pricing for Narcotics' end as MAC 
     from MACFileWeb d left outer join medispan..drugmaster m on (d.NDCMFG+d.NDCPDT+d.NDCPKG)=m.ndc 


   --Populate NonMAC table 
    truncate table DCNonMAC
    insert into DCNonMAC select * from v_DCNonMAC

    --RXC04 and RXC05 NDCs should be considered for AWP Pricing even if they are present in MAC List
    delete from DCPriceWeb where NDC in(select NDC from claims..v_DCPRiceRX04)
    delete from DCPriceWeb where NDC in(select NDC from v_DCPRiceRX05)

  --Delete from DCNonMAC NDCs present in MAC List
    delete from DCNonMAC where NDC in(select NDC from DCPriceWeb  group by ndc  having count(NDC)>1)


    --For the Website UDIMACRX4 NDC List
    truncate table DCUDIRX4
	insert into DCUDIRX4 select * from claims..v_DCPRiceRX04 

    --For the Website UDIMACRX5 NDC List
     truncate table DCPRiceRX05
     insert into DCPRiceRX05 select * from  v_DCPRiceRX05
    
END
GO
