using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace lanN.Models;

public partial class FptbookContext : DbContext
{
    public FptbookContext()
    {
    }

    public FptbookContext(DbContextOptions<FptbookContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Author> Authors { get; set; }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<Genre> Genres { get; set; }

    public virtual DbSet<Publisher> Publishers { get; set; }

    public virtual DbSet<TblAuthor> TblAuthors { get; set; }

    public virtual DbSet<TblBook> TblBooks { get; set; }

    public virtual DbSet<TblCategory> TblCategories { get; set; }

    public virtual DbSet<TblUser> TblUsers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=LAPTOP-Q532C8NG; Database=FPTBook; Trusted_Connection=True; TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Author>(entity =>
        {
            entity.ToTable("Author");
        });

        modelBuilder.Entity<Book>(entity =>
        {
            entity.ToTable("Book");
        });

        modelBuilder.Entity<Genre>(entity =>
        {
            entity.ToTable("Genre");
        });

        modelBuilder.Entity<Publisher>(entity =>
        {
            entity.ToTable("Publisher");
        });

        modelBuilder.Entity<TblAuthor>(entity =>
        {
            entity.HasKey(e => e.AuthorId).HasName("PK__tblAutho__8E2731D995C3E56F");

            entity.ToTable("tblAuthor");

            entity.Property(e => e.AuthorId)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("authorID");
            entity.Property(e => e.AuthorAdress)
                .HasMaxLength(50)
                .HasColumnName("authorAdress");
            entity.Property(e => e.AuthorName)
                .HasMaxLength(30)
                .HasColumnName("authorName");
        });

        modelBuilder.Entity<TblBook>(entity =>
        {
            entity.HasKey(e => e.BookId).HasName("PK__tblBook__8BE5A12D1A65F895");

            entity.ToTable("tblBook");

            entity.Property(e => e.BookId)
                .HasMaxLength(10)
                .IsUnicode(false)
                .HasColumnName("bookID");
            entity.Property(e => e.BookDetailes)
                .HasMaxLength(500)
                .HasColumnName("bookDetailes");
            entity.Property(e => e.BookPrice)
                .HasDefaultValue(10)
                .HasColumnName("bookPrice");
            entity.Property(e => e.BookTitle)
                .HasMaxLength(30)
                .HasColumnName("bookTitle");
        });

        modelBuilder.Entity<TblCategory>(entity =>
        {
            entity.HasKey(e => e.CatId).HasName("PK__tblCateg__17B6DD266AF255DD");

            entity.ToTable("tblCategory");

            entity.HasIndex(e => e.CatName, "UQ__tblCateg__14D6C89B38A8E94B").IsUnique();

            entity.Property(e => e.CatId).HasColumnName("catID");
            entity.Property(e => e.CatDetails)
                .HasMaxLength(300)
                .HasColumnName("catDetails");
            entity.Property(e => e.CatName)
                .HasMaxLength(50)
                .HasColumnName("catName");
        });

        modelBuilder.Entity<TblUser>(entity =>
        {
            entity.HasKey(e => e.Mail).HasName("PK__tblUser__7A212905B02352A8");

            entity.ToTable("tblUser");

            entity.Property(e => e.Mail)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("mail");
            entity.Property(e => e.Psw)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.Usn).HasMaxLength(30);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
