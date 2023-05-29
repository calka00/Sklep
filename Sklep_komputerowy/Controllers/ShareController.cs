using Sklep_komputerowy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class ShareController : Controller
    {
        private static List<UnderCategory> Procesory = new List<UnderCategory>
        {
        new UnderCategory { ID = 1, Informations = new List<Info> { new Info { Nazwa = "Intel Core i9-13900K BX8071513900K" } } },
        new UnderCategory { ID = 2, Informations = new List<Info> { new Info { Nazwa = "Intel Core i7-12700K" } } },
        };

        public ActionResult Processor(int storeID, int processorID)
        {

            // Pobranie procesora o określonym ID
            var processor = Procesory.FirstOrDefault(p => p.ID == processorID);
            if (processor == null)
            {
                // Obsługa błędu, jeśli procesor o podanym ID nie istnieje
                return HttpNotFound();
            }

            // Przekazanie modelu procesora do widoku
            return View(processor);
        }

        public ActionResult test()
        {
            UnderCategory Informations = new UnderCategory
            {
                Informations = new List<Info>
                {
                    new Info()
                    {
                        Nazwa = "Intel Core i9-13900K BX8071513900K",
                        Obraz = "~/Pictures/Procesory/Intel Core i9-13900K.jfif",
                    },
                    new Info()
                    {
                        Nazwa = "Intel Core i7-12700K",
                        Obraz = "~/Pictures/Procesory/Intel Core i7-12700K.jfif"
                    },
                    new Info()
                    {
                        Nazwa = "AMD Ryzen 7 5700X 100-100000926WOF",
                        Obraz = "~/Pictures/Procesory/AMD Ryzen 7 5700X 100-100000926WOF.jfif"
                    },
                    new Info()
                    {
                        Nazwa = "Intel Core i5-10400",
                        Obraz = "~/Pictures/Procesory/Intel Core i5-10400.jfif"
                    },
                    new Info()
                    {
                        Nazwa = "AMD ryzen 5 3600",
                        Obraz = "~/Pictures/Procesory/amd ryzen 5 3600.jfif"
                    },
                    new Info()
                    {
                        Nazwa = "AMD Ryzen 7 3700x",
                        Obraz = "~/Pictures/Procesory/AMD Ryzen 7 3700x.jfif"
                    },
                },

            };

            return View(Informations);
        }
    }
}