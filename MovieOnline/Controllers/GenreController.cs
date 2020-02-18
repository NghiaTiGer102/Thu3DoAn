using MovieOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
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
                List<DanhSachPhim> listdaPhimLes = db.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1 && n.TheLoai == id).ToList();

                return View(listdaPhimLes.ToPagedList(pageNumber, pageSize));
            
           
        }


        [HttpGet]
        public ActionResult SearchMovie(string newsearch, int? page)
        {


           
            List<DanhSachPhim> listdaPhimLes = db.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1 && n.TenPhim.Contains(newsearch)).ToList();

            ViewBag.search = newsearch;
            int pageSize = 5;

            int pageNumber = (page) ?? 1;





            return View(listdaPhimLes.ToPagedList(pageNumber, pageSize));
        }
        [HttpPost]
        public ActionResult SearchMovie(FormCollection frm, int? page)
        {
            int pageNumber = (page) ?? 1;
            string search = frm["Search"].ToString();
            List<DanhSachPhim> listdaPhimLes = db.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1 && n.TenPhim.Contains(search)).ToList();

            ViewBag.search = search;
            int pageSize = 5;

             

             
            

            
            return View(listdaPhimLes.ToPagedList(pageNumber, pageSize));
        }


        public ActionResult Show()
        {
            List<DanhSachPhim> phim = db.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).OrderByDescending(n => n.LuotXem).Take(10).ToList();

            return PartialView(phim);
        }
    }
}