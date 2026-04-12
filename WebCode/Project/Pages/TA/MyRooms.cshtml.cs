using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.TA
{
    public class MyRoomsModel : PageModel
    {
        public DB db { get; set; }
        public MyRoomsModel(DB db)
        {
            this.db = db;
        }
        public List<Tutorial> TutorialRooms { get; set; }
        public List<RoomChangeRequest> PendingRequests { get; set; }
        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                TutorialRooms = new List<Tutorial>
                {
                    new Tutorial { CourseCode = "MATH101", TAId = "TA123", RoomNumber = "R101", TimeSlot = "8AM-10AM", Status = TutorialStatus.Approved },
                };

                PendingRequests = new List<RoomChangeRequest>
                {
                    new RoomChangeRequest { CourseCode = "PHYS201", Reason = "Projector issue", Status = "Pending" }
                };

                return Page();
            }
        }
        
    }
    
    public class RoomChangeRequest
    {
        public string CourseCode { get; set; }
        public string Reason { get; set; }
        public string Status { get; set; }
    }
}
