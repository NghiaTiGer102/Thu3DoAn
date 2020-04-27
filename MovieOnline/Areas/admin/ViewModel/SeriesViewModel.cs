using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using MovieOnline.Models;

namespace MovieOnline.Areas.admin.ViewModel
{
    public class SeriesViewModel
    {
        public int id { get; set; }
        public int STT { get; set; }
        public string TenPhim { get; set; }

        public TheLoai TheLoai { get; set; }
        public string NgayPhatHanh { get; set; }
        public string DuongDanPhim { get; set; }
    }
}