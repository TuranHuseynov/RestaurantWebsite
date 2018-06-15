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
    public class OfferController : Controller
    {
        private PubRestoranEntities db = new PubRestoranEntities();

        // GET: AdminArea/Offer
        public ActionResult Index()
        {
            return View(db.Offers.ToList());
        }

        // GET: AdminArea/Offer/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Offer offer = db.Offers.Find(id);
            if (offer == null)
            {
                return HttpNotFound();
            }
            return View(offer);
        }

        // GET: AdminArea/Offer/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AdminArea/Offer/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "offer_id,offer_header,offer_text,offer_date,offer_insides,offer_about_insides")] Offer offer,HttpPostedFileBase offer_img)
        {
            if (ModelState.IsValid)
            {
                if (Path.GetExtension(offer_img.FileName) == ".jpg" || Path.GetExtension(offer_img.FileName) == ".jpeg")
                {
                    var file_name = Path.GetFileName(offer_img.FileName);
                    var src = Path.Combine(Server.MapPath("/Uploads"), file_name);
                    offer_img.SaveAs(src);
                }
                offer.offer_img = Path.GetFileName(offer_img.FileName);
                db.Offers.Add(offer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(offer);
        }

        // GET: AdminArea/Offer/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Offer offer = db.Offers.Find(id);
            if (offer == null)
            {
                return HttpNotFound();
            }
            return View(offer);
        }

        // POST: AdminArea/Offer/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "offer_id,offer_img,offer_header,offer_text,offer_date,offer_insides,offer_about_insides")] Offer offer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(offer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(offer);
        }

        // GET: AdminArea/Offer/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Offer offer = db.Offers.Find(id);
            if (offer == null)
            {
                return HttpNotFound();
            }
            return View(offer);
        }

        // POST: AdminArea/Offer/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Offer offer = db.Offers.Find(id);
            db.Offers.Remove(offer);
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
