using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Admin
{
    public class StatsModel : PageModel
    {
        public DB db { get; set; }
        public StatsModel(DB db)
        {
            this.db = db;
        }
        public int ProfessorsCount { get; private set; }
        public int TAsCount { get; private set; }
        public int StudentsCount { get; private set; }
        public int HandledBookingRequests { get; private set; }
        public int HandledReports { get; private set; }

        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                ProfessorsCount = 12;
                TAsCount = 24;
                StudentsCount = 180;
                HandledBookingRequests = 53;
                HandledReports = 17;
                return Page();
            }
        }
    }
}