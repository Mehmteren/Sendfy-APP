using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
    public class ImageUploadResult
    {
        public int Id { get; set; }

        [ForeignKey(nameof(Image))] 
        public int ImageId { get; set; }

        public bool IsSuccess { get; set; }

        public Image Image { get; set; }
    }

}
