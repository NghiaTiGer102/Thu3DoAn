using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Models;

namespace MovieOnline.Areas.admin.ViewModel
{
    public class MovieInsertController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        // GET: admin/MovieInsert
        public ActionResult Index()
        {
            List<TheLoai> dsTheLoais = dataProvider.DB.TheLoais.ToList();
            
           
            return View(dsTheLoais);
        }

        // GET: admin/MovieInsert
        
        public ActionResult InsertMovie(FormCollection fc, HttpPostedFileBase file)
        {
            DanhSachPhim dsphim = new DanhSachPhim();

            dsphim.TenPhim = fc["TenPhim"].ToString();
            dsphim.NgayThem = DateTime.Now;
            
            if (!string.IsNullOrEmpty(fc["NgayPhatHanh"].ToString()))
            {
                dsphim.NgayPhatHanh = DateTime.Parse(fc["NgayPhatHanh"].ToString());
            }
           

            
            
            dsphim.TomTatNoiDung = fc["TomTatNoiDung"].ToString();

            dsphim.DuongDanPhim = fc["DuongDanPhim"].ToString();

            dsphim.LuotXem = 0;

            dsphim.DanhGia =  int.Parse(fc["DanhGia"].ToString());

            dsphim.TheLoai = int.Parse(fc["TheLoai"].ToString());

            if (!string.IsNullOrEmpty(fc["Tag"].ToString()))
            {
                dsphim.Tag = fc["Tag"].ToString();
            }

            

            dsphim.LoaiPhim = int.Parse(fc["LoaiPhim"].ToString());

           

            if (fc["HienThi"].ToString() == "0")
            {
                dsphim.HienThi = false;
            }
            else
            {
                dsphim.HienThi = true;
            }
           


            var allowedExtensions = new[] {
                ".Jpg", ".png", ".jpg", "jpeg"
            };
            var fileName = Path.GetFileName(file.FileName); //getting only file name(ex-ganesh.jpg)  
            var ext = Path.GetExtension(file.FileName); //getting the extension(ex-.jpg)  

            if (allowedExtensions.Contains(ext))
            {
                string name = Path.GetFileNameWithoutExtension(fileName); //getting file name without extension  
                string myfile = dsphim.TenPhim + DateTime.Now.Second.ToString() + ext; //appending the name with id  
                // store the file inside ~/project folder(Img)  

                dsphim.HinhAnh = myfile;

                var path = Path.Combine(Server.MapPath(@"\Content\images\"), myfile);


                dataProvider.DB.DanhSachPhims.Add(dsphim);
                int check = dataProvider.DB.SaveChanges();

                if (check > 0)
                {
                    file.SaveAs(path);
                    Session["movietc"] = "1";


                    if (dsphim.LoaiPhim == 2)
                    {
                        ChiTietPhimBo ctphim = new ChiTietPhimBo();
                        ctphim.DuongDanPhim = dsphim.DuongDanPhim;
                        ctphim.LuotXem = 0;
                        ctphim.NgayPhatHanh = dsphim.NgayPhatHanh;
                        DanhSachPhim  phim = dataProvider.DB.DanhSachPhims.ToList().LastOrDefault();
                        ctphim.Id = phim.Id;

                        ctphim.DanhSachPhim=phim;

                        ctphim.SoTap = 1;
                        dataProvider.DB.ChiTietPhimBoes.Add(ctphim);
                        check = dataProvider.DB.SaveChanges();

                        if (check > 0)
                        {

                            return RedirectToAction("Index", "MovieInsert");
                        }

                    }


                    return RedirectToAction("Index", "MovieInsert");
                }


            }
             


            return View();
        }
    }
}