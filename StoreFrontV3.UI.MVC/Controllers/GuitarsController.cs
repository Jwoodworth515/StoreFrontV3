using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontV3.DATA.EF;
using StoreFrontV3.UI.MVC.Models;
using MVC3.UI.MVC.Utilities;
//using StoreFrontV3.UI.MVC.Utilities;

namespace StoreFrontV3.UI.MVC.Controllers
{
    public class GuitarsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();
        private string savePath;
        private string file;

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

        #region Add to Cart Functionality (Called from the Details View)
        public ActionResult AddToCart(int qty, int GuitarID)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            Guitar product = db.Guitars.Where(b => b.GuitarID == GuitarID).FirstOrDefault();
            if (product == null)
            {
                return RedirectToAction("index");
            }
            else
            {
                CartItemViewModel item = new CartItemViewModel(qty, product);

                if (shoppingCart.ContainsKey(product.GuitarID))
                {
                    shoppingCart[product.GuitarID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.GuitarID, item);
                }

                Session["cart"] = shoppingCart; //casting from a smaller container to a bigger container, no explicit cast is needed.
            }

            return RedirectToAction("Index", "ShoppingCart");
        }

        #endregion


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
        public ActionResult Create([Bind(Include = "GuitarID,GuitarModel,GuitarDescription,GuitarImage,Price,UnitsInStock,UnitsOnOrder,UnitsSold,ProductionDate,BrandID,GuitarInventoryID,GuitarCategory,DeptID")] Guitar guitar, HttpPostedFileBase guitarImage)
        {
            if (ModelState.IsValid)
            {
                #region file Upload
                string imageName = "noImage.png";

                if (guitarImage != null)
                {
                    imageName = guitarImage.FileName;


                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        guitarImage.SaveAs(Server.MapPath("~/Content/images/Guitars/"));

                        Image convertedImage = Image.FromStream(guitarImage.InputStream);

                        int maxImageSize = 150;

                        int maxThumbSize = 225;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                    }
                    else
                    {
                        //imageName = "noImage.png";
                        ModelState.AddModelError(string.Empty, "Uploaded file type not approved.  Please instead upload a .png, .gif, .jpg, or .jpeg");
                        return View(guitar);
                    }

                }
                guitar.GuitarImage = imageName;

                #endregion

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
        public ActionResult Edit([Bind(Include = "GuitarID,GuitarModel,GuitarDescription,GuitarImage,Price,UnitsInStock,UnitsOnOrder,UnitsSold,ProductionDate,BrandID,GuitarInventoryID,GuitarCategory,DeptID")] Guitar guitar, HttpPostedFileBase guitarImage)
        {
            if (ModelState.IsValid)
            {
                #region file Upload

                if (guitarImage != null)
                {
                    string imageName = guitarImage.FileName;

                    string ext = imageName.Substring(imageName.LastIndexOf("."));

                    string[] goodExts = new string[] { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()))
                    {
                        imageName = Guid.NewGuid() + ext;

                        guitarImage.SaveAs(Server.MapPath("~/Content/images/Guitars/" + imageName));

                        if (guitar.GuitarImage != null && guitar.GuitarImage != "noImage.png")
                        {
                            System.IO.File.Delete(Server.MapPath("~/Content/images/Guitars/" + guitar.GuitarImage));
                        }

                        Image convertedImage = Image.FromStream(guitarImage.InputStream);

                        int maxImageSize = 150;

                        int maxThumbSize = 225;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        guitar.GuitarImage = imageName;

                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Uploaded file type not approved.  Please instead upload a .png, .gif, .jpg, or .jpeg");
                        return View(guitar);
                    }
                }

                #endregion

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

            if (guitar.GuitarImage != null && guitar.GuitarImage != "noImage.png")
            {
                System.IO.File.Delete(Server.MapPath("~/Content/images/Guitars/" + guitar.GuitarImage));
            }

            guitar.GuitarInventoryID = 4;
            guitar.GuitarImage = "noImage.png";
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
