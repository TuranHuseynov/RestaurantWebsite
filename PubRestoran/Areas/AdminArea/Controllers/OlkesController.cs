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
    public class OlkesController : Controller
    {
        private PubRestoranEntities db = new PubRestoranEntities();

        // GET: AdminArea/Olkes
        public ActionResult Index()
        {
            return View(db.Olkes.ToList());
        }

        // GET: AdminArea/Olkes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Olke olke = db.Olkes.Find(id);
            if (olke == null)
            {
                return HttpNotFound();
            }
            return View(olke);
        }

        // GET: AdminArea/Olkes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminArea/Olkes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "olke_id,olke_ad")] Olke olke)
        {
            if (ModelState.IsValid)
            {
                db.Olkes.Add(olke);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(olke);
        }

        // GET: AdminArea/Olkes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Olke olke = db.Olkes.Find(id);
            if (olke == null)
            {
                return HttpNotFound();
            }
            return View(olke);
        }

        // POST: AdminArea/Olkes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "olke_id,olke_ad")] Olke olke)
        {
            if (ModelState.IsValid)
            {
                db.Entry(olke).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(olke);
        }

        // GET: AdminArea/Olkes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Olke olke = db.Olkes.Find(id);
            if (olke == null)
            {
                return HttpNotFound();
            }
            return View(olke);
        }

        // POST: AdminArea/Olkes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Olke olke = db.Olkes.Find(id);
            db.Olkes.Remove(olke);
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
