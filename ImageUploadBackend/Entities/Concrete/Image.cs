using System.ComponentModel.DataAnnotations;

namespace Entities.Concrete
{
    public class Image
    {
        public int Id { get; set; }

        [Required]
        public byte[] Data { get; set; } 

        public string ContentType { get; set; }  

        public ImageUploadResult ImageUploadResult { get; set; }
    }
}
