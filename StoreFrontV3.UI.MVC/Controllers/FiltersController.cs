using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontV3.DATA.EF;

namespace StoreFrontV3.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();
        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Clientside()
        {
            DbSet<Guitar> guitars = db.Guitars;
            return View(guitars.ToList());
        }

        public ActionResult GuitarsGrid()
        {
            ViewBag.Genres = db.Brands.Select(x => x.BrandName).ToList();

            List<Guitar> guitars = db.Guitars.Include(b => b.GuitarCategory).Include(b => b.ProductionDate).Include(b => b.GuitarModel).Include(b => b.GuitarInventory).ToList();
            return View(guitars);
        }



    }
}