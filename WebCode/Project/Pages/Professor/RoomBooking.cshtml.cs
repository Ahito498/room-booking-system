using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Professor
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
        public DateTime SelectedTime { get; set; }

        public List<DateTime> TimeSlots { get; set; }
        public List<string> RecurringOptions { get; set; }
        public List<ApprovalRequest> PendingRequests { get; set; }
        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                TimeSlots = new List<DateTime>();  
                PendingRequests = new List<ApprovalRequest>();  
                return Page();
            }
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                PopulateTimeSlots();
                return Page();
            }


            TempData["BookingSuccess"] = "Room booked successfully!";
            return RedirectToPage(); // Redirect to avoid resubmission
        }
        public void PopulateTimeSlots()
        {
            // Replace with your actual logic for fetching time slots
            TimeSlots = new List<DateTime>
            {
            DateTime.Now.AddHours(1),
            DateTime.Now.AddHours(2),
            DateTime.Now.AddHours(3)
            };
        }
       
    }
    public class ApprovalRequest
    {
        public int Id { get; set; }
        public string CourseCode { get; set; }
        public string Reason { get; set; }
    }
}
