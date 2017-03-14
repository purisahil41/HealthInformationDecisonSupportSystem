using System;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace UniApp
{
 
    public partial class UniversityMHIProjectContext : DbContext
    {
        public UniversityMHIProjectContext()
            : base("name=UniversityMHIProjectContext")
        {
        }

        public virtual DbSet<PatientDetails> PatientDetails {  get; set;} 



        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
