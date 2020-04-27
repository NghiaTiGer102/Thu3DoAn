using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;
using PagedList;

namespace MovieOnline.Areas.admin.Controllers
{
    public class MovieListController : Controller
    {
        DataProvider dataProvider = new DataProvider();
        // GET: admin/MovieList
        public ActionResult Index(string search, int? page)
        {
            int pageSize = 8;

            int pageNumber = (page) ?? 1;

            List<MovieListViewModel> listmovie = new List<MovieListViewModel>();

            ViewBag.loaiphim = dataProvider.DB.LoaiPhims.ToList();

            ViewBag.theloai = dataProvider.DB.TheLoais.ToList();


            List<DanhSachPhim> listdaDanhSachPhims = dataProvider.DB.DanhSachPhims.ToList();
            int STT = 1;
            foreach (var item in listdaDanhSachPhims)
            {
                MovieListViewModel movie = new MovieListViewModel();

                LoaiPhim loaiPhim = dataProvider.DB.LoaiPhims.Where(n => n.Id == item.LoaiPhim.Value).SingleOrDefault();

                TheLoai theLoai = dataProvider.DB.TheLoais.Where(n => n.Id == item.TheLoai.Value).SingleOrDefault();

                movie.STT = STT++;
                movie.id = item.Id;
                movie.TenPhim = item.TenPhim;
                movie.DuongDanPhim = item.DuongDanPhim;

                if (!string.IsNullOrEmpty(item.Tag))
                {
                    movie.Tag = item.Tag;
                }
                if (!string.IsNullOrEmpty(item.NgayPhatHanh.Value.ToString()))
                {
                    movie.NgayPhatHanh = item.NgayPhatHanh.Value.ToString("dd/MM/yyyy");
                }

                if (!string.IsNullOrEmpty(item.TomTatNoiDung))
                {
                    movie.TomTatNoiDung = item.TomTatNoiDung;
                }

                movie.HienThi = item.HienThi.Value;

                if (movie.HienThi == true)
                {
                    movie.TenHienThi = "Hoạt động";
                }
                else
                {
                    movie.TenHienThi = "Chưa hoạt động";
                }

                movie.LinkAnh = item.HinhAnh;
                movie.TheLoai = theLoai;
                movie.LoaiPhim = loaiPhim;

                listmovie.Add(movie);

            }

            if (!string.IsNullOrEmpty(SearchViewModel.movielist))
            {
                int idloai = int.Parse(SearchViewModel.movielist);

                if (idloai != 0)
                {
                    listmovie = listmovie.Where(n => n.LoaiPhim.Id == idloai).ToList();
                }


            }

            if (!string.IsNullOrEmpty(SearchViewModel.theloai))
            {
                int idloai = int.Parse(SearchViewModel.theloai);

                if (idloai != 0)
                {
                    listmovie = listmovie.Where(n => n.TheLoai.Id == idloai).ToList();
                }


            }

            if (!string.IsNullOrEmpty(SearchViewModel.activemovie))
            {
                int idloai = int.Parse(SearchViewModel.activemovie);

                if (idloai != 0)
                {
                    if (idloai == 1)
                    {
                        listmovie = listmovie.Where(n => n.HienThi == true).ToList();
                    }
                    else
                    {
                        listmovie = listmovie.Where(n => n.HienThi == false).ToList();
                    }
                }


            }

            if (!string.IsNullOrEmpty(SearchViewModel.searchmovie))
            {
                string searchs = SearchViewModel.searchmovie;

                listmovie = listmovie.Where(n => n.TenPhim.Contains(searchs)).ToList();


            }


            return View(listmovie.ToPagedList(pageNumber, pageSize));
        }

        public void SetLoaiPhim(string val)
        {
            SearchViewModel.movielist = val;

        }

        public void SetTheLoai(string val)
        {
            SearchViewModel.theloai = val;

        }

        public void SetActive(string val)
        {
            SearchViewModel.activemovie = val;

        }


        public void SetSearch(string val)
        {
            SearchViewModel.searchmovie = val;

        }

        public void Remove(string val)
        {
            int id = int.Parse(val);
            DanhSachPhim phim = dataProvider.DB.DanhSachPhims.Where(n => n.Id == id).SingleOrDefault();

            if (phim.LoaiPhim == 2)
            {
                List<ChiTietPhimBo> listct = dataProvider.DB.ChiTietPhimBoes.Where(n => n.Id == phim.Id).ToList();
                if (listct != null)
                {
                    
                        dataProvider.DB.ChiTietPhimBoes.RemoveRange(listct);
                        dataProvider.DB.SaveChanges();

                }
                dataProvider.DB.DanhSachPhims.Remove(phim);
                dataProvider.DB.SaveChanges();
            }
            else
            {
                dataProvider.DB.DanhSachPhims.Remove(phim);
                dataProvider.DB.SaveChanges();
            }

            
        }


