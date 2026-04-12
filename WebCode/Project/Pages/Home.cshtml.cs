using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;

namespace Project.Pages
{
    public class HomeModel : PageModel
    {
        private readonly ILogger<HomeModel> _logger;
        public DB db { get; set; }

        public HomeModel(ILogger<HomeModel> logger, DB db)
        {
            _logger = logger;
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
                return Page();  
            }
        }
    }
}
