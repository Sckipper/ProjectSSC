using System;
using System.ComponentModel.DataAnnotations;

namespace DatabaseModel
{
    public class Delivery
    {
        [Range(1, int.MaxValue, ErrorMessage = "ID Ivalid")]
        public int ID { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "ID Furnizor Ivalid")]
        [Required(ErrorMessage = "Furnizor invalid")]
        public int FurnizorID { get; set; }

        [StringLength(50)]
        public string SupplierName { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "ID Magazin Ivalid")]
        [Required(ErrorMessage = "Magazin invalid")]
        public int MagazinID { get; set; }

        [StringLength(50)]
        public string MarketName { get; set; }


        [Required(ErrorMessage = "Data invalida")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public System.DateTime DataSolicitare { get; set; }
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public Nullable<System.DateTime> DataLivrare { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(512)]
        public string Descriere { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Pret Invalid")]
        [Required(ErrorMessage = "Pret invalid")]
        public int Pret { get; set; }
    }
}
