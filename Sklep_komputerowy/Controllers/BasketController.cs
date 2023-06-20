using EntityFrameworkModel;
using System.Linq;
using System.Security.Claims;
using System.Threading;
using System.Web.Mvc;

namespace Sklep_komputerowy.Controllers
{
    public class BasketController : Controller
    {
        private SklepInternetowy _dbContext;
        public BasketController()
        {
            _dbContext = new SklepInternetowy();
        }
        private void RemovePodzespol(Koszyk_Podzespol podzespol)
        {
            _dbContext.Koszyk_Podzespol.Remove(podzespol);
            _dbContext.SaveChanges();
        }

        public ActionResult RemoveFromBasket(int podzespolId, int koszykId)
        {
            var podzespol = _dbContext.Koszyk_Podzespol.Where(x => x.PodzespolId == podzespolId && x.KoszykId == koszykId).First();
            RemovePodzespol(podzespol);

            return RedirectToAction("Basket", "Home");
        }

        public ActionResult DecreaseItemInBasket(int podzespolId, int koszykId)
        {
            var podzespol = _dbContext.Koszyk_Podzespol.Where(x => x.PodzespolId == podzespolId && x.KoszykId == koszykId).First();

            if (podzespol.Ilosc > 1)
            {
                podzespol.Ilosc--;
                _dbContext.SaveChanges();
            }
            else
            {
                RemovePodzespol(podzespol);
            }

            return RedirectToAction("Basket", "Home");
        }

        public void AddToBasket(int id)
        {
            var identity = (ClaimsPrincipal)Thread.CurrentPrincipal;
            // Get the claims values
            string userIdValue = identity.Claims.Where(c => c.Type == ClaimTypes.NameIdentifier)
                               .Select(c => c.Value).SingleOrDefault();

            if (string.IsNullOrEmpty(userIdValue))
            {
                RedirectToAction("Login", "Account", null);
                return;
            }

            var userId = int.Parse(userIdValue);

            var koszyk = _dbContext.Koszyk.Where(x => x.UzytkownikId == userId).FirstOrDefault();
            if (koszyk == null)
            {
                koszyk = new Koszyk
                {
                    UzytkownikId = userId
                };

                _dbContext.Koszyk.Add(koszyk);
                _dbContext.SaveChanges();
            }

            var koszyk_podzespol = koszyk.Koszyk_Podzespol.Where(x => x.PodzespolId == id).FirstOrDefault();

            if (koszyk_podzespol != null)
            {
                koszyk_podzespol.Ilosc++;
                _dbContext.SaveChanges();
            }
            else
            {
                koszyk_podzespol = new Koszyk_Podzespol
                {
                    KoszykId = koszyk.Id,
                    Ilosc = 1,
                    PodzespolId = id
                };

                _dbContext.Koszyk_Podzespol.Add(koszyk_podzespol);
                _dbContext.SaveChanges();
            }
        }
    }
}