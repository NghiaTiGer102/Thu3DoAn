using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Models;
using MovieOnline.ViewModel;

namespace MovieOnline.Controllers
{
    public class HomeController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Menu()
        {
            
            List<TheLoai> listTheLoai =   dataProvider.DB.TheLoais.ToList();
            return PartialView(listTheLoai);
        }

        public ActionResult Banner()
        {
            //'["/Content/images/2.jpg", "/Content/images/1.jpg", "/Content/images/3.jpg","/Content/images/4.jpg"]'
            List<Banner> listbanner = dataProvider.DB.Banners.ToList();
            string data = "[\"/Content/images/2.jpg\",\"/Content/images/2.jpg\"]";

            string dau = "[";
            string cuoi = "]";
            bannerStrore.ListbanBanners = listbanner;
            string dataitem = "";
            for (int i = 0; i < listbanner.Count; i++)
            {
                
                if (i == listbanner.Count - 1)
                {
                    dataitem += "\"/Content/images/" + listbanner[i].HinhAnh + "\"";
                }
                else
                {
                    dataitem += "\"/Content/images/" + listbanner[i].HinhAnh + "\",";
                }
            }

            ViewBag.data = dau + dataitem + cuoi;


            //ViewBag.data = data;
          //  TrailerView(listbanner)

            return PartialView(listbanner);
        }

        //public ActionResult TrailerView(List<Banner> listbanner)
        //{

        //    List<DanhSachPhim> listDanhSachPhimLe = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).Take(8).ToList();

        //    return n();
        //}


        public ActionResult Recent()
        {

            List<DanhSachPhim> listDanhSachPhimLe = dataProvider.DB.DanhSachPhims.Where(n=>n.LoaiPhim==1).Take(8).ToList();

            return PartialView(listDanhSachPhimLe);
        }

        public ActionResult Popularity()
        {

            List<DanhSachPhim> listXemNhieuNhat = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).OrderByDescending(n => n.LuotXem).Take(8).ToList();

            return PartialView(listXemNhieuNhat);
        }

        public ActionResult TopRating()
        {

            List<DanhSachPhim> listDanhGiaCaoNhat = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).OrderByDescending(n => n.DanhGia).Take(8).ToList();

            return PartialView(listDanhGiaCaoNhat);
        }


        public ActionResult lastMovie()
        {

            List<DanhSachPhim> ListdanhSachPhimLes  = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).OrderByDescending(n=>n.NgayPhatHanh).Take(10).ToList();
            return PartialView(ListdanhSachPhimLes);
        }


        public ActionResult RequestedMovie()
        {

            List<DanhSachPhim> ListdanhSachPhimLes = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).OrderByDescending(n => n.NgayPhatHanh).Take(20).ToList();
            return PartialView(ListdanhSachPhimLes);
        }

        public ActionResult TopMovie()
        {

            List<DanhSachPhim> ListdanhSachPhimLes = dataProvider.DB.DanhSachPhims.Where(n => n.LoaiPhim == 1).OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView(ListdanhSachPhimLes);
        }



        public ActionResult Register(FormCollection fm)
        {

            
            return PartialView();
        }


        public ActionResult logout(FormCollection fm)
        {
            Session["taikhoan"] = null;

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Login()
        {


            return RedirectToAction("Index");
        }

        [HttpPost]
        public JsonResult Login(ResgisterViewModel data)
        {
            TaiKhoan tk = new TaiKhoan();
            tk.UserName = data.usernamere;
            tk.MatKhau = data.passwordre;
            string message;
            TaiKhoan checkhave = dataProvider.DB.TaiKhoans.Where(n => n.UserName == tk.UserName&&n.MatKhau==tk.MatKhau).FirstOrDefault();
            if (checkhave == null)
            {
               
                message = "FAIL";
                return Json(new { Message = message });
            }

            Session["taikhoan"] = checkhave;



            message = "SUCCESS";
            return Json(new { Message = message });
        }


        [HttpGet]
        public ActionResult FormRegister()
        {


            return PartialView();
        }

        [HttpPost]
        public ActionResult FormRegister(ResgisterViewModel data)
        {
            try
            {
                ViewBag.notify = false;
                TaiKhoan tk = new TaiKhoan();
                tk.UserName = data.usernamere;
                tk.Email = data.emailre;
                tk.HoTen = data.fullnamere;
                tk.LoaiTaiKhoan = 1;
                tk.MatKhau = data.passwordre;
                string message = "FAIL";
                TaiKhoan checkhave = dataProvider.DB.TaiKhoans.Where(n => n.UserName == tk.UserName).FirstOrDefault();
                if (checkhave != null)
                {
                    ViewBag.notify = true;
                    message = "FAIL";
                    return Json(new { Message = message });
                }

                dataProvider.DB.TaiKhoans.Add(tk);
                int checkResgister = dataProvider.DB.SaveChanges();

                if (checkResgister > 0)
                {

                    message = "SUCCESS";
                }

                Session["taikhoan"] = tk;

              
                return Json(new { Message = message });
            }
            catch (Exception e)
            {
                string message = "FAIL";
               
                return Json(new { Message = message });
            }
           
        }


    }
}