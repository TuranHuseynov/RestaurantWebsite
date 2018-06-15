using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PubRestoran.Models;
using PubRestoran.ViewModel;

namespace PubRestoran.Controllers
{
    public class AdminimController : Controller
    {
        PubRestoranEntities db = new PubRestoranEntities();
        Mymodel vm = new Mymodel();
        // GET: Adminim
        public ActionResult Index()
        {
            vm._booking = (from s in db.Bookings
                           orderby s.booking_id descending
                           select s).ToList();
            return View(vm);
        }
    }
}