//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Appointment
    {
        public int AppointmentId { get; set; }
        public int ChildChildId { get; set; }
        public int ConsultantConsultantId { get; set; }
        public int InvoiceInvoiceId { get; set; }
        public string Date { get; set; }
    
        public virtual Child Child { get; set; }
        public virtual Consultant Consultant { get; set; }
        public virtual Prescription Prescription { get; set; }
        public virtual Invoice Invoice { get; set; }
    }
}