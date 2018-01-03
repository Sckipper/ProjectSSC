using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DatabaseModel
{
    public class Category
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string CategoryName { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "ID Categorie Ivalid")]
        public Nullable<int> CategorieID { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Nume invalid")]
        public string Nume { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Cod invalid")]
        public string Cod { get; set; }

        [StringLength(1024)]
        public string Descriere { get; set; }

        [StringLength(50)]
        public string Imagine { get; set; }

        public List<int> MarketCoords { get; set; }
    }
}
