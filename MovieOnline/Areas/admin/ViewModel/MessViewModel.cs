using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieOnline.Areas.admin.ViewModel
{
    public   class MessViewModel
    {
        public int active { get; set; }
        public string Info { get; set; }

        public static MessViewModel ThongBao(int active,string info)
        {
            MessViewModel mess = new MessViewModel();
            mess.active = active;
            mess.Info = info;
            return mess;
        }
    }
}