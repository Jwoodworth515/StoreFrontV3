﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFrontV3.DATA.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class StoreFrontEntities : DbContext
    {
        public StoreFrontEntities()
            : base("name=StoreFrontEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Brand> Brands { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Guitar_Category> Guitar_Categories { get; set; }
        public virtual DbSet<GuitarInventory> GuitarInventories { get; set; }
        public virtual DbSet<Guitar> Guitars { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
    }
}
