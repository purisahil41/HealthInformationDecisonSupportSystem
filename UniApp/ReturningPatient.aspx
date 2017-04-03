<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturningPatient.aspx.cs" Inherits="UniApp.ReturningPatient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>University Project</title>

    <meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
    <!-- <meta http-equiv="content-type" content="application/xhtml+xml; charset=iso-8859-1" /> -->
    <meta http-equiv="content-language" content="en" />

    <!-- Meta Page Info Section -->
    <meta charset="utf-8">
    <meta name="HandheldFriendly" content="True" />
    <meta name="MobileOptimized" content="320" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />

    <meta name="revisit-after" content="2 weeks" />
    <meta name="distribution" content="global" />
    <meta name="rating" content="general" />
    <meta name="robots" content="all" />

    <!-- Style Sheets -->
    <link rel="stylesheet" type="text/css" media="all" href="/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" media="all" href="/css/Custom.css" />
    <!-- /Style Sheets -->

    <!-- Javascript Scripts -->
    <script src="/js/jquery.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
    <form id="form2" runat="server">
    <%--<div>
    
    </div>--%>
             <div id="PatientSelector">
            <div style="float: left; font-size: 25px;">
                Patient ID : &nbsp;
        
            </div>
        <div style="float: left; font-size: 23px;">
            <asp:DropDownList ID="ddlMainPatient" runat="server" AutoPostBack="true" Style="width: 250px; height: 33px;" OnSelectedIndexChanged="dropDrownSelectionIndexChanged">
                <asp:ListItem>-- Select One --</asp:ListItem>
            <%--    <asp:ListItem>Patient 1</asp:ListItem>
                <asp:ListItem>Patient 2</asp:ListItem>--%>
            </asp:DropDownList>
        </div>
        </div>
        <div class="ReturningDiv">

            <div style="position: relative; width: 100%; height: 10%;">
                <div class="TabHeader"><span class="TabHeadText">EHR</span> </div>
                <div class="TabHeader"><span class="TabHeadText">VISITS</span> </div>
                <div class="TabHeader TabSelected"><span class="TabHeadText">CPOE</span>  </div>
            </div>
            <div class="RemainderDiv CPOE">
                <div class="PatientDetailsBox">
                    <span style="margin-left:40%;font-size:20px;font-weight:bolder;">Patient Details</span>
                </div>
                <div class="PatientInfo">
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Title</span>
                        <asp:TextBox runat="server" ID="aspTitleTextBox" class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Clinic</span>
                        <asp:TextBox runat="server" ID="aspClinicTextBox" class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">First Name</span>
                        <asp:TextBox runat="server" ID="aspFirstNameTextBox" class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Last Name</span>
                        <asp:TextBox runat="server" ID="aspLastNameTextBox" class="pull-right" type="text" value=""/>
                    </div>
                <%--  <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">First Name</span>
                        <asp:TextBox runat="server" ID="aspTitleTextBox" class="pull-right" type="text" value=""/>
                    </div>--%>
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">MRN</span>
                        <asp:TextBox runat="server" ID="aspMRNTextBox" class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Date Of Birth</span>
                        <asp:TextBOx runat="server" ID="aspDOBTextBox" class="pull-right" type="text" value=""/>
                    </div>
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Billing</span>
                        <asp:TextBox runat="server" ID="aspBillingTextBox" class="pull-right" type="text" value=""/>
                    </div>
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Gender</span>
                        <asp:TextBox runat="server" ID="aspGenderTextBox" class="pull-right" type="text" value="Male"/>
                    </div>


                </div>
                <div class="PatientDetailsBox">
                    <span style="margin-left:40%;font-size:20px;font-weight:bolder;">Test Details</span>
                </div>
                <div class="TestInfo">
                    <div class="TestInfoBox">
                          <span class="PatientInfoBoxSpan pull-left">Ultrasound</span>
                         <asp:DropDownList ID="DropDownListUltrasound" runat="server" AutoPostBack="true" CssClass="pull-right">
                             <asp:ListItem>-- Select One --</asp:ListItem>
                         </asp:DropDownList>
                        
                    </div>
                    
                    <div class="TestInfoBox">
                           <span class="PatientInfoBoxSpan pull-left">CT</span>
                     <asp:DropDownList ID="DropDownListCT" runat="server" AutoPostBack="true" CssClass="pull-right">
                         <asp:ListItem>-- Select One --</asp:ListItem>
                     </asp:DropDownList>
                    </div>
                    <div class="TestInfoBox">
                           <span class="PatientInfoBoxSpan pull-left">MRI</span>
                       <asp:DropDownList ID="DropDownListMRI" runat="server" AutoPostBack="true" CssClass="pull-right">
                           <asp:ListItem>-- Select One --</asp:ListItem>
                       </asp:DropDownList>
                    </div>
                     
                    <div class="TestInfoBox">
                           <span class="PatientInfoBoxSpan pull-left">X-RAY</span>
                      <asp:DropDownList ID="DropDownListXRAY" runat="server" AutoPostBack="true" CssClass="pull-right">
                          <asp:ListItem>-- Select One --</asp:ListItem>
                      </asp:DropDownList>
                    </div>
                                     <asp:LinkButton ID="btnDiagnosticExamSubmit" Text ="Submit Test" CssClass="SubmitButton btn btn-info"  OnClientClick="return false;" runat="server"/>
                    
                </div>
                <div class="ConfirmOrder">
                        <div class="label" style="font-size: 18px; color: black; margin-left: -34%;">
                            <label for="Reason-for-test" style="font-size:19px;">Clinical indication for Exam</label>
                        </div>
                        <div class="TestInfoBox" style="margin-top: 25.5px;">
                            <span class="PatientInfoBoxSpan pull-left">Reasons for Study</span>
                              <asp:DropDownList ID="StudyReasonDropdown"  runat="server" AutoPostBack="false" CssClass="pull-right">
                <asp:ListItem>-- Select One --</asp:ListItem>
   
            </asp:DropDownList>
                        </div>
                        <div class="TestInfoBox" style="margin-top: -0.5%;">
                            <span class="PatientInfoBoxSpan pull-left">Diagnosis/Problem</span>
                              <asp:DropDownList ID="DiagnosisProblemDropDon" runat="server" AutoPostBack="false" CssClass="pull-right">
                <asp:ListItem>-- Select One --</asp:ListItem>
   
            </asp:DropDownList>
                        </div>
                        <label for="overrideReason" style="position: absolute; margin-left: -37.05%; margin-top: 5%; font-weight: normal;">Please specify the reason if not included in above list:</label>
                        <input type="text" class="form-control" id="overrideReason" style="height: 35%; width: 28%; margin-left: 1%; margin-top: 4.2%;"/>
                        <asp:Button runat="server" id="placeOrder" CssClass="SubmitButton btn btn-info" style="margin-top: -7%;" Text="Place Order" OnClick="orderConfirmation"></asp:Button>  
                </div>
            </div>
            <div id="Page-Dialog-DecisionSupport" class="modal-content" style="display: none;">
                <h3>Decision Support</h3>
                <p><b>
