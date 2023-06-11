using EntityFrameworkModel;
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
        private SklepInternetowy _dbContext;
        public InformationsController()
        {
            _dbContext = new SklepInternetowy();
        }

        public ActionResult Processors_info(int id)
        {
            // Pobranie procesora o określonym ID
            var processor = _dbContext.Podzespoly.Where(x => x.Id == id).Single();
            if (processor == null)
            {
                // Obsługa błędu, jeśli procesor o podanym ID nie istnieje
                return HttpNotFound();
            }

            // Przekazanie modelu procesora do widoku
            return View(processor);

        }
    }
}
