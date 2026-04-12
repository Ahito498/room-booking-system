using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Project.Models;
using System.Data;

namespace Project.Pages.RoomServicesTeam
{
    public class Cleaning_RequestModel : PageModel
    {
        private readonly DB db;

        [BindProperty]
        public string SelectedRoomId { get; set; }

        public List<string> RoomsList { get; set; } = new List<string>();
        public DataTable CleaningRequestsTable { get; set; } = new DataTable();

        public int CurrentUserId => 
            string.IsNullOrEmpty(HttpContext.Session.GetString("Email")) 
                ? 0 
              : db.GetUserID(HttpContext.Session.GetString("Email"));

        public Cleaning_RequestModel(DB db)
        {
            this.db = db;
        }

        public IActionResult OnGet()
        {
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("UserType")) ||
                HttpContext.Session.GetString("UserType") != "RoomServicesMember")
            {
                return RedirectToPage("/Login");
            }

            RoomsList = db.GetAvailableRoomIDs();
            CleaningRequestsTable = db.LoadAllCleaningRequestsForRoomServices();

            return Page();
        }
       

       public IActionResult OnPostSubmitCleaningRequest()
       {
           
           Console.WriteLine("Selected Room: " + SelectedRoomId);
           Console.WriteLine("Current User ID: " + CurrentUserId);

           if (!string.IsNullOrEmpty(SelectedRoomId) && CurrentUserId != 0)
           {
               db.InsertCleaningRequest(CurrentUserId, SelectedRoomId);
               Console.WriteLine("InsertCleaningRequest called successfully.");
           }
           else
           {
               Console.WriteLine("Request NOT inserted. Either room ID is missing or user ID is 0.");
           }

           return RedirectToPage(); // Reload and reflect updated data
       }

    }
}