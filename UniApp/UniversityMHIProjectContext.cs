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

        public virtual DbSet<DiagnosisTest> DiagnosisTest { get; set; }

        public virtual DbSet<PatientTestJunction> PatientTestJunction { get; set; }

        public virtual DbSet<DiagnosisProblem> DiagnosisProblem { get; set; }
        
        public virtual DbSet<StudyReason> StudyReason{ get; set; } 



        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
