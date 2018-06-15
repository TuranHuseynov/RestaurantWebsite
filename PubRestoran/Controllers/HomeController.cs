using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PubRestoran.Models;
using PubRestoran.ViewModel;


namespace PubRestoran.Controllers
{
    public class HomeController : Controller
    {
        PubRestoranEntities db = new PubRestoranEntities();
        Mymodel vm = new Mymodel();
        public ActionResult Index()
        {
            vm._olke = db.Olkes.ToList();
            vm._slider = db.Sliders.ToList();
            vm._service = db.Services.ToList();
            vm._gallery = db.Galleries.ToList();
            vm._offer = db.Offers.Take(1).ToList();
            vm._address = db.Addresses.ToList();
            vm._about = db.AboutUs.ToList();
            vm._special = db.Specials.ToList();
            

            return View(vm);
        }
        public ActionResult Blog(int id)
        {
            vm._blog = db.Blogs.ToList();
            vm._category = db.Categories.ToList();
            vm._yemey = db.Yemeys.Where(y => y.olke_id == id).ToList();
            vm._about = db.AboutUs.ToList();
            vm._address = db.Addresses.ToList();
            vm._olke = db.Olkes.ToList();
           

            return View(vm);
        }


        public ActionResult Post(int id)
        {
            vm._offer = db.Offers.Where(o => o.offer_id == id).ToList();
            vm._post = db.Posts.ToList();
            vm._about = db.AboutUs.ToList();
            vm._address = db.Addresses.ToList();

            return View(vm);
        }

        public ActionResult About()
        {
            vm._about = db.AboutUs.ToList();
            vm._menutype = db.Menu_Type.ToList();
            vm._address = db.Addresses.ToList();


            return View(vm);
        }
        public ActionResult Gallery()
        {
            vm._gallery = db.Galleries.ToList();
            vm._about = db.AboutUs.ToList();
            vm._address = db.Addresses.ToList();


            return View(vm);
        }

        [HttpGet]
        public ActionResult Contact()
        {
            vm._address = db.Addresses.ToList();
            vm._about = db.AboutUs.ToList();
            return View(vm);
        }

        [HttpPost]
        public ActionResult Contact(FormCollection frm)
        {
            vm._address = db.Addresses.ToList();
            vm._about = db.AboutUs.ToList();
            

            Contact msg = new Contact();
            msg.contact__user_email = frm["contact__user_email"];
            msg.contact_user_phone = frm["contact_user_phone"];
            msg.contact_text = frm["contact_text"];
            db.Contacts.Add(msg);
            db.SaveChanges();


            return View(vm);
        }


        [HttpGet]
        public ActionResult Book()
        {
            vm._address = db.Addresses.ToList();
            vm._about = db.AboutUs.ToList();

            vm._booking = db.Bookings.ToList();
            return View(vm);
        }

        [HttpPost]
        public ActionResult Book(FormCollection frm)
        {
            vm._address = db.Addresses.ToList();
            vm._about = db.AboutUs.ToList();

            Booking booking = new Booking();
            booking.booking_user_name = frm["booking_user_name"];
            booking.booking_date = Convert.ToDateTime(frm["booking_date"]);
            booking.booking_party_size = Convert.ToInt32(frm["booking_party_size"]);
            booking.booking_ex_requirements = Convert.ToString(frm["booking_ex_requirements"]);
            booking.booking_user_email = frm["booking_user_email"];
            booking.booking_user_phone = Convert.ToString(frm["booking_user_phone"]);

            db.Bookings.Add(booking);
            db.SaveChanges();
            vm._booking = db.Bookings.ToList();
            
            return View(vm);
        }


    }
}