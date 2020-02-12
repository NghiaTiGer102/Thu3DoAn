using MovieOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace MovieOnline.Controllers
{
    public class GenreController : Controller
    {
        DataProvider db = new DataProvider();
        // GET: Genre
        public ActionResult Index(int? id,int ? page)
        {

            int pageSize = 5;

            int pageNumber = (page) ?? 1;

            ViewBag.Maloai = id;
            List<DanhSachPhimLe> listdaPhimLes = db.DB.DanhSachPhimLes.Where(n => n.TheLoai == id).ToList();

            return View(listdaPhimLes.ToPagedList(pageNumber,pageSize));
        }
    }
}