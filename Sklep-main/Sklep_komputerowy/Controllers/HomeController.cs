using System;
using System.Collections.Generic;
using EntityFrameworkModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Claims;
using System.Threading;

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
        
        [Authorize]
        public ActionResult Basket()
        {
            var identity = (ClaimsPrincipal)Thread.CurrentPrincipal;
            // Get the claims values
            string userIdValue = identity.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier)
                               .Select(c => c.Value).SingleOrDefault();

            if (string.IsNullOrEmpty(userIdValue))
            {
                return RedirectToAction("Login", "Account", null);
            }
            var userId = int.Parse(userIdValue);

            var koszyk = _dbContext.Koszyk_Podzespol.Where(x => x.Koszyk.UzytkownikId == userId).ToList();
            return View(koszyk);
        }
    }
}