        [HttpPost]
        public JsonResult FindMovie(FindMovie data)
        {
            int idd = int.Parse(data.id);

            DanhSachPhim dsPhim = dataProvider.DB.DanhSachPhims.Where(n => n.Id == idd).SingleOrDefault();

            MovieListViewModel movie = new MovieListViewModel();
            movie.id = dsPhim.Id;
            movie.TenPhim = dsPhim.TenPhim;
            movie.TomTatNoiDung = dsPhim.TomTatNoiDung;
            movie.idTheLoai = dsPhim.TheLoai1.Id;
            movie.idLoaiPhim = dsPhim.LoaiPhim.Value;

            if (!string.IsNullOrEmpty(dsPhim.HienThi.ToString()))
            {
                if (dsPhim.HienThi == true)
                {
                    movie.idActive = 1;
                }
                else
                {
                    movie.idActive = 0;
                }
            }
            else
            {
                movie.idActive = 0;
            }

            string today = dsPhim.NgayPhatHanh.Value.ToString("yyyy-MM-dd");
            movie.NgayPhatHanh = today;


            if (!string.IsNullOrEmpty(dsPhim.Tag))
            {
                movie.Tag = dsPhim.Tag;
            }
            else
            {
                movie.Tag = "";
            }

            movie.DanhGia = int.Parse(dsPhim.DanhGia.Value.ToString());

            movie.LinkAnh = dsPhim.HinhAnh;
            movie.DuongDanPhim = dsPhim.DuongDanPhim;

            // movie.LoaiPhim = dsPhim.LoaiPhim1;
            // movie.TheLoai = dsPhim.TheLoai1;


            return Json(new { phim = movie });


        }


        public ActionResult UpdateMovie(FormCollection fc, HttpPostedFileBase file)
        {
            int id = int.Parse(fc["idTenPhim"].ToString());
            DanhSachPhim dsphim = dataProvider.DB.DanhSachPhims.Where(n => n.Id == id).SingleOrDefault();

            dsphim.TenPhim = fc["TenPhim"].ToString();


            if (!string.IsNullOrEmpty(fc["NgayPhatHanh"].ToString()))
            {
                dsphim.NgayPhatHanh = DateTime.Parse(fc["NgayPhatHanh"].ToString());
            }




            dsphim.TomTatNoiDung = fc["TomTatNoiDung"].ToString();

            dsphim.DuongDanPhim = fc["DuongDanPhim"].ToString();

            dsphim.LuotXem = 0;

            dsphim.DanhGia = int.Parse(fc["DanhGia"].ToString());

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

            if (file == null)
            {
                dataProvider.DB.DanhSachPhims.AddOrUpdate(dsphim);
                int check = dataProvider.DB.SaveChanges();

                if (check > 0)
                {

                    Session["movietclist"] = "1";


                    if (dsphim.LoaiPhim == 2)
                    {
                        ChiTietPhimBo ctphim = new ChiTietPhimBo();
                        ctphim.DuongDanPhim = dsphim.DuongDanPhim;
                        ctphim.LuotXem = 0;
                        ctphim.NgayPhatHanh = dsphim.NgayPhatHanh;
                        DanhSachPhim phim = dataProvider.DB.DanhSachPhims.ToList().LastOrDefault();
                        ctphim.Id = phim.Id;

                        ctphim.DanhSachPhim = phim;

                        ctphim.SoTap = 1;
                        dataProvider.DB.ChiTietPhimBoes.AddOrUpdate(ctphim);
                        check = dataProvider.DB.SaveChanges();

                        if (check > 0)
                        {

                            return RedirectToAction("Index", "MovieList");
                        }

                    }


                    return RedirectToAction("Index", "MovieList");
                }
                return RedirectToAction("Index", "MovieList");
            }

            var fileName = Path.GetFileName(file.FileName); //getting only file name(ex-ganesh.jpg)  
            var ext = Path.GetExtension(file.FileName); //getting the extension(ex-.jpg)  

            if (allowedExtensions.Contains(ext))
            {
                string name = Path.GetFileNameWithoutExtension(fileName); //getting file name without extension  
                string myfile = dsphim.TenPhim + DateTime.Now.Second.ToString() + ext; //appending the name with id  
                // store the file inside ~/project folder(Img)  

                dsphim.HinhAnh = myfile;

                var path = Path.Combine(Server.MapPath(@"\Content\images\"), myfile);


                dataProvider.DB.DanhSachPhims.AddOrUpdate(dsphim);
                int check = dataProvider.DB.SaveChanges();

                if (check > 0)
                {
                    file.SaveAs(path);
                    Session["movietclist"] = "1";


                    if (dsphim.LoaiPhim == 2)
                    {
                        ChiTietPhimBo ctphim = new ChiTietPhimBo();
                        ctphim.DuongDanPhim = dsphim.DuongDanPhim;
                        ctphim.LuotXem = 0;
                        ctphim.NgayPhatHanh = dsphim.NgayPhatHanh;
                        DanhSachPhim phim = dataProvider.DB.DanhSachPhims.ToList().LastOrDefault();
                        ctphim.Id = phim.Id;

                        ctphim.DanhSachPhim = phim;

                        ctphim.SoTap = 1;
                        dataProvider.DB.ChiTietPhimBoes.AddOrUpdate(ctphim);
                        check = dataProvider.DB.SaveChanges();

                        if (check > 0)
                        {

                            return RedirectToAction("Index", "MovieList");
                        }

                    }


                    return RedirectToAction("Index", "MovieList");
                }


            }



            return RedirectToAction("Index", "MovieList");

        }
    }
}