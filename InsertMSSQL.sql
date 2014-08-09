INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('pohadky@gmail.com','Renat','Kasturova','724333203','Startovní 4','Ostrava',70030)
GO
INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('blabla@gmail.com',	'Adolf',	'moskvic',	'74258569',	'moskvska 25',	'mnichov',	12536)
GO
INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('blabla@gmail.com',	'Adolf',	'moskvic',	'74258569',	'moskvska 25',	'mnichov',	12536)
GO
INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('Adolf@gmail.com',	'Adolf',	'Moskva',	'724333203',	'Startovní 4',	'Ostrava',	70030)
GO
INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('Pondeli@gmail.com',	'Ignác',	'Pondelí',	'724333203',	'Startovní 4',	'Ostrava',	70030)
GO
INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('utery@gmail.com',	'Jožin',	'úterý',	'724333203',	'Startovní 4',	'Ostrava',	70030)
GO
INSERT INTO [dbo].[Customers]([email],[fname],[lname],[phone],[adress],[city],[postalCode])
     VALUES
           ('Alfons@gmail.com',	'Alfons',	'Mucha',	'739247129',	'Startovní 4',	'Ostrava',	70030)
GO

INSERT INTO [dbo].[Employees]([login],[Fname],[Lname],[Password],[Phone],[Adress],[City],[Experience])
     VALUES
           ('alo0110',	'Alois',	'Witasek',	'kastan',	'732623415',	'K Opave 15',	'Olomouc',	80)
GO
INSERT INTO [dbo].[Employees]([login],[Fname],[Lname],[Password],[Phone],[Adress],[City],[Experience])
     VALUES
           ('evz0110',	'Evžen',	'Houžvicka',	'kastan',	'723333203',	'Widlakovská 15',	'Ostrava',	90)
GO
INSERT INTO [dbo].[Employees]([login],[Fname],[Lname],[Password],[Phone],[Adress],[City],[Experience])
     VALUES
           ('loj0110',	'Lojza',	'Houžvicka',	'kastan',	'723587203',	'Widlakovská 16',	'Opava',	90)
GO
INSERT INTO [dbo].[Employees]([login],[Fname],[Lname],[Password],[Phone],[Adress],[City],[Experience])
     VALUES
           ('kas0110',	'Jaroslav',	'Kaštura',	'kastan',	'739247129',	'Startovní 4',	'Ostrava',	100)
GO
INSERT INTO [dbo].[Employees]([login],[Fname],[Lname],[Password],[Phone],[Adress],[City],[Experience])
     VALUES
           ('zur0110',	'David',	'Žurek',	'kastan',	'739265895',	'Opavská 29',	'Opava',	10)
GO


INSERT INTO [dbo].[Contract] ([Customers_id] ,[Employees_id],[CustomerArrival],[GarageNumber],[CustomerExit],[Payment],[VAT])
     VALUES
           (1,	1,	'2014-04-11 07:00:00.000',	1,	'2014-04-11 07:00:00.000',	500,	0)
GO
INSERT INTO [dbo].[Contract] ([Customers_id] ,[Employees_id],[CustomerArrival],[GarageNumber],[CustomerExit],[Payment],[VAT])
     VALUES
           (2,	1,	'2014-04-11 07:50:00.000',	1,	'2014-04-11 08:42:00.000',	600,	1)
GO
INSERT INTO [dbo].[Contract] ([Customers_id] ,[Employees_id],[CustomerArrival],[GarageNumber],[CustomerExit],[Payment],[VAT])
     VALUES
           (3,	2,	'2014-04-11 09:01:00.000',	2,	'2014-04-11 09:30:00.000',	400,	0)
GO
INSERT INTO [dbo].[Contract] ([Customers_id] ,[Employees_id],[CustomerArrival],[GarageNumber],[CustomerExit],[Payment],[VAT])
     VALUES
           (4,	1,	'2014-04-11 10:00:00.000',	1,	'2014-04-11 10:52:00.000',	700,	1)
GO




INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-11 06:55:00.000',	'2014-04-11 14:00:00.000',	456.1235,	1,	1)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-12 06:55:00.000',	'2014-04-13 14:00:00.000',	456.1235,	1,	1)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-13 06:55:00.000',	'2014-04-13 09:30:14.990',	130.4583,	1,	1)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-11 06:55:00.000',	'2014-04-11 18:00:00.000',	400.1235,	1,	2)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-19 10:18:49.683',	'2014-05-16 09:20:35.570',	34947.6667,	0,	1)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-19 11:18:43.193',	'2014-04-19 11:20:20.790',	1.6833,	1,	2)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-04-19 11:21:05.777',	'2014-05-08 11:54:15.670',	23577.50,	1,	2)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-05-08 11:53:44.980',	'2014-05-08 11:55:47.427',	1.6833,	1,	5)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-05-08 11:54:03.270',	'2014-05-08 11:55:28.573',	0.8417,	1,	4)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-05-08 12:31:12.297',	'2014-05-08 12:31:39.910',	0.00,	1,	4)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-05-10 18:56:14.133',	'2014-05-11 19:27:18.677',	1348.4167,	1,	5)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-05-16 09:20:50.137',	NULL,	NULL,	0,	1)
GO
INSERT INTO [dbo].[EmployeeAttendance]([Arrival],[Exit],[Wage],[Paid],[Employees_id])
     VALUES
           ('2014-05-16 14:33:48.753',	NULL,	NULL,	0,	4)
