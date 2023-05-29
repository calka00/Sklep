using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Data.Entity;
using Microsoft.AspNet.Identity.EntityFramework;
using Sklep_komputerowy.Models;


namespace Sklep_komputerowy
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Database.SetInitializer(new CreateDatabaseIfNotExists<ApplicationDbContext>());
            ApplicationDbContext context = new ApplicationDbContext();
          //  context.Database.Initialize(true);
        }
    }
}
