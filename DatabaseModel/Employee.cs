﻿using System.ComponentModel.DataAnnotations;

namespace DatabaseModel
{
    public class Employee
    {
        [Range(1, int.MaxValue, ErrorMessage = "ID Ivalid")]
        public int ID { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Magazin ID invalid")]
        [Required(ErrorMessage = "Magazin invalid")]
        public int MagazinID { get; set; }

        [StringLength(50)]
        public string MarketName { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Nume obligatoriu")]
        public string Nume { get; set; }

        [StringLength(50)]
        public string Prenume { get; set; }

        [Range(1000000000000, 7000000000000, ErrorMessage = "CNP invalid")]
        [Required(ErrorMessage = "CNP invalid")]
        public long CNP { get; set; }

        [EmailAddress]
        [StringLength(50)]
        [Required(ErrorMessage = "Email invalid")]
        public string Email { get; set; }

        [StringLength(512)]
        [Required(ErrorMessage = "Parola obligatorie")]
        public string Parola { get; set; }

        [Required(ErrorMessage = "Data invalida")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public System.DateTime DataAngajare { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Salariu invalid")]
        [Required(ErrorMessage = "Salariu obligatoriu")]
        public int Salariu { get; set; }

        [StringLength(50)]
        public string Functie { get; set; }
    }
}
