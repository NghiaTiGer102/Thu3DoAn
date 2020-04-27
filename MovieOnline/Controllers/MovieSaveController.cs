using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;
using PagedList;

namespace MovieOnline.Controllers
{
    public class MovieSaveController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        // GET: MovieSave
        public ActionResult Index(int? id, int? page)
        {
            int pageSize = 5;

            int pageNumber = (page) ?? 1;

            ViewBag.Maloai = id;

            if (Session["taikhoan"] == null)
            {
                return RedirectToAction("Index", "Home");
            }

            TaiKhoan tk = (TaiKhoan)Session["taikhoan"];

            List<TuPhim> listTuPhims = dataProvider.DB.TuPhims.Where(n => n.iduser == tk.Id).ToList();
            List<DanhSachPhim> listphim = new List<DanhSachPhim>();
            foreach (var item in listTuPhims)
            {
                DanhSachPhim phim = dataProvider.DB.DanhSachPhims.Where(n => n.Id == item.idphim&&n.HienThi==true).SingleOrDefault();
                listphim.Add(phim);

            }

            return View(listphim.ToPagedList(pageNumber, pageSize));
            
        }

        public void Remove(string val)
        {

            int id = int.Parse(val);

           

            TaiKhoan tk = (TaiKhoan)Session["taikhoan"];

            TuPhim tuPhim = dataProvider.DB.TuPhims.Where(n => n.idphim == id).SingleOrDefault();

            dataProvider.DB.TuPhims.Remove(tuPhim);
            int check = dataProvider.DB.SaveChanges();

        }
    }
}