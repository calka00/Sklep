using System;
using System.Collections.Generic;
using EntityFrameworkModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class HomeController : Controller
    {
        private SklepInternetowy _dbContext;
        public HomeController()
        {
            _dbContext = new SklepInternetowy();
        }

        public ActionResult Kategorie(int id)
        {

            // Pobranie procesora o określonym ID
            var komponenty = _dbContext.Kategorie.Where(x => x.Id == id).Single();
            if (komponenty == null)
            {
                // Obsługa błędu, jeśli procesor o podanym ID nie istnieje
                return HttpNotFound();
            }

            // Przekazanie modelu procesora do widoku
            return View(komponenty);
        }

        public ActionResult Main_site()
        {
            var query = _dbContext.Kategorie.ToList();

            return View(query);
        }

        public ActionResult About()
        {

            return View();
        }

        public ActionResult Basket()
        {

            return View();
        }
    }
}