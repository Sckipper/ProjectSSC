//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DatabaseModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Furnizor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Furnizor()
        {
            this.Livrare = new HashSet<Livrare>();
        }
    
        public int ID { get; set; }
        public string Nume { get; set; }
        public string Adresa { get; set; }
        public string Oras { get; set; }
        public decimal Telefon { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Livrare> Livrare { get; set; }
    }
}
