using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MovieOnline.Models;

namespace MovieOnline.Areas.admin.ViewModel
{
    public class SearchViewModel
    {
        public static string search { get; set; }

        public static string active { get; set; }

        //search Banner
        public static string searchBanner { get; set; }

        //search phim trong Banner
        public static string searchMovie { get; set; }

        //search phim trong movieLIST active
        public static string movielist { get; set; }

        //search phim trong theloai active
        public static string theloai { get; set; }

        //search phim trong activemovie active
        public static string activemovie { get; set; }

        //search phim trong searchmovie active
        public static string searchmovie { get; set; }

        //search phim trong listSeries listSeries
        public static List<ChiTietPhimBo> listSeries { get; set; }

        //search phim trong listSeries listSeries
        public static string theloaiseries { get; set; }

        //search phim trong searchseries listSeries
        public static string searchseries { get; set; }
    }
}