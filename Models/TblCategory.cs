using System;
using System.Collections.Generic;

namespace lanN.Models;

public partial class TblCategory
{
    public int CatId { get; set; }

    public string CatName { get; set; } = null!;

    public string? CatDetails { get; set; }
}
