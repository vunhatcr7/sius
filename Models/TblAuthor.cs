using System;
using System.Collections.Generic;

namespace lanN.Models;

public partial class TblAuthor
{
    public string AuthorId { get; set; } = null!;

    public string AuthorName { get; set; } = null!;

    public string? AuthorAdress { get; set; }
}
