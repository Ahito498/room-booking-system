using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System.Data;

namespace Project.Pages.CleaningStaff
{
    public class Cleaning_RequestsModel : PageModel
    {
        private readonly DB db;

        public DataTable CleaningRequestsTable { get; set; }

        [BindProperty]
        public int SelectedRequestId { get; set; }

        [BindProperty]
        public string SelectedStatus { get; set; }

        public Cleaning_RequestsModel(DB db)
        {
            this.db = db;
        }

        public void OnGet()
        {
            
            CleaningRequestsTable = db.LoadCleaningRequestsForStaff();
            
        }

        public IActionResult OnPostUpdateRequestStatus()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")) ||
                HttpContext.Session.GetString("UserType") != "[SpecificUserType]")
            {
                return RedirectToPage("/Login");
            }

            if (SelectedRequestId != 0 && !string.IsNullOrEmpty(SelectedStatus))
            {
                db.UpdateCleaningRequestStatus(SelectedRequestId, SelectedStatus);
            }
            
            return RedirectToPage();
        }
    }
}