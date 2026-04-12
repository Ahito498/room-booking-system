using System.Data;
using System.Drawing;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages.Registrar
{
    public class CoursesModel : PageModel
    {
        public DataTable DT { get; set; } = new DataTable();
        public DB db { get; set; }
        public CoursesModel(DB db)
        {
            this.db = db;
        }
        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }
            else
            {
                DT = db.LoadCourses();
                return Page();
            }
        }
    }
}
