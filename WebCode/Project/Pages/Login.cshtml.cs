using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using Project.Models;
using System.ComponentModel.DataAnnotations;

namespace Project.Pages
{
    
    [BindProperties (SupportsGet=true)]

    public class LoginModel : PageModel
    {

        public DB db { get; set; }
        public int ID { get; set; }
        public LoginModel(DB db)
        {
            this.db = db;
        }

        [TempData]
        public string EmailErrorMessage { get; set; }
        [TempData]
        public string PasswordErrorMessage { get; set; }
        public string UT { get; set; }
        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public IActionResult OnGet()
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToPage("/Home");
            }
            return Page();
        }

        public IActionResult OnPost()
        {
            UT= db.GetUserType(Email);

            if (string.IsNullOrEmpty(UT))
            {
                EmailErrorMessage = "The email you entered doesn't exist in our system.";
                return Page();
            }

            ID = db.GetUserID(Email);

            if (!db.CheckPassword(ID, Password))
            {
                PasswordErrorMessage = "The password is not correct.";
                return Page();
            }
            HttpContext.Session.SetString("Email", Email);
            HttpContext.Session.SetString("UserType", UT);

            return RedirectToPage("/Home");


            
        }
    }
}