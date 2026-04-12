using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Student
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
        [Display(Name = "Complaint Details")]
        [StringLength(500, MinimumLength = 10)]
        public string Complaint { get; set; }
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
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            TempData["SuccessMessage"] = "Your complaint has been submitted successfully!";
            return RedirectToPage("/Student/Report");
        }
    }
}
