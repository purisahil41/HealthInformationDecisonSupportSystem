using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniApp
{
    public partial class DiagnosisTest
    {
        public DiagnosisTest()
        {
            
        }
      
        [Key]
        public int DiagnosisTestID { get; set; }

        [StringLength(200)]
        public string TestType { get; set; }


        [StringLength(200)]
        public string TestSubType { get; set; }


        
    }
}