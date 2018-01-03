using System.ComponentModel.DataAnnotations;

namespace DatabaseModel
{
    public class Supplier
    {
        public int ID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Nume invalid")]
        public string Nume { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Adresa invalida")]
        public string Adresa { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Oras invalid")]
        public string Oras { get; set; }

        [Range(0, long.MaxValue, ErrorMessage = "Telefon invalid")]
        [Required(ErrorMessage = "Telefon invalid")]
        [Phone]
        public long Telefon { get; set; }
    }
}
