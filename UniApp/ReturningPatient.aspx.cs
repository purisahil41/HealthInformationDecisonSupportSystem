using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UniApp
{
    public partial class ReturningPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<PatientDetails> patientDetailsList = new List<PatientDetails>();
            using (var db = new UniversityMHIProjectContext())
            {
                //var patientDet = new PatientDetails { BillingDetails = billingText, Clinic = clinicText, DateOfBirth = dateOfBirth, FirstName = firstText, LastName = lastText, Gender = sexText, MRN = mrnText, ReferringPhyscian = "", Signature = "" };
                //db.PatientDetails.Add(patientDet);
                //db.SaveChanges();

                foreach(PatientDetails ptDet in db.PatientDetails)
                {
                    patientDetailsList.Add(ptDet);
                }
            }

            foreach(PatientDetails pt in patientDetailsList)
            {
                ddlMainPatient.Items.Add(pt.FirstName + " " + pt.LastName + " - " + pt.MRN);
            }
        }

        protected void dropDrownSelectionIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = ddlMainPatient.SelectedIndex;
            PatientDetails ptDet = null;
            using (var db = new UniversityMHIProjectContext())
            {
                ptDet = db.PatientDetails.ElementAt(selectedIndex);
            }
            if(ptDet != null)
            {

            }
        }
    }
}