<%--                <label id="lblDecisionSupportText"/>--%>
                <asp:Label ID="lblDecisionSupportText" runat="server"/>
                </b></p>
                <div style="text-align: center;">
                    <%--<asp:LinkButton ID="lbnDecisionSupportCancel" Text="Cancel Order" CssClass="Button blue" runat="server"/>
                    <asp:LinkButton ID="lbnDecisionSupportContinue" Text="Continue Order" CssClass="Button blue" runat="server"/>
                    --%>
                    
                    <div id="lbnDecisionSupportCancel"  class="SubmitButton btn btn-info">Cancel Order</div>
                    <div id="lbnDecisionSupportContinue" class="SubmitButton btn btn-info">Continue Order</div>
                    
                </div>
            </div>
              <div class="RemainderDiv EHR" style="display:none;">
               
            </div>
            <div class="RemainderDiv VISITS" style="display:none;">
                <div class="PatientDetailsBox">
                    <span style="margin-left:40%;font-size:20px;font-weight:bolder;">Patient Visits Details!</span>
                </div>
                <% foreach(UniApp.PatientTestJunction ptDet in patientTestJunc)
                   {
                       %>
                  <div class="PatientDetailsBox">
                      
                    <div class="LabelInput"><span> Name : <%=ptDet.Patient.FirstName + " " + ptDet.Patient.LastName %></span></div>
                        <div class="LabelInput"><span>Diagnostic : <%=ptDet.Diagnosis.TestType + " " + ptDet.Diagnosis.TestSubType%></span></div>
                        <div class="LabelInput"><span> Date : <%=ptDet.Date%></span></div>
                        <%--<div class="LabelInput"><span> First Name - <%=ptDet.Patient.FirstName + " " + ptDet.Patient.LastName %></span></div>--%>
                </div>
               <%
               } %>
            </div>

        </div>
    </form>
</body>
</html>
