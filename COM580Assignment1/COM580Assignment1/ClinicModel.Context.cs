﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace COM580Assignment1
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ClinicModelContainer : DbContext
    {
        public ClinicModelContainer()
            : base("name=ClinicModelContainer")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Parent> Parents { get; set; }
        public virtual DbSet<Child> Children { get; set; }
        public virtual DbSet<Clinic> Clinics { get; set; }
        public virtual DbSet<Consultant> Consultants { get; set; }
        public virtual DbSet<Appointment> Appointments { get; set; }
        public virtual DbSet<Medication> Medications { get; set; }
    }
}
