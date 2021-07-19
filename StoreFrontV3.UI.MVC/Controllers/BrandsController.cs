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
    public class BrandsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Brands
        public ActionResult Index()
        {
            return View(db.Brands.ToList());
        }

        #region AJAX

        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Brand brand = db.Brands.Find(id);
            db.Brands.Remove(brand);
            db.SaveChanges();

            string confirmMessage = string.Format("Deleted Book '{0}' from the database", brand.BrandName);
            return Json(new { id = id, message = confirmMessage });
        }

        [HttpGet]
        public PartialViewResult BrandDetails(int id)
        {
            Brand brand = db.Brands.Find(id);
            return PartialView(brand);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Brand brand)
        {
            db.Brands.Add(brand);
            db.SaveChanges();
            return Json(brand);
        }

        [HttpGet]
        public PartialViewResult BrandEdit(int id)
        {
            Brand brand = db.Brands.Find(id);
            return PartialView(brand);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Brand brand)
        {
            db.Entry(brand).State = EntityState.Modified;
            db.SaveChanges();
            return Json(brand);
        }
        #endregion

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}