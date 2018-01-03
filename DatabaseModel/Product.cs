using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseModel
{
    public class Product
    {
        [Range(1, int.MaxValue, ErrorMessage = "ID Ivalid")]
        public int ID { get; set; }

        [StringLength(50)]
        public string CategoryName { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "ID Categorie Ivalid")]
        [Required(ErrorMessage = "Categorie invalida")]
        public int CategorieID { get; set; }

        [StringLength(50)]
        public string MarketName { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "ID Magazin Ivalid")]
        [Required(ErrorMessage = "Magazin invalid")]
        public int MagazinID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Denumire invalida")]
        public string Denumire { get; set; }

        [StringLength(50)]
        public string Greutate { get; set; }

        [Range(1, float.MaxValue, ErrorMessage = "Pret Ivalid")]
        [Required(ErrorMessage = "Pret invalid")]
        public Nullable<double> Pret { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Cantitate Invalida")]
        [Required(ErrorMessage = "Cantitate invalida")]
        public int Cantitate { get; set; }


        public Nullable<System.DateTime> DataExpirate { get; set; }
        [StringLength(1024)]
        public string Descriere { get; set; }

        [StringLength(50)]
        public string Imagine { get; set; }
    }
}
