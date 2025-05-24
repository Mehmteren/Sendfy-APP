using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

[ApiController]
[Route("api/[controller]")]
public class ImageController : ControllerBase
{
    private readonly ImageService _imageService;
    private readonly ImageUploadResultService _resultService;

    public ImageController(ImageService imageService, ImageUploadResultService resultService)
    {
        _imageService = imageService;
        _resultService = resultService;
    }

    [HttpPost("upload")]
    public async Task<IActionResult> UploadImage(IFormFile file)
    {
        if (file == null || file.Length == 0)
            return BadRequest("Dosya geçersiz.");

        int imageId = 0;
        try
        {
            imageId = await _imageService.AddImageAsync(file);

            await _resultService.AddResultAsync(imageId, true);
            return Ok("Success");
        }
        catch
        {
            if (imageId != 0)
                await _resultService.AddResultAsync(imageId, false);

            return StatusCode(500, "Failed");
        }
    }
}
