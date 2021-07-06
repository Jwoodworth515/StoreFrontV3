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
    public class GuitarsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Guitars
        public ActionResult Index()
        {
            var guitars = db.Guitars.Include(g => g.Brand).Include(g => g.Department).Include(g => g.Guitar_Category).Include(g => g.GuitarInventory);
            return View(guitars.ToList());
        }

        // GET: Guitars/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guitar guitar = db.Guitars.Find(id);
            if (guitar == null)
            {
                return HttpNotFound();
            }
            return View(guitar);
        }

        // GET: Guitars/Create
        public ActionResult Create()
        {
            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName");
            ViewBag.DeptID = new SelectList(db.Departments, "DeptID", "DeptName");
            ViewBag.GuitarCategory = new SelectList(db.Guitar_Categories, "GuitarCategoryID", "GuitarCategory");
            ViewBag.GuitarInventoryID = new SelectList(db.GuitarInventories, "GuitarInventoryID", "GuitarInventoryName");
            return View();
        }

        // POST: Guitars/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "GuitarID,GuitarModel,GuitarDescription,GuitarImage,Price,UnitsInStock,UnitsOnOrder,UnitsSold,ProductionDate,BrandID,GuitarInventoryID,GuitarCategory,DeptID")] Guitar guitar)
        {
            if (ModelState.IsValid)
            {
                db.Guitars.Add(guitar);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName", guitar.BrandID);
            ViewBag.DeptID = new SelectList(db.Departments, "DeptID", "DeptName", guitar.DeptID);
            ViewBag.GuitarCategory = new SelectList(db.Guitar_Categories, "GuitarCategoryID", "GuitarCategory", guitar.GuitarCategory);
            ViewBag.GuitarInventoryID = new SelectList(db.GuitarInventories, "GuitarInventoryID", "GuitarInventoryName", guitar.GuitarInventoryID);
            return View(guitar);
        }

        // GET: Guitars/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guitar guitar = db.Guitars.Find(id);
            if (guitar == null)
            {
                return HttpNotFound();
            }
            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName", guitar.BrandID);
            ViewBag.DeptID = new SelectList(db.Departments, "DeptID", "DeptName", guitar.DeptID);
            ViewBag.GuitarCategory = new SelectList(db.Guitar_Categories, "GuitarCategoryID", "GuitarCategory", guitar.GuitarCategory);
            ViewBag.GuitarInventoryID = new SelectList(db.GuitarInventories, "GuitarInventoryID", "GuitarInventoryName", guitar.GuitarInventoryID);
            return View(guitar);
        }

        // POST: Guitars/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "GuitarID,GuitarModel,GuitarDescription,GuitarImage,Price,UnitsInStock,UnitsOnOrder,UnitsSold,ProductionDate,BrandID,GuitarInventoryID,GuitarCategory,DeptID")] Guitar guitar)
        {
            if (ModelState.IsValid)
            {
                db.Entry(guitar).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BrandID = new SelectList(db.Brands, "BrandID", "BrandName", guitar.BrandID);
            ViewBag.DeptID = new SelectList(db.Departments, "DeptID", "DeptName", guitar.DeptID);
            ViewBag.GuitarCategory = new SelectList(db.Guitar_Categories, "GuitarCategoryID", "GuitarCategory", guitar.GuitarCategory);
            ViewBag.GuitarInventoryID = new SelectList(db.GuitarInventories, "GuitarInventoryID", "GuitarInventoryName", guitar.GuitarInventoryID);
            return View(guitar);
        }

        // GET: Guitars/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guitar guitar = db.Guitars.Find(id);
            if (guitar == null)
            {
                return HttpNotFound();
            }
            return View(guitar);
        }

        // POST: Guitars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Guitar guitar = db.Guitars.Find(id);
            db.Guitars.Remove(guitar);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

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
