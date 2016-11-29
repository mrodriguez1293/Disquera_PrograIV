using System.Web.Mvc;

namespace IdentitySample.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            if (Request.IsAuthenticated && User.IsInRole("Admin"))
            {
                //return View("Dash_Admin");
                return RedirectToAction("Index", "UsersAdmin");
            }
            else if (Request.IsAuthenticated && User.IsInRole("Ejecutivo"))
            {
                //return View("Dash_Ejecutivo");
                return RedirectToAction("Index", "Ventas");
            }
            else if (Request.IsAuthenticated && User.IsInRole("Cliente"))
            {
                return RedirectToAction("Index", "Discoes");
            }

            return View();
        }

        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
