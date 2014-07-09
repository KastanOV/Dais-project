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