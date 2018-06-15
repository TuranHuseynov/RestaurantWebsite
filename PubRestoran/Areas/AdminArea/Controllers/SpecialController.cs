using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PubRestoran.Models;

namespace PubRestoran.Areas.AdminArea.Controllers
{
    public class SpecialController : Controller
    {
        private PubRestoranEntities db = new PubRestoranEntities();

        // GET: AdminArea/Special
        public ActionResult Index()
        {
            return View(db.Specials.ToList());
        }

        // GET: AdminArea/Special/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Special special = db.Specials.Find(id);
            if (special == null)
            {
                return HttpNotFound();
            }
            return View(special);
        }

        // GET: AdminArea/Special/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminArea/Special/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "special_id,special_percent,special_header,special_text")] Special special, HttpPostedFileBase special_back_img)
        {
            if (ModelState.IsValid)
            {
                if (Path.GetExtension(special_back_img.FileName) == ".jpg" || Path.GetExtension(special_back_img.FileName) == ".jpeg")
                {
                    var file_name = Path.GetFileName(special_back_img.FileName);
                    var src = Path.Combine(Server.MapPath("/Uploads"), file_name);
                    special_back_img.SaveAs(src);
                }
                special.special_back_img = Path.GetFileName(special_back_img.FileName);
                db.Specials.Add(special);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(special);
        }

        // GET: AdminArea/Special/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Special special = db.Specials.Find(id);
            if (special == null)
            {
                return HttpNotFound();
            }
            return View(special);
        }

        // POST: AdminArea/Special/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "special_id,special_percent,special_header,special_text,special_back_img")] Special special)
        {
            if (ModelState.IsValid)
            {
                db.Entry(special).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(special);
        }

        // GET: AdminArea/Special/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Special special = db.Specials.Find(id);
            if (special == null)
            {
                return HttpNotFound();
            }
            return View(special);
        }

        // POST: AdminArea/Special/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Special special = db.Specials.Find(id);
            db.Specials.Remove(special);
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
