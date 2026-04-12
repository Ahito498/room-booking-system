using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System;
using System.Data;

namespace Project.Pages.RoomServicesTeam
{
    public class DailyCleaningRequestsModel : PageModel
    {
        private readonly DB db;

        [BindProperty]
        public DateTime? SelectedDate { get; set; }

        public DataTable DailyCleaningTable { get; set; }

        public DailyCleaningRequestsModel(DB db)
        {
            this.db = db;
        }

        public IActionResult OnGet()
        {
            // Default: show today's date
            SelectedDate ??= DateTime.Today;
            DailyCleaningTable = db.LoadDailyCleaningForRoomServices(SelectedDate.Value);
            return Page();
        }

        public IActionResult OnPost()
        {
            if (SelectedDate == null)
                SelectedDate = DateTime.Today;

            DailyCleaningTable = db.LoadDailyCleaningForRoomServices(SelectedDate.Value);
            return Page();
        }
    }
}



//if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")) ||
               //  HttpContext.Session.GetString("UserType") != "RoomServicesMember")
             //{
              //   return RedirectToPage("/Login");
            // }