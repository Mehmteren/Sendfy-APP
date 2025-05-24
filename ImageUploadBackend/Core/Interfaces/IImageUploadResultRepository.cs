using Entities.Concrete;
using System.Threading.Tasks;

public interface IImageUploadResultRepository
{
    Task AddUploadResultAsync(ImageUploadResult result);
}
