using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sklep_komputerowy.Models
{
    public class podzespoły
    {
        public string Nazwa { get; set; }

        public List<Specyfikacja> Specyfikacje { get; set; }

        public string Obraz { get; set; }

        public string Cena { get; set; }
    }
}