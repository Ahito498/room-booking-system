using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System.Data;

namespace Project.Pages.RoomServicesTeam
{
    public class RoomConditionModel : PageModel
    {
        private readonly DB db;

        public DataTable RoomConditionTable { get; set; }
        public List<string> RoomList { get; set; }

        [BindProperty]
        public string SelectedRoomId { get; set; }

        public RoomConditionModel(DB db)
        {
            this.db = db;
        }

        public IActionResult OnGet()
        {
            RoomList = db.GetAvailableRoomIDs();
            RoomConditionTable = db.LoadRoomAvailabilityStatuses();
            return Page();
        }

        public IActionResult OnPostToggleCondition()
        {
            if (!string.IsNullOrEmpty(SelectedRoomId))
            {
                db.ToggleRoomAvailability(SelectedRoomId);
            }

            return RedirectToPage();
        }
    }
}