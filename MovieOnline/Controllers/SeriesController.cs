using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Models;

namespace MovieOnline.Controllers
{
    public class SeriesController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        // GET: Series
        public ActionResult Index(int id)
        {
            DanhSachPhim phim = new DanhSachPhim();
            phim = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 2 && n.Id == id && n.HienThi == true).SingleOrDefault();
            ViewBag.phim = phim;
            return View();
        }
    }
}