using System.Web.Mvc;

namespace StoreFrontV3.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Team()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Staff()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }
    }
}
