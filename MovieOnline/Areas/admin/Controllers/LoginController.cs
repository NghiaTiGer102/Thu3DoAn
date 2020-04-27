using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Areas.ViewModel;
using MovieOnline.Models;

namespace MovieOnline.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: admin/Login

        DataProvider dataProvider = new DataProvider();

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]

        public JsonResult Index(AdminLoginViewModel data)
        {
            TaiKhoan tk = new TaiKhoan();
            tk.UserName = data.username;
            tk.MatKhau = data.password;
            string message;
            TaiKhoan checkhave = dataProvider.DB.TaiKhoans.Where(n => n.UserName == tk.UserName && n.MatKhau == tk.MatKhau&&n.LoaiTaiKhoan==2).FirstOrDefault();
            if (checkhave == null)
            {

                message = "FAIL";
                return Json(new { Message = message });
            }

            Session["tkadmin"] = checkhave;



            message = "SUCCESS";
           
            return Json(new { Message = message ,result = "Redirect", url = Url.Action("Index", "AdminHome")});

        }

        public ActionResult Redire()
        {
            return RedirectToAction("Index");
        }


        public ActionResult logout()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }
    }
}