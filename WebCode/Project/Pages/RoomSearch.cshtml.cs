using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Project.Models;
using System.Data;

namespace Project.Pages
{
    [BindProperties(SupportsGet = true)]
    public class RoomSearchModel : PageModel
    {
        public string SearchType { get; set; }
        public string CourseCode { get; set; }
        public string StaffOffice { get; set; }
        public string RoomType { get; set; }
        public string Building { get; set; }
        public string Floor { get; set; }
        public string Zone { get; set; }
        public DB db { get; set; }
        public RoomSearchModel(DB db)
        {
            this.db = db;
        }
        public DataTable DT { get; set; } = new DataTable();
        public bool HasSearched { get; set; }

        public void OnGet()
        {
            if (!string.IsNullOrEmpty(SearchType))
            {
                HasSearched = true;
                if (SearchType == "ByCourse")
                {
                    DT = db.RoomSearchUsage(CourseCode ?? "", StaffOffice ?? "", RoomType ?? "");
                    ;

                }
                else if (SearchType == "ByLocation")
                {
                    DT = db.RoomSearchLocation(Building ?? "", Floor ?? "", Zone ?? "");
                    ;

                }

            }


        }
    }
}