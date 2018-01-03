using System;
using System.ComponentModel.DataAnnotations;

namespace DatabaseModel
{
    public class Delivery
    {
        public int ID { get; set; }

        [Required(ErrorMessage = "Furnizor invalid")]
        public int FurnizorID { get; set; }

        public string SupplierName { get; set; }

        [Required(ErrorMessage = "Magazin invalid")]
        public int MagazinID { get; set; }

        public string MarketName { get; set; }

        [Required(ErrorMessage = "Data invalida")]
        public System.DateTime DataSolicitare { get; set; }

        public Nullable<System.DateTime> DataLivrare { get; set; }

        public string Status { get; set; }

        public string Descriere { get; set; }

        [Required(ErrorMessage = "Pret invalid")]
        public int Pret { get; set; }
    }
}
