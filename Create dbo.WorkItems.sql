USE [Pneuservis]
GO

/****** Object: Table [dbo].[WorkItems] Script Date: 8/9/2014 11:31:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkItemsReady] (
    [id]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Name]        VARCHAR (20)  NOT NULL,
    [Description] VARCHAR (200) NOT NULL,
    [Price]       INT           NOT NULL,
    
);


