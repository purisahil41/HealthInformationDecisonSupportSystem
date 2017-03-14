using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniApp
{
    public partial class PatientDetails
    {
        public PatientDetails()
        {
            
        }
        public PatientDetails(string FirstName, string LastName, string DateofBirth, string Clinic, string MRN, string ReferringPhyscian, string Signature, string BillingDetails, string Gender)
        {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.DateOfBirth = DateOfBirth;
            this.Clinic = Clinic;
            this.MRN = MRN;
            this.ReferringPhyscian = ReferringPhyscian;
            this.Signature = Signature;
            this.BillingDetails = BillingDetails;
            this.Gender = Gender;
        }
        [Key]
        public int PatientId { get; set; }

        [StringLength(200)]
        public string FirstName { get; set; }

        [StringLength(200)]
        public string LastName { get; set; }

        [StringLength(200)]
        public string DateOfBirth { get; set; }

        [StringLength(200)]
        public string Clinic{ get; set; }
        
        [StringLength(200)]
        public string MRN{ get; set; }
        
        [StringLength(200)]
        public string ReferringPhyscian{ get; set; }
        
        [StringLength(200)]
        public string Signature { get; set; }
        
        [StringLength(200)]
        public string BillingDetails { get; set; }

        [StringLength(200)]
        public string Gender { get; set; }

 
    }
}