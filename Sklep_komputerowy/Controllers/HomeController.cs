using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Main_site()
        {
            return View();
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