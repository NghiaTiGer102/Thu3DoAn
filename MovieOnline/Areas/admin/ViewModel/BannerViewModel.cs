using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieOnline.Areas.admin.ViewModel
{
    public class BannerViewModel
    {
        public int STT;
        public int id { get; set; }
        public string HinhAnh { get; set; }

        public int status  { get; set; }

        public string TenPhim { get; set; }
        public int idPhim { get; set; }

       

    }
}