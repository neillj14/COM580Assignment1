
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/14/2020 18:37:04
-- Generated from EDMX file: D:\OneDrive - Ulster University\Final Year\COM580\COM580Assignment1\COM580Assignment1\COM580Assignment1\ClinicDataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ClinicDatabase];
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
IF OBJECT_ID(N'[dbo].[FK_ClinicParent]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Parents] DROP CONSTRAINT [FK_ClinicParent];
GO
IF OBJECT_ID(N'[dbo].[FK_ChildAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_ChildAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_ConsultantAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_ConsultantAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_AppointmentPrescription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_AppointmentPrescription];
GO
IF OBJECT_ID(N'[dbo].[FK_PrescriptionMedication]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Medications] DROP CONSTRAINT [FK_PrescriptionMedication];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoicePrescription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Prescriptions] DROP CONSTRAINT [FK_InvoicePrescription];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_InvoiceAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_ParentInvoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_ParentInvoice];
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
IF OBJECT_ID(N'[dbo].[Prescriptions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Prescriptions];
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
    [ParentId] int IDENTITY(1,1) NOT NULL,
    [ClinicClinicId] int  NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Children'
CREATE TABLE [dbo].[Children] (
    [ChildId] int IDENTITY(1,1) NOT NULL,
    [ParentParentId] int  NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [DoB] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Clinics'
CREATE TABLE [dbo].[Clinics] (
    [ClinicId] int IDENTITY(1,1) NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Consultants'
CREATE TABLE [dbo].[Consultants] (
    [ConsultantId] int IDENTITY(1,1) NOT NULL,
    [ClinicClinicId] int  NOT NULL,
    [FName] nvarchar(max)  NOT NULL,
    [SName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [AppointmentId] int IDENTITY(1,1) NOT NULL,
    [ChildChildId] int  NOT NULL,
    [ConsultantConsultantId] int  NOT NULL,
    [InvoiceInvoiceId] int  NOT NULL,
    [Date] nvarchar(max)  NOT NULL,
    [Prescription_PrescriptionId] int  NOT NULL
);
GO

-- Creating table 'Prescriptions'
CREATE TABLE [dbo].[Prescriptions] (
    [PrescriptionId] int IDENTITY(1,1) NOT NULL,
    [InvoiceInvoiceId] int  NOT NULL
);
GO

-- Creating table 'Medications'
CREATE TABLE [dbo].[Medications] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PrescriptionPrescriptionId] int  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Strength] nvarchar(max)  NOT NULL,
    [Dose] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [InvoiceId] int IDENTITY(1,1) NOT NULL,
    [ParentParentId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ParentId] in table 'Parents'
ALTER TABLE [dbo].[Parents]
ADD CONSTRAINT [PK_Parents]
    PRIMARY KEY CLUSTERED ([ParentId] ASC);
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

-- Creating primary key on [PrescriptionId] in table 'Prescriptions'
ALTER TABLE [dbo].[Prescriptions]
ADD CONSTRAINT [PK_Prescriptions]
    PRIMARY KEY CLUSTERED ([PrescriptionId] ASC);
GO

-- Creating primary key on [Id] in table 'Medications'
ALTER TABLE [dbo].[Medications]
ADD CONSTRAINT [PK_Medications]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [InvoiceId] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ParentParentId] in table 'Children'
ALTER TABLE [dbo].[Children]
ADD CONSTRAINT [FK_ParentChild]
    FOREIGN KEY ([ParentParentId])
    REFERENCES [dbo].[Parents]
        ([ParentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParentChild'
CREATE INDEX [IX_FK_ParentChild]
ON [dbo].[Children]
    ([ParentParentId]);
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

-- Creating foreign key on [ClinicClinicId] in table 'Parents'
ALTER TABLE [dbo].[Parents]
ADD CONSTRAINT [FK_ClinicParent]
    FOREIGN KEY ([ClinicClinicId])
    REFERENCES [dbo].[Clinics]
        ([ClinicId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClinicParent'
CREATE INDEX [IX_FK_ClinicParent]
ON [dbo].[Parents]
    ([ClinicClinicId]);
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

-- Creating foreign key on [Prescription_PrescriptionId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_AppointmentPrescription]
    FOREIGN KEY ([Prescription_PrescriptionId])
    REFERENCES [dbo].[Prescriptions]
        ([PrescriptionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AppointmentPrescription'
CREATE INDEX [IX_FK_AppointmentPrescription]
ON [dbo].[Appointments]
    ([Prescription_PrescriptionId]);
GO

-- Creating foreign key on [PrescriptionPrescriptionId] in table 'Medications'
ALTER TABLE [dbo].[Medications]
ADD CONSTRAINT [FK_PrescriptionMedication]
    FOREIGN KEY ([PrescriptionPrescriptionId])
    REFERENCES [dbo].[Prescriptions]
        ([PrescriptionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrescriptionMedication'
CREATE INDEX [IX_FK_PrescriptionMedication]
ON [dbo].[Medications]
    ([PrescriptionPrescriptionId]);
GO

-- Creating foreign key on [InvoiceInvoiceId] in table 'Prescriptions'
ALTER TABLE [dbo].[Prescriptions]
ADD CONSTRAINT [FK_InvoicePrescription]
    FOREIGN KEY ([InvoiceInvoiceId])
    REFERENCES [dbo].[Invoices]
        ([InvoiceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoicePrescription'
CREATE INDEX [IX_FK_InvoicePrescription]
ON [dbo].[Prescriptions]
    ([InvoiceInvoiceId]);
GO

-- Creating foreign key on [InvoiceInvoiceId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_InvoiceAppointment]
    FOREIGN KEY ([InvoiceInvoiceId])
    REFERENCES [dbo].[Invoices]
        ([InvoiceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceAppointment'
CREATE INDEX [IX_FK_InvoiceAppointment]
ON [dbo].[Appointments]
    ([InvoiceInvoiceId]);
GO

-- Creating foreign key on [ParentParentId] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_ParentInvoice]
    FOREIGN KEY ([ParentParentId])
    REFERENCES [dbo].[Parents]
        ([ParentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ParentInvoice'
CREATE INDEX [IX_FK_ParentInvoice]
ON [dbo].[Invoices]
    ([ParentParentId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------