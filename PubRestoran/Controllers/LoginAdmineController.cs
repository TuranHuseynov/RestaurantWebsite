using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PubRestoran.Models;
using PubRestoran.ViewModel;

namespace PubRestoran.Controllers
{
    public class LoginAdmineController : Controller
    {
        PubRestoranEntities db = new PubRestoranEntities();
        Mymodel vm = new Mymodel();
        // GET: LoginAdmine
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            
            return View(vm);
        }

        [HttpPost]
        public ActionResult Login(FormCollection frm)
        {
            Session["admin_email"] = frm["admin_email"];
            Session["admin_pass"] = frm["admin_pass"];

            if(Session["admin_email"].ToString() == "admin")
            {
                if (Session["admin_pass"].ToString() == "admin")
                {
                    return RedirectToAction("Index","Adminim");
                }
                else
                {
                    return View("Index");
                }
            }
            else
            {
                return View("Index");

            }

            
        }
    }
}