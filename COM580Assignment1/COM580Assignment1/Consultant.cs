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
    
    public partial class Consultant
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Consultant()
        {
            this.Appointments = new HashSet<Appointment>();
        }
    
        public int ConsultantId { get; set; }
        public int ClinicClinicId { get; set; }
        public string FName { get; set; }
        public string SName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    
        public virtual Clinic Clinic { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}
