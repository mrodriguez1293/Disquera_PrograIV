﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Disquera_PrograIV.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class parcial4Entities : DbContext
    {
        public parcial4Entities()
            : base("name=parcial4Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }
        public virtual DbSet<Autor> Autor { get; set; }
        public virtual DbSet<Cancion> Cancion { get; set; }
        public virtual DbSet<Disco> Disco { get; set; }
        public virtual DbSet<DiscoVenta> DiscoVenta { get; set; }
        public virtual DbSet<Genero> Genero { get; set; }
        public virtual DbSet<Nacionalidad> Nacionalidad { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<Venta> Venta { get; set; }
    }
}
