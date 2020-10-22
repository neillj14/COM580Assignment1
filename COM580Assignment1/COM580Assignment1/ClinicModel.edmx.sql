
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/20/2020 18:54:51
-- Generated from EDMX file: D:\OneDrive - Ulster University\Final Year\COM580\COM580Assignment1\COM580Assignment1\COM580Assignment1\ClinicModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ClinicDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ParentChild]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Children] DROP CONSTRAINT [FK_ParentChild];
GO
IF OBJECT_ID(N'[dbo].[FK_ClinicConsultant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Consultants] DROP CONSTRAINT [FK_ClinicConsultant];
GO
IF OBJECT_ID(N'[dbo].[FK_ConsultantAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_ConsultantAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_ChildAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_AppointmentMedication]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Medications] DROP CONSTRAINT [FK_AppointmentMedication];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildMedication]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Medications] DROP CONSTRAINT [FK_ChildMedication];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_InvoiceAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildInvoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_ChildInvoice];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Parents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Parents];
GO
IF OBJECT_ID(N'[dbo].[Children]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Children];
GO
IF OBJECT_ID(N'[dbo].[Clinics]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clinics];
GO
IF OBJECT_ID(N'[dbo].[Consultants]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Consultants];
GO
IF OBJECT_ID(N'[dbo].[Appointments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appointments];
GO
IF OBJECT_ID(N'[dbo].[Medications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Medications];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Parents'
CREATE TABLE [dbo].[Parents] (
    [PrentId] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [ContactNum] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Children'
CREATE TABLE [dbo].[Children] (
    [ChildId] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [DoB] nvarchar(max)  NOT NULL,
    [Sex] nvarchar(max)  NOT NULL,
    [ParentPrentId] int  NOT NULL
);
GO

-- Creating table 'Clinics'
CREATE TABLE [dbo].[Clinics] (
    [ClinicId] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [ContactNum] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Consultants'
CREATE TABLE [dbo].[Consultants] (
    [ConsultantId] int IDENTITY(1,1) NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [ContactNum] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [ClinicClinicId] int  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [AppointmentId] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [ConsultantConsultantId] int  NOT NULL,
    [ChildChildId] int  NOT NULL,
    [Reason] nvarchar(max)  NULL
);
GO

-- Creating table 'Medications'
CREATE TABLE [dbo].[Medications] (
    [MedicationId] int IDENTITY(1,1) NOT NULL,
    [AppointmentAppointmentId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Dosage] nvarchar(max)  NOT NULL,
    [Strength] nvarchar(max)  NOT NULL,
    [ChildChildId] int  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [InvoiceId] int IDENTITY(1,1) NOT NULL,
    [AmountDue] nvarchar(max)  NOT NULL,
    [AmountPaid] nvarchar(max)  NOT NULL,
    [ChildChildId] int  NOT NULL,
    [Appointment_AppointmentId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PrentId] in table 'Parents'
ALTER TABLE [dbo].[Parents]
ADD CONSTRAINT [PK_Parents]
    PRIMARY KEY CLUSTERED ([PrentId] ASC);
GO

-- Creating primary key on [ChildId] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [PK_Children]
    PRIMARY KEY CLUSTERED ([ChildId] ASC);
GO

-- Creating primary key on [ClinicId] in table 'Clinics'
ALTER TABLE [dbo].[Clinics]
ADD CONSTRAINT [PK_Clinics]
    PRIMARY KEY CLUSTERED ([ClinicId] ASC);
GO

-- Creating primary key on [ConsultantId] in table 'Consultants'
ALTER TABLE [dbo].[Consultants]
ADD CONSTRAINT [PK_Consultants]
    PRIMARY KEY CLUSTERED ([ConsultantId] ASC);
GO

-- Creating primary key on [AppointmentId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([AppointmentId] ASC);
GO

-- Creating primary key on [MedicationId] in table 'Medications'
ALTER TABLE [dbo].[Medications]
ADD CONSTRAINT [PK_Medications]
    PRIMARY KEY CLUSTERED ([MedicationId] ASC);
GO

-- Creating primary key on [InvoiceId] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ParentPrentId] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [FK_ParentChild]
    FOREIGN KEY ([ParentPrentId])
    REFERENCES [dbo].[Parents]
        ([PrentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParentChild'
CREATE INDEX [IX_FK_ParentChild]
ON [dbo].[Children]
    ([ParentPrentId]);
GO

-- Creating foreign key on [ClinicClinicId] in table 'Consultants'
ALTER TABLE [dbo].[Consultants]
ADD CONSTRAINT [FK_ClinicConsultant]
    FOREIGN KEY ([ClinicClinicId])
    REFERENCES [dbo].[Clinics]
        ([ClinicId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClinicConsultant'
CREATE INDEX [IX_FK_ClinicConsultant]
ON [dbo].[Consultants]
    ([ClinicClinicId]);
GO

-- Creating foreign key on [ConsultantConsultantId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_ConsultantAppointment]
    FOREIGN KEY ([ConsultantConsultantId])
    REFERENCES [dbo].[Consultants]
        ([ConsultantId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConsultantAppointment'
CREATE INDEX [IX_FK_ConsultantAppointment]
ON [dbo].[Appointments]
    ([ConsultantConsultantId]);
GO

-- Creating foreign key on [ChildChildId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_ChildAppointment]
    FOREIGN KEY ([ChildChildId])
    REFERENCES [dbo].[Children]
        ([ChildId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildAppointment'
CREATE INDEX [IX_FK_ChildAppointment]
ON [dbo].[Appointments]
    ([ChildChildId]);
GO

-- Creating foreign key on [AppointmentAppointmentId] in table 'Medications'
ALTER TABLE [dbo].[Medications]
ADD CONSTRAINT [FK_AppointmentMedication]
    FOREIGN KEY ([AppointmentAppointmentId])
    REFERENCES [dbo].[Appointments]
        ([AppointmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AppointmentMedication'
CREATE INDEX [IX_FK_AppointmentMedication]
ON [dbo].[Medications]
    ([AppointmentAppointmentId]);
GO

-- Creating foreign key on [ChildChildId] in table 'Medications'
ALTER TABLE [dbo].[Medications]
ADD CONSTRAINT [FK_ChildMedication]
    FOREIGN KEY ([ChildChildId])
    REFERENCES [dbo].[Children]
        ([ChildId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildMedication'
CREATE INDEX [IX_FK_ChildMedication]
ON [dbo].[Medications]
    ([ChildChildId]);
GO

-- Creating foreign key on [Appointment_AppointmentId] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_InvoiceAppointment]
    FOREIGN KEY ([Appointment_AppointmentId])
    REFERENCES [dbo].[Appointments]
        ([AppointmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceAppointment'
CREATE INDEX [IX_FK_InvoiceAppointment]
ON [dbo].[Invoices]
    ([Appointment_AppointmentId]);
GO

-- Creating foreign key on [ChildChildId] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_ChildInvoice]
    FOREIGN KEY ([ChildChildId])
    REFERENCES [dbo].[Children]
        ([ChildId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChildInvoice'
CREATE INDEX [IX_FK_ChildInvoice]
ON [dbo].[Invoices]
    ([ChildChildId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------