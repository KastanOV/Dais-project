-- Generated by Oracle SQL Developer Data Modeler 4.0.0.825
--   at:        2014-04-13 20:56:03 CEST
--   site:      SQL Server 2008
--   type:      SQL Server 2008




CREATE
  TABLE BazarTires
  (
    Id           INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    Manufacturer VARCHAR (10) NOT NULL ,
    Size         INTEGER NOT NULL ,
    Type         VARCHAR (50) NOT NULL ,
    Description  VARCHAR (200) ,
    Customers_id INTEGER NOT NULL ,
    CONSTRAINT BazarTires_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE CarFleet
  (
    CarIdentityNumber        VARCHAR (7) NOT NULL ,
    WinterWheelsSize         INTEGER NOT NULL ,
    SummerWheelSize          INTEGER NOT NULL ,
    CarManufacturer          VARCHAR (20) ,
    CarType                  VARCHAR (40) ,
    PreferedTyreManufacturer VARCHAR (10) ,
    TreadDepthWinter         TINYINT ,
    TreadDepthSummer         TINYINT ,
    Customers_id             INTEGER NOT NULL ,
    CONSTRAINT CarFleet_PK PRIMARY KEY CLUSTERED (CarIdentityNumber)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Contract
  (
    id              INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    Customers_id    INTEGER NOT NULL ,
    Employees_id    INTEGER NOT NULL ,
    CustomerArrival DATETIME NOT NULL ,
    GarageNumber    SMALLINT NOT NULL ,
    CustomerExit    DATETIME ,
    Payment         INTEGER ,
    VAT BIT ,
    CONSTRAINT Contract__IDX PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Customers
  (
    id         INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    email      VARCHAR (50) NOT NULL ,
    fname      VARCHAR (20) NOT NULL ,
    lname      VARCHAR (20) NOT NULL ,
    phone      VARCHAR (15) NOT NULL ,
    adress     VARCHAR (20) NOT NULL ,
    city       VARCHAR (20) NOT NULL ,
    postalCode INTEGER NOT NULL ,
    CONSTRAINT Customers_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE EmployeeAttendance
  (
    Id      INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    Arrival DATETIME NOT NULL ,
    "Exit"  DATETIME ,
    Wage MONEY ,
    Paid BIT NOT NULL ,
    Employees_id INTEGER NOT NULL ,
    CONSTRAINT EmployeeAttendance_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE Employees
  (
    id         INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    login      VARCHAR (10) NOT NULL ,
    Fname      VARCHAR (20) NOT NULL ,
    Lname      VARCHAR (20) NOT NULL ,
    Password   VARCHAR (20) NOT NULL ,
    Phone      VARCHAR (15) NOT NULL ,
    Adress     VARCHAR (20) NOT NULL ,
    City       VARCHAR (20) NOT NULL ,
    Experience TINYINT NOT NULL ,
    CONSTRAINT Employees_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE "Order"
  (
    Id           INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    Customers_id INTEGER NOT NULL ,
    Employees_id INTEGER NOT NULL ,
                 DATETIME DATETIME NOT NULL ,
    status       CHAR (1) NOT NULL ,
    CONSTRAINT Order_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE OrderSuplierTiresOKPneu
  (
    Id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION
    SuplierTiresOKpneu_EAN VARCHAR (14) NOT NULL ,
    Order_Id               INTEGER NOT NULL ,
    ProductCount           INTEGER NOT NULL ,
    PricePerPiece MONEY NOT NULL ,
    CONSTRAINT OrderSuplierTiresOKPneu_PK PRIMARY KEY CLUSTERED (Id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
)
    
GO

CREATE
  TABLE PriceHistory
  (
    id INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    oldPrice MONEY NOT NULL ,
                           DATE DATE NOT NULL ,
    SuplierTiresOKpneu_EAN VARCHAR (14) NOT NULL ,
    CONSTRAINT PriceHistory_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

CREATE
  TABLE StoredWheelsDescription
  (
    id                   INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    Tiremanufacturer     VARCHAR (10) NOT NULL ,
    DiscDescription      VARCHAR (50) ,
    TireDecription       VARCHAR (50) NOT NULL ,
    StoreDate            DATETIME NOT NULL ,
    UnstoreDate          DATETIME ,
    Customers_id         INTEGER NOT NULL ,
    Employees_id_Store   INTEGER NOT NULL ,
    Employees_id_Unstore INTEGER NULL ,
    CONSTRAINT StoredWheelsDescription_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SuplierTiresOKpneu](
	[EAN] [varchar](14) NOT NULL,
	[Manufacturer] [varchar](20) NOT NULL,
	[Size] [int] NOT NULL,
	[ExternalStore] [int] NOT NULL,
	[code] [varchar](15) NULL,
	[OnStore] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Name] [varchar](50) NULL,
	[season] [char](1) NULL,
	[Description] [varchar](2000) NULL,
	[Photo] [varchar](200) NULL,
 CONSTRAINT [SuplierTiresOKpneu_PK] PRIMARY KEY CLUSTERED 
(
	[EAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


ALTER TABLE BazarTires
ADD CONSTRAINT BazarTires_Customers_FK FOREIGN KEY
(
Customers_id
)
REFERENCES Customers
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE CarFleet
ADD CONSTRAINT CarFleet_Customers_FK FOREIGN KEY
(
Customers_id
)
REFERENCES Customers
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE EmployeeAttendance
ADD CONSTRAINT EmployeeAttendance_Employees_FK FOREIGN KEY
(
Employees_id
)
REFERENCES Employees
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE OrderSuplierTiresOKPneu
ADD CONSTRAINT FK_ASS_10 FOREIGN KEY
(
Order_Id
)
REFERENCES "Order"
(
Id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Contract
ADD CONSTRAINT FK_ASS_2 FOREIGN KEY
(
Customers_id
)
REFERENCES Customers
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Contract
ADD CONSTRAINT FK_ASS_3 FOREIGN KEY
(
Employees_id
)
REFERENCES Employees
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE OrderSuplierTiresOKPneu
ADD CONSTRAINT FK_ASS_9 FOREIGN KEY
(
SuplierTiresOKpneu_EAN
)
REFERENCES SuplierTiresOKpneu
(
EAN
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE "Order"
ADD CONSTRAINT Order_Customers_FK FOREIGN KEY
(
Customers_id
)
REFERENCES Customers
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE "Order"
ADD CONSTRAINT Order_Employees_FK FOREIGN KEY
(
Employees_id
)
REFERENCES Employees
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE PriceHistory
ADD CONSTRAINT PriceHistory_SuplierTiresOKpneu_FK FOREIGN KEY
(
SuplierTiresOKpneu_EAN
)
REFERENCES SuplierTiresOKpneu
(
EAN
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE StoredWheelsDescription
ADD CONSTRAINT StoredWheelsDescription_Customers_FK FOREIGN KEY
(
Customers_id
)
REFERENCES Customers
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE StoredWheelsDescription
ADD CONSTRAINT StoredWheelsDescription_Employees_FK FOREIGN KEY
(
Employees_id_Store
)
REFERENCES Employees
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE StoredWheelsDescription
ADD CONSTRAINT StoredWheelsDescription_Employees_FKv1 FOREIGN KEY
(
Employees_id_Unstore
)
REFERENCES Employees
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

CREATE
  TABLE Items
  (
    id           INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    EAN          VARCHAR (14) NOT NULL ,
    Name         VARCHAR (50) NOT NULL ,
    PricePerItem INTEGER NOT NULL ,
    COUNT        INTEGER NOT NULL ,
    Contract_id  INTEGER NOT NULL ,
    CONSTRAINT Items_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO



CREATE
  TABLE WorkItems
  (
    id          INTEGER NOT NULL IDENTITY NOT FOR REPLICATION ,
    Name        VARCHAR (20) NOT NULL ,
    Description VARCHAR (200) NOT NULL ,
    Price       INTEGER NOT NULL ,
    COUNT       INTEGER NOT NULL ,
    Contract_id INTEGER NOT NULL ,
    CONSTRAINT WorkItems_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO




ALTER TABLE Items
ADD CONSTRAINT Items_Contract_FK FOREIGN KEY
(
Contract_id
)
REFERENCES Contract
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE WorkItems
ADD CONSTRAINT WorkItems_Contract_FK FOREIGN KEY
(
Contract_id
)
REFERENCES Contract
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

Alter table Customers
add CompanyName Varchar(50) null

Alter table Customers
add ICO Varchar(10)

Alter table Customers
add DIC Varchar(12)

CREATE TABLE [dbo].[WorkItemsReady] (
    [id]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Name]        VARCHAR (20)  NOT NULL,
    [Description] VARCHAR (200) NOT NULL,
    [Price]       INT           NOT NULL,
    
);
ALTER TABLE [dbo].[WorkItemsReady] 
    ADD CONSTRAINT WorkItemsReady_PK PRIMARY KEY CLUSTERED (id)

Alter table PriceHistory
add OnExternalStore int
CREATE TABLE [dbo].[ConsumablesReady] (
    [id]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Name]        VARCHAR (20)  NOT NULL,
    [Price]       INT           NOT NULL,
    
);

ALTER TABLE [dbo].[ConsumablesReady] 
    ADD CONSTRAINT ConsumablesReady_PK PRIMARY KEY CLUSTERED (id)


CREATE
  TABLE Consumables
  (
    [id]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Name]        VARCHAR (20)  NOT NULL,
    [Price]       INT           NOT NULL,
	[Count]       INT           NOT NULL,
	Contract_id INTEGER NOT NULL ,
    CONSTRAINT Consumables_PK PRIMARY KEY CLUSTERED (id)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
  )
  ON "default"
GO

ALTER TABLE Consumables
ADD CONSTRAINT Consumables_Contract_FK FOREIGN KEY
(
Contract_id
)
REFERENCES Contract
(
id
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

alter table Contract
add MethodOfPayment char(1) null

update Contract
set MethodOfPayment = 'H'
where MethodOfPayment is null

alter table Contract
alter column MethodOfPayment char(1) not null

alter table Contract
add VoiceID int null

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0

--PROCEDURES 

