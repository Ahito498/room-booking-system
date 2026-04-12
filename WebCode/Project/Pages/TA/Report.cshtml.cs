using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.TA
{
    
    public class ReportModel : PageModel
    {
        public DB db { get; set; }
        public ReportModel(DB db)
        {
            this.db = db;
        }

        [Required]
        [Display(Name = "Room Code")]
        public string RoomCode { get; set; }

        [Required]
        [StringLength(500)]
        [Display(Name = "Issue Description")]
        public string Description { get; set; }

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
    
}
