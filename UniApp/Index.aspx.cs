using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UniApp
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

//        protected void btnDiagnosticExamSubmit_OnClick(object sender, EventArgs e)
//        {       
//            if (ddlDiagnosticCTSub.SelectedValue.Equals("> CT Chest  without IV contrast"))
//                {
//                    lblDecisionSupportText.Text =
//                        @"CT without contrast is not indicated initally [Grade B- moderate evidence] Includes situations where experience shows that the clinical problem usually resolves with time,                 
//                and where deferring the study is suggested. CT is only indicated for patients with severe hemoptysis or other risk factors . (see F17 Hemoptysis: smoker, high risk of malignancy,
//                >40 yrs of recurrent). Radiation Dose (mSv): 5-10 Reference source: <a href= 'http://www.car.ca/uploads/standards%20guidelines/car-referralguidelines-f-en_20120918.pdf' target='_blank'
//                title='Canadian Association of Radiologists Referral guidelines for Thoracic system '> Canadian Association of Radiologists Referral guidelines for Thoracic system </a> ')";

//                }
//                else
//                {
//    lblDecisionSupportText.Text =
//                   @"CT chest without contrast is not eligible for payment with current insurance provider. Reason for billing payment rejection:  Last CT was completed less than nine months ago. 
//                    Please contact Billing Payment Division administrator for further information .
//                   <span style='color: red;'> *Please note Continue Order will result in immediate review by current insurance provider who may
//                    request ordering provider for further supporting documentation in specific cases before proceeding with order or after order
//                    is completed for urgent cases)   </span>";

//            }
//            txtDecisionSupportTitle.Text = "Text";
//                    }

//        protected void ddlMainPatient_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            if (ddlMainPatient.SelectedIndex <= 0)
//            {
//                pnlContent.Enabled = false;

//            }
//            else
//            {

//                pnlContent.Enabled = true;

//                if (ddlMainPatient.SelectedItem.Text.Equals("Patient 1"))
//                {
//                    txtTitle.Text = "Mr.";
//                    txtFirstName.Text = "Patient1M";
//                    txtLastName.Text = "Patient1last";
//                    txtDateofBirth.Text = "****";
//                    txtClinic.Text = "ClinicA";
//                    txtMRN.Text = "MR006677223";
//                    txtReferringPhysician.Text = "Dr A";
//                    txtDecisionSupporteSignature.Text = "";
//                    ddlBilling.SelectedIndex = 1;
//                    ddlGender.SelectedIndex = 1;

//                }
//                else if (ddlMainPatient.SelectedItem.Text.Equals("Patient 2"))
//                {
//                    txtTitle.Text = "Mr.";
//                    txtFirstName.Text = "Patient2F";
//                    txtLastName.Text = "Patient2last";
//                    txtDateofBirth.Text = "****";
//                    txtClinic.Text = "ClinicB";
//                    txtMRN.Text = "MR006677224";
//                    txtReferringPhysician.Text = "Dr B";
//                    txtDecisionSupporteSignature.Text = "";
//                    ddlBilling.SelectedIndex = 1;
//                    ddlGender.SelectedIndex = 2;
//                }
//            }
//        }
    }
}