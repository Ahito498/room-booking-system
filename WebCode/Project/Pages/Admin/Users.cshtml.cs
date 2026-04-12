using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.Linq;
using Project.Models;
using System.Drawing;
using System.Data;

namespace Project.Pages.Admin
{
    [BindProperties (SupportsGet =true)]
    public class UsersModel : PageModel
    {
        public string UserType { get; set; }
        [StringLength(100)]
        public string Name { get; set; } 
        public DB db { get; set; }
        public UsersModel(DB db)
        {
            this.db = db;
        }
        public DataTable DT { get; set; } = new DataTable();

        public bool Searched { get; set; }

        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")))
            {
                return RedirectToPage("/Login");
            }

            DT = db.SearchUsers(UserType ?? "", Name ?? "");

            Searched = true;
            return Page();
            }
        public IActionResult OnPostSetType(int UserID, string NewType)
        {
            db.UpdateUserType(UserID, NewType);
            return Page();
        }
    }
}
        
