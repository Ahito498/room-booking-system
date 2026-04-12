using System.ComponentModel.DataAnnotations;

namespace Project.Pages.TA
{
    public class Tutorial
    {
        public int Id { get; set; }

        [Required]
        public string CourseCode { get; set; }

        [Required]
        public string TAId { get; set; }

        [Required]
        public string RoomNumber { get; set; }

        [Required]
        public string TimeSlot { get; set; }

        public TutorialStatus Status { get; set; }
    }

    public enum TutorialStatus
    {
        PendingApproval,
        Approved,
        Rejected
    }
}
