using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Facebook;
using MovieOnline.Models;
using MovieOnline.ViewModel;

namespace MovieOnline.Controllers
{
    public class HomeController : Controller
    {
        DataProvider dataProvider = new DataProvider();

        private Uri RedirectUri
        {
            get
            {
                var uriBuider = new UriBuilder(Request.Url);
                uriBuider.Query = null;
                uriBuider.Fragment = null;
                uriBuider.Path = Url.Action("FacebookCallback");
                return uriBuider.Uri;
            }
        }
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
            List<Banner> listbannertemp = dataProvider.DB.Banners.Where(n=>n.Status==1).OrderByDescending(n=>n.Id).Take(5).ToList();
            List<Banner> listbanner= new List<Banner>();
            foreach (var item in listbannertemp)
            {
                DanhSachPhim phim = dataProvider.DB.DanhSachPhims.Where(n => n.Id == item.IdPhim).SingleOrDefault();
                if (phim != null)
                {
                    if (phim.HienThi==true)
                    {
                        listbanner.Add(item);
                    }
                }
            }


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

            List<DanhSachPhim> listDanhSachPhimLe = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.NgayThem).Take(8).Where(n=>n.HienThi == true).ToList();

            return PartialView(listDanhSachPhimLe);
        }

        public ActionResult Popularity()
        {

            List<DanhSachPhim> listXemNhieuNhat = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.LuotXem).Where(n => n.HienThi == true).Take(8).ToList();

            return PartialView(listXemNhieuNhat);
        }

        public ActionResult TopRating()
        {

            List<DanhSachPhim> listDanhGiaCaoNhat = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.DanhGia).OrderByDescending(n => n.NgayThem).Where(n => n.HienThi == true).Take(8).ToList();
            DanhSachPhim phim = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.DanhGia).ToList().LastOrDefault();
            ViewBag.phim = phim;
            return PartialView(listDanhGiaCaoNhat);
        }


        public ActionResult lastMovie()
        {

            List<DanhSachPhim> ListdanhSachPhimLes  = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.NgayThem.Value).Where(n => n.HienThi == true).Take(10).ToList();
            return PartialView(ListdanhSachPhimLes);
        }


        public ActionResult RequestedMovie()
        {

            List<DanhSachPhim> ListdanhSachPhimLes = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.NgayPhatHanh).Where(n => n.HienThi == true).Take(20).ToList();
            return PartialView(ListdanhSachPhimLes);
        }

        public ActionResult TopMovie()
        {

            List<DanhSachPhim> ListdanhSachPhimLes = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.LuotXem).Where(n => n.HienThi == true).Take(8).ToList();
            DanhSachPhim phim = dataProvider.DB.DanhSachPhims.OrderByDescending(n => n.LuotXem).Where(n => n.HienThi == true).Take(8).ToList().LastOrDefault();
            ViewBag.phim = phim;
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

        public ActionResult loginFaceBook()
        {
            var fb = new FacebookClient();
            var loginUri = fb.GetLoginUrl(new
            {
                client_id = "595577274375300",
                client_secret = "ebe5f0857ddd3efebfb879f92d1c3a53",
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email"
            });

            return Redirect(loginUri.AbsoluteUri);

        }

        public ActionResult FacebookCallback(string code)
        {
            var  fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = "595577274375300",
                client_secret = "ebe5f0857ddd3efebfb879f92d1c3a53",
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code

            });
            string message = "FAIL";
            var access_token = result.access_token;

            if (!string.IsNullOrEmpty(access_token))
            {
                fb.AccessToken = access_token;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                try
                {
                    ViewBag.notify = false;
                    TaiKhoan tk = new TaiKhoan();
                    tk.UserName = me.id;
                    tk.Email = me.email;
                    tk.HoTen = me.last_name + " " + me.middle_name + " " + me.first_name;
                    tk.LoaiTaiKhoan = 1;
                    tk.MatKhau = me.id;
                
                    TaiKhoan checkhave = dataProvider.DB.TaiKhoans.Where(n => n.UserName == tk.UserName).FirstOrDefault();

                    if (checkhave != null)
                    {
                        Session["taikhoan"] = checkhave;
                        ViewBag.notify = true;
                        message = "SUCCESS";
                        return RedirectToAction("Index");
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
                     message = "FAIL";

                     return RedirectToAction("Index");
                }
            }
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