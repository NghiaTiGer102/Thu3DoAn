using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MovieOnline.Models;

namespace MovieOnline.Areas.admin.ViewModel
{
    public class MovieListViewModel
    {
        public int id  { get; set; }
        public int STT { get; set; }
        public int DanhGia { get; set; }
        public string TenPhim { get; set; }

        public bool HienThi { get; set; }

        public string TenHienThi { get; set; }
        public string DuongDanPhim { get; set; }

        public string LinkAnh { get; set; }
        public string NgayPhatHanh { get; set; }
        public string TomTatNoiDung { get; set; }
        public string Tag { get; set; }

      
        public TheLoai TheLoai { get; set; }
      


        public LoaiPhim LoaiPhim { get; set; }
       
        public string TenLoaiPhim { get; set; }


        public int idTheLoai { get; set; }
        public int idLoaiPhim { get; set; }
        public int idActive { get; set; }

    }
}