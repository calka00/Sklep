//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityFrameworkModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Podzespoly
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Podzespoly()
        {
            this.Koszyk_Podzespol = new HashSet<Koszyk_Podzespol>();
            this.Podzespoly_Cechy = new HashSet<Podzespoly_Cechy>();
        }
    
        public int Id { get; set; }
        public string Nazwa { get; set; }
        public decimal Cena { get; set; }
        public string Opis { get; set; }
        public int KategoriaId { get; set; }
        public string Obrazki { get; set; }
    
        public virtual Kategorie Kategorie { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Koszyk_Podzespol> Koszyk_Podzespol { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Podzespoly_Cechy> Podzespoly_Cechy { get; set; }
    }
}