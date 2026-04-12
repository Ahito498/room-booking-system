using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using Project.Pages.TA;

namespace Project.Pages.Professor
{
    public class My_RoomsModel : PageModel
    {
        public DB db { get; set; }
        public My_RoomsModel(DB db)
        {
            this.db = db;
        }
        public List<Course> Courses { get; set; }
        public List<RoomChangeRequest> ChangeRequests { get; set; }
        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                Courses = new List<Course>
            {
                new Course { Id = 1, CourseCode = "CIE101", CourseName = "Intro to Infrastructure", RoomNumber = "B202", TimeSlot = "Sun 10:00–12:00" },
                new Course { Id = 2, CourseCode = "CIE102", CourseName = "Construction Materials", RoomNumber = "A103", TimeSlot = "Tue 14:00–16:00" }
            };

                ChangeRequests = new List<RoomChangeRequest>
            {
                new RoomChangeRequest { CourseCode = "CIE101", NewRoom = "B205", Reason = "Projector not working" }
            };
                return Page();
            }
        }
    }
    public class Course
    {
        public int Id { get; set; }
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string RoomNumber { get; set; }
        public string TimeSlot { get; set; }
    }

    public class RoomChangeRequest
    {
        public string CourseCode { get; set; }
        public string NewRoom { get; set; }
        public string Reason { get; set; }
    }
}
