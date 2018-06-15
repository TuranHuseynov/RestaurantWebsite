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
    public class MenuTypeController : Controller
    {
        private PubRestoranEntities db = new PubRestoranEntities();

        // GET: AdminArea/MenuType
        public ActionResult Index()
        {
            return View(db.Menu_Type.ToList());
        }

        // GET: AdminArea/MenuType/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu_Type menu_Type = db.Menu_Type.Find(id);
            if (menu_Type == null)
            {
                return HttpNotFound();
            }
            return View(menu_Type);
        }

        // GET: AdminArea/MenuType/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminArea/MenuType/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "menu_type_id,menu_type_name,menu_type_date")] Menu_Type menu_Type)
        {
            if (ModelState.IsValid)
            {
                db.Menu_Type.Add(menu_Type);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(menu_Type);
        }

        // GET: AdminArea/MenuType/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu_Type menu_Type = db.Menu_Type.Find(id);
            if (menu_Type == null)
            {
                return HttpNotFound();
            }
            return View(menu_Type);
        }

        // POST: AdminArea/MenuType/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "menu_type_id,menu_type_name,menu_type_date")] Menu_Type menu_Type)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menu_Type).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(menu_Type);
        }

        // GET: AdminArea/MenuType/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu_Type menu_Type = db.Menu_Type.Find(id);
            if (menu_Type == null)
            {
                return HttpNotFound();
            }
            return View(menu_Type);
        }

        // POST: AdminArea/MenuType/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Menu_Type menu_Type = db.Menu_Type.Find(id);
            db.Menu_Type.Remove(menu_Type);
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
