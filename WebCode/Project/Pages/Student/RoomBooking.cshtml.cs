using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Student
{
    public class Room_BookingModel : PageModel
    {
        public DB db { get; set; }
        public Room_BookingModel(DB db)
        {
            this.db = db;
        }
        [BindProperty]
        [Required]
        [Display(Name = "Room Code")]
        public string RoomCode { get; set; }

        [BindProperty]
        [Required]
        public string Reason { get; set; }

        [BindProperty]
        [Required]
        [Display(Name = "Time Slot")]
        public string TimeSlot { get; set; }

        [BindProperty]
        [Display(Name = "For a Clinic?")]
        public bool IsClinic { get; set; }

        [BindProperty]
        [Required]
        [Display(Name = "Course")]
        public string SelectedCourse { get; set; }
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

            TempData["SuccessMessage"] = "Room booking request submitted successfully!";
            return RedirectToPage("/Student/Room_Booking");
        }
    }
}
