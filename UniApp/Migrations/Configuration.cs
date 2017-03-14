namespace UniApp.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<UniApp.UniversityMHIProjectContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(UniApp.UniversityMHIProjectContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
            context.PatientDetails.AddOrUpdate(
                new PatientDetails { FirstName = "Parul", LastName = "Verma", DateOfBirth = "15Sep1991", Clinic = "SatuCLinic", MRN = "MRN00001", ReferringPhyscian = "Doctor 1", Signature = "MuSyg", BillingDetails = "PaidInsurance", Gender = "Male" }
                //new PatientDetails("Sahil","Puri","15Sep1991","SatyuClinic","MRN000002", "Doctor 2","MySig", "PaidInsurance","Male");
                //new PatientDetails("Satuajeet","Pat","12De1991","SatyuClinic","MRN000003", "DOctor 3","MySig", "PaidInsurance","Male");
       );
        }
    }
}
