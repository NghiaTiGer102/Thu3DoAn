using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Models;

namespace MovieOnline.Controllers
{
    public class SingleController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        // GET: Single
        public ActionResult Index(int id)
        {
            DanhSachPhimLe phim = new DanhSachPhimLe();
            phim = dataProvider.DB.DanhSachPhimLes.Where(n => n.Id == id).SingleOrDefault();
            ViewBag.phim = phim;
            return View();
        }
    }
}