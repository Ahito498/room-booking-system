using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System.Data;

namespace Project.Pages.RoomServicesTeam
{
    public class QuotaModel : PageModel
    {
        private readonly DB db;
        public DataTable QuotaRequestsTable { get; set; } = new DataTable();

        [BindProperty]
        public string SelectedStatus { get; set; }

        [BindProperty]
        public int SelectedRequestId { get; set; }

        public QuotaModel(DB db)
        {
            this.db = db;
        }

        // OnGet loads all the quota requests
        public IActionResult OnGet()
        {
            // ✅ Login session check
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")) ||
                HttpContext.Session.GetString("UserType") != "RoomServicesMember")
            {
                return RedirectToPage("/Login");
            }

            QuotaRequestsTable = db.LoadQuotaRequests();
            return Page();
        }

        // OnPost handles the update of the quota request status
        public IActionResult OnPostUpdateStatus()
        {
            // ✅ Login session check
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")) ||
                HttpContext.Session.GetString("UserType") != "RoomServicesMember")
            {
                return RedirectToPage("/Login");
            }

            if (SelectedRequestId != 0 && !string.IsNullOrEmpty(SelectedStatus))
            {
                db.UpdateQuotaStatus(SelectedRequestId, SelectedStatus);
            }

            QuotaRequestsTable = db.LoadQuotaRequests();
            return RedirectToPage(); // Refresh page after update
        }
    }
}