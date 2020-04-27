using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieOnline.Areas.admin.ViewModel
{
    public class AccountViewModel
    {
        public int id { get; set; }
        public string name { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string repassword { get; set; }

        public string search { get; set; }

    }
}