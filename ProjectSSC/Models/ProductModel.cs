﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using DatabaseModel;

namespace ProjectSSC.Models
{
    public class ProductModel
    {
        public Product Product { get; set; }
        public List<Category> Categories { get; set; }
        public List<Market> Markets { get; set; }
    }
}