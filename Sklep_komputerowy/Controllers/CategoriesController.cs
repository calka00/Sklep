using System;
using EntityFrameworkModel;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class CategoriesController : Controller
    {
        private SklepInternetowy _dbContext;
        public CategoriesController()
        {
            _dbContext = new SklepInternetowy();
        }

        public ActionResult Processors(int id)
        {
            var query = _dbContext.Podzespoly.Where(x => x.KategoriaId == id).ToList();

            return View(query);
        }
    }
}