using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Professor
{
    public class ReportModel : PageModel
    {
        public DB db { get; set; }
        public ReportModel(DB db)
        {
            this.db = db;
        }
        [BindProperty]
        [Required]
        [Display(Name = "Room Code")]
        public string RoomCode { get; set; }

        [BindProperty]
        [Required]
        [Display(Name = "Issue Description")]
        [StringLength(500, MinimumLength = 20)]
        public string Description { get; set; }

        [BindProperty]
        [Required]
        [Display(Name = "Issue Category")]
        public ReportCategory Category { get; set; }

        [BindProperty]
        [Display(Name = "Urgency Level")]
        public UrgencyLevel Urgency { get; set; } = UrgencyLevel.Medium;
        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                return Page();
            }
        }
    }
    public enum ReportCategory
    {
        EquipmentFailure,
        SafetyHazard,
        MaintenanceRequired,
        CleaningNeeded,
        Other
    }

    public enum UrgencyLevel
    {
        Low,
        Medium,
        High,
        Critical
    }
}
