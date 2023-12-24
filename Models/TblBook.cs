using System;
using System.Collections.Generic;

namespace lanN.Models;

public partial class TblBook
{
    public string BookId { get; set; } = null!;

    public string BookTitle { get; set; } = null!;

    public int BookPrice { get; set; }

    public string? BookDetailes { get; set; }
}
