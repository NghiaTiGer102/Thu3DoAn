using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;
using PagedList;

namespace MovieOnline.Areas.admin.Controllers
{
    public class BannerController : Controller
    {
       
        DataProvider dataProvider = new DataProvider();
        // GET: admin/Banner
        public ActionResult Index(string search, int? page)
        {
            int pageSize = 4;

            int pageNumber = (page) ?? 1;

            ViewBag.search = search;
            List<BannerViewModel> listbannerModels = new List<BannerViewModel>();
            List<Banner> listtbBanners = dataProvider.DB.Banners.ToList();
            listbannerModels.Clear();

            int STT = 1;
            foreach (var item in listtbBanners)
            {
                BannerViewModel bvm = new BannerViewModel();
                bvm.STT = STT;
                bvm.HinhAnh = item.HinhAnh;
                bvm.id = item.Id;
                bvm.idPhim = item.IdPhim.Value;
                bvm.TenPhim = dataProvider.DB.DanhSachPhims.Where(n => n.Id == item.IdPhim.Value).SingleOrDefault()
                    .TenPhim;
                bvm.status = item.Status.Value;
                listbannerModels.Add(bvm);
                STT++;
            }


            if (!string.IsNullOrEmpty(SearchViewModel.active))
            {
                
                int active = int.Parse(SearchViewModel.active);
                

               

                if (active != 2)
                {
                    listbannerModels = listbannerModels.Where(n => n.status == active).ToList();
                    ViewBag.active = SearchViewModel.active;
                }
              
            }

            if (!string.IsNullOrEmpty(SearchViewModel.searchBanner))
            {
                listbannerModels = listbannerModels.Where(n => n.TenPhim.Contains(SearchViewModel.searchBanner)).ToList();
                ViewBag.search = SearchViewModel.searchBanner;
            }
            
           


            return View(listbannerModels.ToPagedList(pageNumber, pageSize));
           
        }


        public void SetActive(string val)
        {
            SearchViewModel.active =  val;


        }



        public void SetSearch(string val)
        {
            SearchViewModel.searchBanner = val;


        }


        public ActionResult Remove(string val)
        {
            int id = int.Parse(val);
            Banner banner = dataProvider.DB.Banners.Where(n => n.Id == id).SingleOrDefault();

            dataProvider.DB.Banners.Remove(banner);

            int check = dataProvider.DB.SaveChanges();

            if (check > 0)
            {
                return Json(new {mess = MessViewModel.ThongBao(1, "Thành công")});
            }
            
            return   Json(new { mess = MessViewModel.ThongBao(0, "Thất bại") });


        }

        public ActionResult ActiveStaus(string val)
        {
            int id = int.Parse(val);
            Banner banner = dataProvider.DB.Banners.Where(n => n.Id == id).SingleOrDefault();

            if (banner.Status==0||banner.Status==null)
            { 
                banner.Status = 1;
            }
            else
            {
                banner.Status = 0;
            }
            dataProvider.DB.Banners.AddOrUpdate(banner);
            int check = dataProvider.DB.SaveChanges();

            if (check > 0)
            {
                return Json(new { mess = MessViewModel.ThongBao(1, "Thành công") });
            }

            return Json(new { mess = MessViewModel.ThongBao(0, "Thất bại") });


        }


    }
}