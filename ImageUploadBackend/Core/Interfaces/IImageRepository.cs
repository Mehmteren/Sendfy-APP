using Entities.Concrete;
using System.Threading.Tasks;

public interface IImageRepository
{
    Task<int> AddImageAsync(Image image);
}
