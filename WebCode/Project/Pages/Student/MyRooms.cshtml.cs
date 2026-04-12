using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Student
{
    public class My_RoomsModel : PageModel
    {
        public DB db { get; set; }
        public My_RoomsModel(DB db)
        {
            this.db = db;
        }
        public List<CourseInfo> JTACourses { get; set; } = new();
        public List<CourseInfo> EnrolledCourses { get; set; } = new();
        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                JTACourses.Add(new CourseInfo
                {
                    CourseCode = "CS101",
                    CourseName = "Intro to Programming",
                    RoomNumber = "R101",
                    RoomLocation = "Building A",
                    TimeSlot = "Mon 10:00-12:00"
                });

                EnrolledCourses.Add(new CourseInfo
                {
                    CourseCode = "MATH202",
                    CourseName = "Calculus II",
                    RoomNumber = "R205",
                    RoomLocation = "Building B",
                    TimeSlot = "Wed 2:00-4:00"
                });
                return Page();
            }
        }
    }

    public class CourseInfo
    {
        public string CourseCode { get; set; }
        public string CourseName { get; set; }
        public string RoomNumber { get; set; }
        public string RoomLocation { get; set; }
        public string TimeSlot { get; set; }
    }
}
