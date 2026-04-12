using System.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Registrar
{
    public class AddCourseModel : PageModel
    {
        public string TA_IDs_CSV { get; set; }
        public string JTA_IDs_CSV { get; set; }
        public string Student_IDs_CSV { get; set; }
        public DataTable DT { get; set; } = new DataTable();
        public DB db { get; set; }
        public AddCourseModel(DB db)
        {
            this.db = db;
        }
        [BindProperty]
        public CourseInputModel Input { get; set; }

        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                DT = db.AllCoursesBriefed();
                return Page();
            }
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            db.AddNewCourse(Input.CourseCode, Input.CourseName, Input.Professor, Input.LectureRoom, Input.LectureDay, TimeSpan.Parse(Input.LectureHour), Input.LectureDuration ?? 0, Input.TutorialRoom, Input.TutorialDay, TimeSpan.Parse(Input.TutorialHour), Input.TutorialDuration ?? 0);
            db.ADD_TA_JTA_Students(Input.CourseCode, ParseIds(Input.TAsIDs), ParseIds(Input.JTAsIDs), ParseIds(Input.StudentsIDs));

            return RedirectToPage();
        }
        public IActionResult OnPostEditCourse(string Course_Code)
        {
            var result= db.GetCourseData(Course_Code);
            if (result?.CourseInfo == null || result.CourseInfo.Rows.Count == 0)
            {
                // Show error or redirect as needed
                ModelState.AddModelError(string.Empty, "Course data not found.");
                return Page();
            }
            Input = new CourseInputModel
            {
                CourseCode = result.CourseInfo.Rows[0]["course_code"].ToString(),
                CourseName = result.CourseInfo.Rows[0]["course_name"].ToString(),
                Professor = Convert.ToInt32(result.CourseInfo.Rows[0]["professor"]),
                LectureRoom = result.CourseInfo.Rows[0]["LectureRoom"].ToString(),
                LectureDay = result.CourseInfo.Rows[0]["LectureDay"].ToString(),
                LectureHour = result.CourseInfo.Rows[0]["LectureHour"].ToString(), // Keep as string
                LectureDuration = Convert.ToInt32(result.CourseInfo.Rows[0]["LectureDuration"]),
                TutorialRoom = result.CourseInfo.Rows[0]["TutorialRoom"].ToString(),
                TutorialDay = result.CourseInfo.Rows[0]["TutorialDay"].ToString(),
                TutorialHour = result.CourseInfo.Rows[0]["TutorialHour"].ToString(), // Keep as string
                TutorialDuration = Convert.ToInt32(result.CourseInfo.Rows[0]["TutorialDuration"]),
                TAsIDs = string.Join(",", result.TA_IDs),
                JTAsIDs = string.Join(",", result.JTA_IDs),
                StudentsIDs = string.Join(",", result.Student_IDs)
            };

            return Page();
        }

        public class CourseInputModel
        {
            public string CourseCode { get; set; }
            public string CourseName { get; set; }
            public int Professor { get; set; }
            public string TAsIDs { get; set; }
            public string JTAsIDs { get; set; }
            public string StudentsIDs { get; set; }
            public string LectureRoom { get; set; }
            public string LectureDay { get; set; }
            public string LectureHour { get; set; }
            public int? LectureDuration { get; set; }
            public string TutorialRoom { get; set; }
            public string TutorialDay { get; set; }
            public string TutorialHour { get; set; }
            public int? TutorialDuration { get; set; }
        }
        private List<int> ParseIds(string idString)
        {
            if (string.IsNullOrWhiteSpace(idString))
                return new List<int>();

            return idString.Split(new[] { ',' }, StringSplitOptions.RemoveEmptyEntries)
                          .Select(id => id.Trim())
                          .Where(id => !string.IsNullOrEmpty(id))
                          .Select(id => int.TryParse(id, out var num) ? num : (int?)null)
                          .Where(id => id.HasValue)
                          .Select(id => id.Value)
                          .ToList();
        }
    }
}