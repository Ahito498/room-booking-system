using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages
{
    public class LogoutModel : PageModel
    {
        public DB db { get; set; }
        public LogoutModel(DB db)
        {
            this.db = db;
        }

        public IActionResult OnPost()
        {
            HttpContext.Session.Remove("UserType");

            return RedirectToPage("/Login");
        }
    }
}