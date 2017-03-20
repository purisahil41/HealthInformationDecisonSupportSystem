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
        public static List<PatientTestJunction> patientTestJunc = new List<PatientTestJunction>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {


                DropDownListMRI.Items.Clear();
                DropDownListCT.Items.Clear();
                DropDownListXRAY.Items.Clear();
                DropDownListUltrasound.Items.Clear();
                ddlMainPatient.Items.Clear();
                patientTestJunc.Clear();
                ddlMainPatient.Items.Add("----Select One----");
                List<PatientDetails> patientDetailsList = new List<PatientDetails>();
                using (var db = new UniversityMHIProjectContext())
                {
                    //var patientDet = new PatientDetails { BillingDetails = billingText, Clinic = clinicText, DateOfBirth = dateOfBirth, FirstName = firstText, LastName = lastText, Gender = sexText, MRN = mrnText, ReferringPhyscian = "", Signature = "" };
                    //db.PatientDetails.Add(patientDet);
                    //db.SaveChanges();

                    foreach (PatientDetails ptDet in db.PatientDetails)
                    {
                        patientDetailsList.Add(ptDet);
                    }

                    foreach (DiagnosisTest test in db.DiagnosisTest)
                    {
                        if (test.TestType == "MRI")
                        {
                            DropDownListMRI.Items.Add(test.TestSubType);
                        }
                        else if (test.TestType == "CT")
                        {
                            DropDownListCT.Items.Add(test.TestSubType);
                        }
                        else if (test.TestType == "XRAY")
                        {
                            DropDownListXRAY.Items.Add(test.TestSubType);
                        }
                        else if (test.TestType == "Ultrasound")
                        {
                            DropDownListUltrasound.Items.Add(test.TestSubType);
                        }
                    }
                }

                foreach (PatientDetails pt in patientDetailsList)
                {
                    ddlMainPatient.Items.Add(pt.FirstName + " " + pt.LastName + " - " + pt.MRN);
                }
            }
        }

        protected void dropDrownSelectionIndexChanged(object sender, EventArgs e)
        {
            patientTestJunc.Clear();
            int selectedIndex = ddlMainPatient.SelectedIndex - 1;
            PatientDetails ptDet = null;
            using (var db = new UniversityMHIProjectContext())
            {
                List<PatientDetails> list = db.PatientDetails.ToList();
                ptDet = list.ElementAt(selectedIndex);

                foreach(PatientTestJunction ptJunc in db.PatientTestJunction)
                {
                    if(ptJunc.PatientId == ptDet.PatientId)
                    {
                        ptJunc.Diagnosis = db.DiagnosisTest.Where(x => x.DiagnosisTestID== ptJunc.DiagnosisTestID).FirstOrDefault();
                        patientTestJunc.Add(ptJunc);
                    }
                }            
            }


            if(ptDet != null)
            {
                aspGenderTextBox.Text = ptDet.Gender;
                aspBillingTextBox.Text = ptDet.BillingDetails;
                aspClinicTextBox.Text = ptDet.Clinic;
                aspDOBTextBox.Text = ptDet.DateOfBirth;
                aspFirstNameTextBox.Text = ptDet.FirstName;
                aspLastNameTextBox.Text = ptDet.LastName;
                aspMRNTextBox.Text = ptDet.MRN;
                aspTitleTextBox.Text = "Mr.";
            }
        }
    }
}