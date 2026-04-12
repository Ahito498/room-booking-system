using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System.Data;

namespace Project.Pages.CleaningStaff
{
    public class Daily_CleaningModel : PageModel
    {
        public DB db { get; set; }

        public DataTable DailyStatuses { get; set; } = new DataTable();
        [BindProperty] public DateTime? SelectedDate { get; set; }

        [BindProperty] public string SelectedRoom { get; set; }

        [BindProperty] public string SelectedCondition { get; set; }

        public Daily_CleaningModel()
        {
            db = new DB();
        }

        public void OnGet()
        {
            DailyStatuses = db.LoadDailyCleaningStatuses();
        }

        public IActionResult OnPostUpdateStatus()
        {
            if (!string.IsNullOrEmpty(SelectedRoom) && !string.IsNullOrEmpty(SelectedCondition))
            {
                db.UpdateDailyCleaningStatus(SelectedRoom, SelectedCondition);
            }
            // Apply date filter if present
            DailyStatuses = db.LoadDailyCleaningStatuses(SelectedDate);
            return Page();
        }

        public IActionResult OnPostFilterByDate()
        {
            DailyStatuses = db.LoadDailyCleaningStatuses(SelectedDate);
            return Page();
        }




    }
}