GO



INSERT INTO [dbo].[BazarTires]([Manufacturer],[Size],[Type],[Description],[Customers_id])
     VALUES
           ('michelin',	1956515	,'Alpin A4',	'Take fajne',	5)
GO
INSERT INTO [dbo].[BazarTires]([Manufacturer],[Size],[Type],[Description],[Customers_id])
     VALUES
           ('Barum',	1956515	,'Alpin A4',	'Take fajne',	1)
GO
INSERT INTO [dbo].[BazarTires]([Manufacturer],[Size],[Type],[Description],[Customers_id])
     VALUES
           ('Debica',	1956515	,'Alpin A4',	'Take fajne',	2)
GO




INSERT INTO [dbo].[CarFleet]([CarIdentityNumber],[WinterWheelsSize],[SummerWheelSize],[CarManufacturer],[CarType],[PreferedTyreManufacturer],[TreadDepthWinter],[TreadDepthSummer]
           ,[Customers_id])
     VALUES
           ('3T98084',	1956515,	2055516,	'Ford',	'Mondeo',	'Michelin',	4,	2,	1)
GO


INSERT INTO [dbo].[SuplierTiresOKpneu]
           ([EAN]
           ,[Manufacturer]
           ,[Size]
           ,[ExternalStore]
           ,[code]
           ,[OnStore]
           ,[Price]
           ,[Name]
           ,[season]
           ,[Description]
           ,[Photo])
     VALUES
           ('0029142345715',	'COOPER',	2056016,	0,	0002660,	0,	3531.00,	'COOPER 205/60 R 16 WEATHER MASTER S/T 2 92T',	'Z',
		   	'Zimní smerová pneumatika urcená pro vozy 4X4SUV. S novou generací smesí se silikou má výborné záberové a brzdící schopnosti na snehu, ledu, ale i další její výkony jsou velmi dobré napríklad aquaplaning, snowhandling, wetbreaking. Tato pneumatika má možno',	
             ' http://www.pneuok.cz/images/product/small/pneu/weathermasterst2.jpg '
            )
GO

INSERT INTO [dbo].[SuplierTiresOKpneu]
           ([EAN]
           ,[Manufacturer]
           ,[Size]
           ,[ExternalStore]
           ,[code]
           ,[OnStore]
           ,[Price]
           ,[Name]
           ,[season]
           ,[Description]
           ,[Photo])
     VALUES
           ('3188649821075',	'DUNLOP',	1956515,	12,	529067,	0,	1485.00,	'DUNLOP 195/65 R 15 SP STREETRESPONSE 2 91T.',	'L',
		   	'Letní pneu Dunlop SP STREETRESPONSE - Asymetrické provedení behounu poskytuje zlepšenou odolnost proti aquaplaningu. Pevné stredové žebro zvetšuje stabilitu a presnost. Asymetrické usporádání drážek pak zvyšuje záber na mokrých a suchých površích.',	
              'http://www.pneuok.cz/images/product/small/pneu/streetresponse2.jpg'
            
            )
GO
INSERT INTO [dbo].[SuplierTiresOKpneu]
           ([EAN]
           ,[Manufacturer]
           ,[Size]
           ,[ExternalStore]
           ,[code]
           ,[OnStore]
           ,[Price]
           ,[Name]
           ,[season]
           ,[Description]
           ,[Photo])
     VALUES
           ('4024063465879',	'BARUM',	1956515,	4,	15404060000,	0,	1454.20,	'BARUM 195/65 R 15 BRILLANTIS 2 95T XL',	'L',	
		   'Tuzemský výrobce spolecnost BARUM predstavil letošní novinku s oznacením BRILLANTIS 2. Jedná se o pneumatiku, která se svými vlastnostmi opírá o velice oblíbeného predchudce BRILLANTIS. Klasický symetrický dezén nahradil modernejší asymetrický, který má j',	
              'http://www.pneuok.cz/images/product/small/pneu/brillantis2.jpg'
            
            )
GO
INSERT INTO [dbo].[SuplierTiresOKpneu]
           ([EAN]
           ,[Manufacturer]
           ,[Size]
           ,[ExternalStore]
           ,[code]
           ,[OnStore]
           ,[Price]
           ,[Name]
           ,[season]
           ,[Description]
           ,[Photo])
     VALUES
           ('5452000424082',	'DEBICA',	1956515,	0,	529318,	0,	0.00,	'DEBICA 195/65 R 15 DEBICA PRESTO 91H',	'L',' nic ',		
              'http://www.pneuok.cz/images/product/small/pneu/presto.jpg'
            
            
            )
