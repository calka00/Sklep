using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Sklep_komputerowy.Startup))]
namespace Sklep_komputerowy
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
