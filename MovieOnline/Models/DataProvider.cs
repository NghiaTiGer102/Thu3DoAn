using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieOnline.Models
{
    public class DataProvider
    {
        private static DataProvider ins;
        public static DataProvider Ins
        {
            get
            {
                if (ins == null)
                {
                    ins = new DataProvider();
                }
                return ins;
            }
            set
            {
                ins = value;
            }
        }
        public MovieEntities1 DB { get; set; }
        public DataProvider()
        {
            DB = new MovieEntities1();
        }
    }
}