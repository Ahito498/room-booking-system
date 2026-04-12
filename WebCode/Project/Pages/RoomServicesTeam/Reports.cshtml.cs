using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System.Data;

namespace Project.Pages.RoomServicesTeam
{
    public class ReportsModel : PageModel
    {
        public DB db { get; set; }
        
        [BindProperty]
        public int SelectedReport { get; set; }

        [BindProperty]
        public string SelectedCondition { get; set; }

        public DataTable ReportsTable { get; set; } = new DataTable();

        public ReportsModel(DB db)
        {
            this.db = db;
        }

        public IActionResult OnGet()
        {
            ReportsTable = db.LoadAllReports();
            return Page();
        }

        // Called when the Update button is pressed in the form
        public IActionResult OnPostUpdateReportStatus()
        {
            if (SelectedReport != 0 && !string.IsNullOrEmpty(SelectedCondition))
            {
                db.UpdateReportCondition(SelectedReport, SelectedCondition); // Update the report condition
            }

            // Reload updated report data
            ReportsTable = db.LoadAllReports();

            // Redirect to refresh the page and reflect the update
            return RedirectToPage();
        }


    }
}