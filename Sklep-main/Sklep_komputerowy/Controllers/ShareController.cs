using Sklep_komputerowy.Models;
using EntityFrameworkModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class ShareController : Controller
    {
        private SklepInternetowy _dbContext;
        public ShareController()
        {
            _dbContext = new SklepInternetowy();
        }

        public ActionResult test(int id)
        {

            var query = _dbContext.Koszyk_Podzespol.Where(x => x.KoszykId == id).ToList();

            return View(query);
         
        }
    }
}


//public ActionResult Processor(int id)
//{

//    // Pobranie procesora o określonym ID
//    var processor = _dbContext.Podzespoly.Where(x => x.Id == id).Single();
//    if (processor == null)
//    {
//        // Obsługa błędu, jeśli procesor o podanym ID nie istnieje
//        return HttpNotFound();
//    }

//    // Przekazanie modelu procesora do widoku
//    return View(processor);
//}