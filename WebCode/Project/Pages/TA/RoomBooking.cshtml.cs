using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.TA
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
        [Display(Name = "Time Slot")]
        public string TimeSlot { get; set; }

        [BindProperty]
        [Display(Name = "Tutorial Course")]
        public string SelectedTutorial { get; set; }

        [BindProperty]
        [Range(1, 4)]
        [Display(Name = "Duration (hours)")]
        public int Duration { get; set; }

        public List<Tutorial> AvailableTutorials { get; set; }
        public int RemainingQuota { get; set; }

        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }

            LoadTutorialData(); // <-- init here
            return Page();
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                LoadTutorialData(); // <-- init again in OnPost
                return Page();
            }

            // TODO: Save booking to DB or perform action

            TempData["Success"] = "Room booked successfully!";
            return RedirectToPage(); // or redirect to another page
        }

        private void LoadTutorialData()
        {
            // Dummy data - replace with your actual data source
            AvailableTutorials = new List<Tutorial>
            {
                new Tutorial { CourseCode = "MATH101" },
                new Tutorial { CourseCode = "PHYS202" }
            };

            RemainingQuota = 3;
        }
    }
}