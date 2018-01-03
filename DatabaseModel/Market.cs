using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DatabaseModel
{
    public class Market
    {
        public int ID { get; set; }

        [StringLength(128)]
        public string Adresa { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Nume invalid")]
        public string Denumire { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Imaginea magazinului este obligatorie")]
        public string Imagine { get; set; }

        [StringLength(50)]
        public string Oras { get; set; }


        public List<int> Coordonate { get; set; }
    }
}
