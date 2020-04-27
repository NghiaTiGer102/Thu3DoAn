using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;
using MovieOnline.ViewModel;
using PagedList;
using BannerViewModel = MovieOnline.ViewModel.BannerViewModel;

namespace MovieOnline.Controllers
{
    public class SingleController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        public  static List<Banner> banners = new List<Banner>();
        // GET: Single
        public ActionResult Index(int? id,int? page,int? idphim,int? tapphim)
        {
            if (id == null&& idphim==null)
            {
                RedirectToAction("Index", "Home");
            }
         
            
            DanhSachPhim phim = new DanhSachPhim();
            phim = dataProvider.DB.DanhSachPhims.Where(n=>n.Id==id).SingleOrDefault();

            ViewBag.TenPhim = phim.TenPhim;
            ViewBag.TomTatNoiDung = phim.TomTatNoiDung;
            ViewBag.DuongDanPhim = phim.DuongDanPhim;
            if (phim.LoaiPhim == 2)
            {
                int pageSize = 1;

                int pageNumber = (page) ?? 1;

                int? idphimmoi = 1;
                if (id != null)
                {
                    
                    idphimmoi = id;
                }
                else
                {
                    idphimmoi = idphim;
                }
                ViewBag.idphim = idphimmoi;

                List<ChiTietPhimBo> danhsachtap = dataProvider.DB.ChiTietPhimBoes.Where(n => n.Id == idphimmoi).ToList();
                if (page != null)
                {
                    ChiTietPhimBo ct = dataProvider.DB.ChiTietPhimBoes.Where(n => n.Id == phim.Id && n.SoTap == page).SingleOrDefault();
                    phim.DuongDanPhim = ct.DuongDanPhim;
                }
                
                ViewBag.phim = phim;
                ViewBag.id = phim;
                return View(danhsachtap.ToPagedList(pageNumber, pageSize));

            }
            ViewBag.phim = phim;
            ViewBag.id = phim;
            return View();


        }


        [HttpPost]
        public JsonResult Index(BannerViewModel data)
        {
            DanhSachPhim phim = new DanhSachPhim();
            string[] Splitstring = data.idname.Split('-');

            int idx = int.Parse(Splitstring[Splitstring.Length - 1].Split(' ')[0]);


            int idphim = bannerStrore.ListbanBanners[idx].IdPhim.Value;

            
            ViewBag.phim = phim;
            return Json(new { result = "Redirect", url = Url.Action("Index", "Single", new { id = idphim }) });
        }
        public ActionResult LastTrailer()
        {
            List<DanhSachPhim> trailer = new List<DanhSachPhim>();
            trailer = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).Take(3).ToList();

            DanhSachPhim movie = new DanhSachPhim();
            movie = dataProvider.DB.DanhSachPhims.Where(n=>n.HienThi==true).OrderByDescending(n => n.NgayPhatHanh).Take(1).SingleOrDefault();

            TheLoai theLoai = dataProvider.DB.TheLoais.Where(n => n.Id == movie.TheLoai).SingleOrDefault();

            ViewBag.theloai = theLoai;
            ViewBag.phim = movie;
            return PartialView(trailer);
            
        }

        [HttpPost]
        public ActionResult SaveMovie(SaveMovie data)
        {
            if (Session["taikhoan"] == null)
            {
                return Json(new {mess = MessViewModel.ThongBao(2, "Thất bại")});
            }

            TaiKhoan tk = (TaiKhoan) Session["taikhoan"];

            TuPhim tuPhim = new TuPhim();
            tuPhim.idphim = data.idphim;
            tuPhim.iduser = tk.Id;

            TuPhim tuPhimhave = dataProvider.DB.TuPhims.Where(n => n.idphim == data.idphim && n.iduser == tk.Id)
                .SingleOrDefault();

            if (tuPhimhave != null)
            {
                return Json(new { mess = MessViewModel.ThongBao(3, "Thất bại") });
            }

            dataProvider.DB.TuPhims.Add(tuPhim);
            int check = dataProvider.DB.SaveChanges();

            if (check > 0)
            {
                return Json(new { mess = MessViewModel.ThongBao(1, "Thất bại") });
            }



            return Json(new { mess = MessViewModel.ThongBao(0, "Thất bại") });

        }

    }
}