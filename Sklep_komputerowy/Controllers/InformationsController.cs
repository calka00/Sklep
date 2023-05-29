using Sklep_komputerowy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class InformationsController : Controller
    {
        public ActionResult Processors_info()
        {
            podzespoły info = new podzespoły
            {
                Specyfikacje = new List<Specyfikacja>
                {
                    new Specyfikacja()
                    {
                        Nazwa = "Częstotliwość taktowania procesora",
                        Wartosc = "3 GHz"
                    },
                    new Specyfikacja()
                    {
                        Nazwa = "Liczba rdzeni",
                        Wartosc = "24"
                    },
                    new Specyfikacja()
                    {
                        Nazwa = "Odblokowany mnożnik",
                        Wartosc = "Tak"
                    },
                    new Specyfikacja()
                    {
                        Nazwa = "Typ gniazda",
                        Wartosc = "Socket 1700"
                    },
                    new Specyfikacja()
                    {
                        Nazwa = "Załączone chłodzenie",
                        Wartosc = "Nie"
                    },
                },
                Obraz = "~/Pictures/Procesory/Intel Core i9-13900K.jfif",
                Cena = "Cena: 2902,99 zł"
            };

            return View(info);
        }
    }
}
