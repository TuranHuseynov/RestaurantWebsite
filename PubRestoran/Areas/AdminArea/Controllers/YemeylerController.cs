using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PubRestoran.Models;

namespace PubRestoran.Areas.AdminArea.Controllers
{
    public class YemeylerController : Controller
    {
        private PubRestoranEntities db = new PubRestoranEntities();

        // GET: AdminArea/Yemeyler
        public ActionResult Index()
        {
            var yemeys = db.Yemeys.Include(y => y.Category).Include(y => y.Olke);
            return View(yemeys.ToList());
        }

        // GET: AdminArea/Yemeyler/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Yemey yemey = db.Yemeys.Find(id);
            if (yemey == null)
            {
                return HttpNotFound();
            }
            return View(yemey);
        }

        // GET: AdminArea/Yemeyler/Create
        public ActionResult Create()
        {
            ViewBag.category_id = new SelectList(db.Categories, "category_id", "category_name");
            ViewBag.olke_id = new SelectList(db.Olkes, "olke_id", "olke_ad");
            return View();
        }

        // POST: AdminArea/Yemeyler/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,category_id,olke_id,price,yemek_adi")] Yemey yemey)
        {
            if (ModelState.IsValid)
            {
                db.Yemeys.Add(yemey);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.category_id = new SelectList(db.Categories, "category_id", "category_name", yemey.category_id);
            ViewBag.olke_id = new SelectList(db.Olkes, "olke_id", "olke_ad", yemey.olke_id);
            return View(yemey);
        }

        // GET: AdminArea/Yemeyler/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Yemey yemey = db.Yemeys.Find(id);
            if (yemey == null)
            {
                return HttpNotFound();
            }
            ViewBag.category_id = new SelectList(db.Categories, "category_id", "category_name", yemey.category_id);
            ViewBag.olke_id = new SelectList(db.Olkes, "olke_id", "olke_ad", yemey.olke_id);
            return View(yemey);
        }

        // POST: AdminArea/Yemeyler/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,category_id,olke_id,price,yemek_adi")] Yemey yemey)
        {
            if (ModelState.IsValid)
            {
                db.Entry(yemey).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.category_id = new SelectList(db.Categories, "category_id", "category_name", yemey.category_id);
            ViewBag.olke_id = new SelectList(db.Olkes, "olke_id", "olke_ad", yemey.olke_id);
            return View(yemey);
        }

        // GET: AdminArea/Yemeyler/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Yemey yemey = db.Yemeys.Find(id);
            if (yemey == null)
            {
                return HttpNotFound();
            }
            return View(yemey);
        }

        // POST: AdminArea/Yemeyler/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Yemey yemey = db.Yemeys.Find(id);
            db.Yemeys.Remove(yemey);
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
