using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mehr.Web.Mvc;
using Microsoft.AspNetCore.Http;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;
using PagedList;

namespace MovieOnline.Areas.admin.Controllers
{
    public class bannerInsertController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        // GET: admin/bannerInsert
        public ActionResult Index(string search, int? page)
        {
            int pageSize = 4;

            int pageNumber = (page) ?? 1;

            ViewBag.search = search;
            List<DanhSachPhim> listbannerModels = dataProvider.DB.DanhSachPhims.ToList();
            List<MovieViewModel> listmovieModels  = new List<MovieViewModel>();
            int STT = 1;
            foreach (var item in listbannerModels)
            {
                 MovieViewModel model = new MovieViewModel();
                 model.id = item.Id;
                 model.Name = item.TenPhim;
                 model.STT = STT++;
                 listmovieModels.Add(model);
            }



            if (!string.IsNullOrEmpty(SearchViewModel.searchMovie))
            {
                listmovieModels = listmovieModels.Where(n => n.Name.Contains(SearchViewModel.searchMovie)).ToList();
                ViewBag.search = SearchViewModel.searchMovie;

            }


            return View(listmovieModels.ToPagedList(pageNumber, pageSize));

        }


        public void SetSearch(string val)
        {
            SearchViewModel.searchMovie = val;


        }

        [HttpGet]
        public void InsertBanner()
        {
       


        }
        [HttpParamAction]
        [HttpPost]
        public ActionResult InsertBanner(FormCollection fc, HttpPostedFileBase file)
        {
            Banner tbl = new Banner();
            var allowedExtensions = new[] {
                ".Jpg", ".png", ".jpg", "jpeg"
            };

            tbl.IdPhim = int.Parse(fc["idphim"].ToString());
            

            var fileName = Path.GetFileName(file.FileName); //getting only file name(ex-ganesh.jpg)  
            var ext = Path.GetExtension(file.FileName); //getting the extension(ex-.jpg)  

            tbl.HinhAnh = fc["namebanner"].ToString() + DateTime.Now.Second.ToString()+ ext;
            tbl.Status = int.Parse(fc["selTab"].ToString());
            if (allowedExtensions.Contains(ext)) //check what type of extension  
            {
                string name = Path.GetFileNameWithoutExtension(fileName); //getting file name without extension  
                string myfile = fc["namebanner"].ToString() + DateTime.Now.Second.ToString() + ext; //appending the name with id  
                // store the file inside ~/project folder(Img)  

                var path = Path.Combine(Server.MapPath(@"\Content\images\"), myfile);

                dataProvider.DB.Banners.Add(tbl);
                int check = dataProvider.DB.SaveChanges();

                if (check > 0)
                {
                    ViewBag.info = 1;
                    file.SaveAs(path);
                    // return Json(new { mess = MessViewModel.ThongBao(1, "Thành công") });
                    Session["bannertc"] = "1";
                    
                    return RedirectToAction("Index", "bannerInsert");

                }

             //   return Json(new { mess = MessViewModel.ThongBao(0, "Thất bại") });

               
            }
            // return Json(new { mess = MessViewModel.ThongBao(0, "Thất bại") });
            ViewBag.info = 0;
            return RedirectToAction("Index", "bannerInsert");

        }
    


    }
}