using DataAccess.Context;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Repository
{
    public class ImageUploadResultRepository : IImageUploadResultRepository
    {
        private readonly AppDbContext _context;

        public ImageUploadResultRepository(AppDbContext context)
        {
            _context = context;
        }

        public async Task AddUploadResultAsync(ImageUploadResult result)
        {
            await _context.ImageUploadResults.AddAsync(result);
            await _context.SaveChangesAsync();
        }
    }
}
