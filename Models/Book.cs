using System;
using System.Collections.Generic;

namespace lanN.Models;

public partial class Book
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Isbn { get; set; } = null!;

    public int TotalPages { get; set; }

    public int AuthorId { get; set; }

    public int PubhlisherId { get; set; }

    public int GenreId { get; set; }
}
