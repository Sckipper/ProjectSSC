﻿using System.ComponentModel.DataAnnotations;

namespace ProjectSSC.Models
{
    public class LoginModel
    {
        [Required]
        public string Email { get; set; }
        [Required]
        public string Password { get; set; }
        public bool RememberMe { get; set; }
        public string Message { get; set; }
    }
}