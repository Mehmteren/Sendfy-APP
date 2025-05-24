using Entities.Concrete;
using System.Threading.Tasks;

public class ImageUploadResultService
{
    private readonly IImageUploadResultRepository _resultRepository;

    public ImageUploadResultService(IImageUploadResultRepository resultRepository)
    {
        _resultRepository = resultRepository;
    }

    public async Task AddResultAsync(int imageId, bool isSuccess)
    {
        var result = new ImageUploadResult
        {
            ImageId = imageId,
            IsSuccess = isSuccess
        };

        await _resultRepository.AddUploadResultAsync(result);
    }
}
