using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;
using PagedList;

namespace MovieOnline.Areas.admin.Controllers
{
    
    public class SeriesController : Controller
    {
        // GET: admin/Series
        DataProvider dataProvider = new DataProvider();
        public ActionResult Index(string search, int? page)
        {
            int pageSize = 4;

            int pageNumber = (page) ?? 1;

            List<SeriesViewModel> listseries = new List<SeriesViewModel>();
            List<DanhSachPhim> danhSachPhims = DataProvider.Ins.DB.DanhSachPhims.Where(n => n.LoaiPhim == 2).ToList();

            int STT = 1;

            foreach (var item in danhSachPhims)
            {
                SeriesViewModel series = new SeriesViewModel();
                series.TheLoai = item.TheLoai1;
                series.STT = STT++;
                series.DuongDanPhim = item.DuongDanPhim;
                series.NgayPhatHanh = item.NgayPhatHanh.Value.ToShortDateString();
                series.id = item.Id;
                series.TenPhim = item.TenPhim;
                listseries.Add(series);
            }

            ViewBag.listtl = dataProvider.DB.TheLoais.ToList();

            if (SearchViewModel.listSeries != null)
            {
                SetSeries(SearchViewModel.listSeries[0].Id.ToString());
                ViewBag.list = SearchViewModel.listSeries;
            }

            if (SearchViewModel.theloaiseries != null)
            {
                int id = int.Parse( SearchViewModel.theloaiseries);
                if (id != 0)
                {
                    listseries = listseries.Where(n => n.TheLoai.Id == id).ToList();
                }
            }

            if (SearchViewModel.searchseries != null)
            {
                listseries = listseries.Where(n => n.TenPhim.Contains(SearchViewModel.searchseries)).ToList();
            }

            return View(listseries.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult InsertSeries(FormCollection fc)
        {
            ChiTietPhimBo ct  = new ChiTietPhimBo();

            ct.SoTap = int.Parse(fc["SoTap"].ToString());
            ct.Id = int.Parse(fc["idphim"].ToString());
            ct.DuongDanPhim = fc["DuongDanPhim"].ToString();
            ct.NgayPhatHanh = DateTime.Now;
            ct.LuotXem = 0;
            dataProvider.DB.ChiTietPhimBoes.Add(ct);
            int check = dataProvider.DB.SaveChanges();

            return RedirectToAction("Index");
        }

        public void SetSeries(string val)
        {
            int id = int.Parse(val);

            List<ChiTietPhimBo> list = dataProvider.DB.ChiTietPhimBoes.Where(n => n.Id == id).ToList();

            SearchViewModel.listSeries = list;

        }

        public void SetTheLoai(string val)
        {


            SearchViewModel.theloaiseries = val;

        } 
        public void SetSearch(string val)
        {


            SearchViewModel.searchseries = val;

        }

        [HttpPost]
        public void Remove(ChangeSeriesViewModel data)
        {
            int id = int.Parse( data.id);
            int sotap = int.Parse(data.sotap);
            ChiTietPhimBo ct = dataProvider.DB.ChiTietPhimBoes.Where(n => n.Id == id && n.SoTap == sotap)
                .SingleOrDefault();
            dataProvider.DB.ChiTietPhimBoes.Remove(ct);
            int check = dataProvider.DB.SaveChanges();
            

        }

        [HttpPost]
        public void Update(ChangeSeriesViewModel data)
        {
            int id = int.Parse(data.id);
            int sotap = int.Parse(data.sotap);
            ChiTietPhimBo ct = dataProvider.DB.ChiTietPhimBoes.Where(n => n.Id == id && n.SoTap == sotap)
                .SingleOrDefault();
            ct.DuongDanPhim = data.duongdan;
            dataProvider.DB.ChiTietPhimBoes.AddOrUpdate(ct);
            int check = dataProvider.DB.SaveChanges();


        }
    }
}