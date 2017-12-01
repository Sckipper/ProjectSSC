using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DatabaseModel;

namespace ProjectSSC.Models
{
    public class EmployeeModel
    {
        public Employee Employee { get; set; }
        public List<Market> Markets { get; set; }
    }
}