GO
INSERT INTO [dbo].[SuplierTiresOKpneu]
           ([EAN]
           ,[Manufacturer]
           ,[Size]
           ,[ExternalStore]
           ,[code]
           ,[OnStore]
           ,[Price]
           ,[Name]
           ,[season]
           ,[Description]
           ,[Photo])
     VALUES
           ('8808563304786',	'HANKOOK',	1856515,	0,	1010930,	0,	0.00,	'HANKOOK 185/65 R 15 HANKOOK W310 88H',	'Z',
		   	'Pneumatika HANKOOK W310 Winter je nová, výjimecne výkonná zimní pneumatika. Smes behounu obsahuje siliku nové generace. Drážky vypadající jako drápy ledního medveda navíc obsahují pomocné vnitrní lamely, které tak zajištují perfektní výkon jak na ledu, ta',	
             ' http://www.pneuok.cz/images/product/small/pneu/w310.jpg'
            
            )
GO



INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 16:46:37.530',	'x')
GO
--17
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (2,	5,	'2014-05-11 17:04:54.790',	'x')
GO
--18
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-11 19:28:41.343',	'n')
GO
--19
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (4,	1,	'2014-05-16 06:55:10.680',	'n')
GO
--20
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (3,	1,	'2014-05-16 06:55:22.037',	'n')
GO
--21
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-16 09:19:30.567',	'n')
GO
--22
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-16 14:33:26.560', 'n')
GO
--23
INSERT INTO [dbo].[Order]
           ([Customers_id]
           ,[Employees_id]
           ,[DATETIME]
           ,[status])
     VALUES
           (1,	1,	'2014-05-16 14:33:26.560', 'n')
GO




INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('0029142345715',	16,	4,	123.1235)
GO
INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('4024063465879',	17,	4,	1454.20)
GO
INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('3188649821075',	18,	4,	1485.00)
GO
INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('8808563304786',	19,	4,	0.00)
GO
INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('8808563304786',	20,	4,	0.00)
GO
INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('5452000424082',	21,	5,	0.00)
GO
INSERT INTO [dbo].[OrderSuplierTiresOKPneu]
           ([SuplierTiresOKpneu_EAN]
           ,[Order_Id]
           ,[ProductCount]
           ,[PricePerPiece])
     VALUES
           ('4024063465879',	22,	4,	1454.20)
GO




INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Barum',	'Docela dobrý disk',	'4mm',	'2014-05-09 13:26:54.607',	'2014-05-10 19:20:45.713',	1,	1,	2)
GO
INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Barum',	'Fajny',	'Fajne',	'2014-05-10 18:16:14.383',	'2014-05-10 18:18:48.970',	1,	1,	1)
GO
INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Michelin',	'bez',	'fajne',	'2014-05-10 18:46:54.657',	'2014-05-10 18:47:49.027',	1,	1,	1)
GO
INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Barum',	'Fajny',	'Fajne',	'2014-05-10 19:20:45.713',	NULL,	1,	1,	NULL)
GO
INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Michelin',	'ALU AEZ 16"',	'195/65R15',	'2014-05-10 19:39:27.267',	'2014-05-10 19:40:38.733',	5,	5,	1)
GO
INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Michelin',	'ALU AEZ 16"',	'195/65R15',	'2014-05-10 19:39:41.050',	NULL,	5,	5,	NULL)
GO
INSERT INTO [dbo].[StoredWheelsDescription]
           ([Tiremanufacturer]
           ,[DiscDescription]
           ,[TireDecription]
           ,[StoreDate]
           ,[UnstoreDate]
           ,[Customers_id]
           ,[Employees_id_Store]
           ,[Employees_id_Unstore])
     VALUES
           ('Michelin',	'ALU AEZ 16"',	'195/65R15',	'2014-05-10 19:39:41.050',	NULL,	5,	5,	NULL)
GO

INSERT INTO [dbo].[PriceHistory]
           ([oldPrice]
           ,[DATE]
           ,[SuplierTiresOKpneu_EAN])
     VALUES
           (100.00,	'2014-04-13',	'0029142345715')
GO
INSERT INTO [dbo].[PriceHistory]
           ([oldPrice]
           ,[DATE]
           ,[SuplierTiresOKpneu_EAN])
     VALUES
           (200.00,	'2014-04-14',	'0029142345715')
GO
INSERT INTO [dbo].[PriceHistory]
           ([oldPrice]
           ,[DATE]
           ,[SuplierTiresOKpneu_EAN])
     VALUES
           (300.00,	'2014-04-15',	'0029142345715')
GO
INSERT INTO [dbo].[PriceHistory]
           ([oldPrice]
           ,[DATE]
           ,[SuplierTiresOKpneu_EAN])
     VALUES
           (400.00,	'2014-04-16',	'0029142345715')
GO