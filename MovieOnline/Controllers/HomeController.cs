using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Models;

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


            return PartialView(listbanner);
        }


        public ActionResult Recent()
        {

            List<DanhSachPhimLe> listDanhSachPhimLe = dataProvider.DB.DanhSachPhimLes.Take(8).ToList();

            return PartialView(listDanhSachPhimLe);
        }


        public ActionResult lastMovie()
        {

            List<DanhSachPhimLe> ListdanhSachPhimLes  = dataProvider.DB.DanhSachPhimLes.OrderByDescending(n=>n.NgayPhatHanh).Take(10).ToList();
            return PartialView(ListdanhSachPhimLes);
        }


        public ActionResult RequestedMovie()
        {

            List<DanhSachPhimLe> ListdanhSachPhimLes = dataProvider.DB.DanhSachPhimLes.OrderByDescending(n => n.NgayPhatHanh).Take(20).ToList();
            return PartialView(ListdanhSachPhimLes);
        }

        public ActionResult TopMovie()
        {

            List<DanhSachPhimLe> ListdanhSachPhimLes = dataProvider.DB.DanhSachPhimLes.OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView(ListdanhSachPhimLes);
        }


    }
}