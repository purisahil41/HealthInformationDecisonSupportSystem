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
       );

            context.PatientTestJunction.AddOrUpdate(
                new PatientTestJunction { PatientId = 1, DiagnosisTestID = 29 }
                );
            context.DiagnosisTest.AddOrUpdate(
             new DiagnosisTest { TestSubType = "Central Nervous System", TestType = "CT" },
               new DiagnosisTest { TestSubType = "Musculoskeltal", TestType = "CT" },
               new DiagnosisTest { TestSubType = "Abdomen", TestType = "CT" },
                              new DiagnosisTest { TestSubType = "Chest", TestType = "CT" },
                                             new DiagnosisTest { TestSubType = "Head", TestType = "CT" },
                                             new DiagnosisTest { TestSubType = "Neck", TestType = "CT" },
                                             new DiagnosisTest { TestSubType = "Spine", TestType = "CT" },

                                             new DiagnosisTest { TestSubType = "Central Nervous System", TestType = "XRAY" },
               new DiagnosisTest { TestSubType = "Musculoskeltal", TestType = "XRAY" },
               new DiagnosisTest { TestSubType = "Abdomen", TestType = "XRAY" },
                              new DiagnosisTest { TestSubType = "Chest", TestType = "XRAY" },
                                             new DiagnosisTest { TestSubType = "Head", TestType = "XRAY" },
                                             new DiagnosisTest { TestSubType = "Neck", TestType = "XRAY" },
                                             new DiagnosisTest { TestSubType = "Spine", TestType = "XRAY" },


                                             new DiagnosisTest { TestSubType = "Central Nervous System", TestType = "Ultrasound" },
               new DiagnosisTest { TestSubType = "Musculoskeltal", TestType = "Ultrasound" },
               new DiagnosisTest { TestSubType = "Abdomen", TestType = "Ultrasound" },
                              new DiagnosisTest { TestSubType = "Chest", TestType = "Ultrasound" },
                                             new DiagnosisTest { TestSubType = "Head", TestType = "Ultrasound" },
                                             new DiagnosisTest { TestSubType = "Neck", TestType = "Ultrasound" },
                                             new DiagnosisTest { TestSubType = "Spine", TestType = "Ultrasound" },


                                             new DiagnosisTest { TestSubType = "Central Nervous System", TestType = "MRI" },
               new DiagnosisTest { TestSubType = "Musculoskeltal", TestType = "MRI" },
               new DiagnosisTest { TestSubType = "Abdomen", TestType = "MRI" },
                              new DiagnosisTest { TestSubType = "Chest", TestType = "MRI" },
                                             new DiagnosisTest { TestSubType = "Head", TestType = "MRI" },
                                             new DiagnosisTest { TestSubType = "Neck", TestType = "MRI" },
                                             new DiagnosisTest { TestSubType = "Spine - Cervical Spine", TestType = "MRI" },
                                             new DiagnosisTest { TestSubType = "Spine - Lumbar Spine", TestType = "MRI" },
                                             new DiagnosisTest { TestSubType = "Spine - Thoracic Spine", TestType = "MRI" }
      );
        }
    }
}
