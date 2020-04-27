using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MovieOnline.Areas.admin.ViewModel;
using MovieOnline.Models;

namespace MovieOnline.Areas.admin.Controllers
{
    public class EmployeesController : Controller
    {
       

        DataProvider dataProvider  = new DataProvider();
        // GET: admin/Employees
        public ActionResult Index()
        {

            
            return View();
        }


        [HttpGet]
        public ActionResult InsertEmployee()
        { 

            
            return View();
        }


        // GET: admin/Employees
        [HttpPost]
        public ActionResult InsertEmployee(AccountViewModel data)
        {
            ;
            TaiKhoan tk = new TaiKhoan();
            tk.UserName = data.username;
            tk.MatKhau = data.password;
            tk.HoTen = data.name;
            tk.Email = data.email;
            tk.MatKhau = data.password;
            tk.LoaiTaiKhoan = 2;
            string message;
            TaiKhoan checkhave = dataProvider.DB.TaiKhoans.Where(n => n.UserName == tk.UserName || n.Email == tk.Email).FirstOrDefault();
            if (checkhave != null)
            {

                
                return Json(new { mess = MessViewModel.ThongBao(2,"Tài khoản trùng") });
            }

            dataProvider.DB.TaiKhoans.Add(tk);
            int check = dataProvider.DB.SaveChanges();

            if (check > 0)
            {
                return Json(new { mess = MessViewModel.ThongBao(1, "Thành công") });
            }
            return Json(new { mess = MessViewModel.ThongBao(0, "Thất  bại") });


        }




        [HttpPost]
        public ActionResult UpdateEmployee(AccountViewModel data)
        {
            TaiKhoan tk = dataProvider.DB.TaiKhoans.Where(n => n.Id == data.id).SingleOrDefault();

            

            if (tk == null)
            {
                return  Json(new {mess = MessViewModel.ThongBao(0, "Thất bại")});
            }


            TaiKhoan tkemail = dataProvider.DB.TaiKhoans.Where(n => n.Email == data.email&&n.Id!=data.id).SingleOrDefault();
            if (tkemail != null) 
            {
                return Json(new { mess = MessViewModel.ThongBao(2, "Email tồn tại") });
            }

            tk.HoTen = data.name;
            tk.Email = data.email;

            dataProvider.DB.TaiKhoans.AddOrUpdate(tk);

            int check = dataProvider.DB.SaveChanges();

            if (check > 0)
            {
                return Json(new { mess = MessViewModel.ThongBao(1, "Thất bại") });
            }
            return Json(new { mess = MessViewModel.ThongBao(0, "Thất bại") });

            
        }


        [HttpGet]
        public ActionResult ListEmpoyee()
        {


            List<TaiKhoan> listTaiKhoans = dataProvider.DB.TaiKhoans.Where(n => n.LoaiTaiKhoan == 2 && n.Status == 1).ToList();
            if (!string.IsNullOrEmpty(SearchViewModel.search))
            {
                listTaiKhoans = listTaiKhoans.Where(n => n.HoTen.Contains(SearchViewModel.search)).ToList();
            }

            
            return PartialView(listTaiKhoans);


        }


        public ActionResult SearchEmployee()
        {
            
            return View();


        }


        [HttpPost]
        public ActionResult ListEmpoyee(AccountViewModel data)
        {

           

            TaiKhoan tk = dataProvider.DB.TaiKhoans.Where(n => n.Id == data.id).SingleOrDefault();

            if (tk != null)
            {
                tk.Status = 0;
                int check = dataProvider.DB.SaveChanges();
                 
                 
            }

            if (!string.IsNullOrEmpty(data.search))
            {
                SearchViewModel.search = data.search;
            }
            else
            {
                if (tk == null)
                {
                    SearchViewModel.search = "";
                }
              
            }

            Session["tim"] = SearchViewModel.search;

            return Json(new { result = "Redirect", url = Url.Action("ListEmpoyee", "Employees")});


        }


    }
}