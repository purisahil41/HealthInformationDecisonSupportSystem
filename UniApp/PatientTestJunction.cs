using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace UniApp
{
    public partial class PatientTestJunction
    {
        public PatientTestJunction()
        {

        }
        [Key]
        [Column(Order = 1)]
        public int PatientId { get; set; }

        [Key]
        [Column(Order = 2)]
        public int DiagnosisTestID { get; set; }

        [ForeignKey("PatientId")]
        public PatientDetails Patient { get; set; }

        [ForeignKey("DiagnosisTestID")]
        public DiagnosisTest Diagnosis { get; set; }

        [StringLength(200)]
        public String Date { get; set; }

        public String ReasonStudy { get; set; }

        public String DiagnosticProblem { get; set; }

        [ForeignKey("ReasonStudy")]
        public StudyReason StudyReason { get; set; }

        [ForeignKey("DiagnosticProblem")]
        public DiagnosisProblem DiagnosticProblemObj { get; set; }
    
    }
}