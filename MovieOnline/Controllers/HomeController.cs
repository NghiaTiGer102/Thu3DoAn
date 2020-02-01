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

       
    }
}