using Entities.Concrete;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

public class ImageService
{
    private readonly IImageRepository _imageRepository;

    public ImageService(IImageRepository imageRepository)
    {
        _imageRepository = imageRepository;
    }

    public async Task<int> AddImageAsync(IFormFile file)
    {
        using var ms = new MemoryStream();
        await file.CopyToAsync(ms);

        var image = new Image
        {
            Data = ms.ToArray(),
            ContentType = file.ContentType
        };

        return await _imageRepository.AddImageAsync(image);
    }
}
