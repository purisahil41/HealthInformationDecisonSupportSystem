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
    <meta name="copyright" content="Beerinder Chhina Project." />
    <meta name="author" content="Beerinder Chhina" />
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
                <asp:ListItem>Patient 1</asp:ListItem>
                <asp:ListItem>Patient 2</asp:ListItem>
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
                        <input class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Last Name</span>
                        <input class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">First Name</span>
                        <input class="pull-right" type="text" value=""/>
                    </div>
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">MRN</span>
                        <input class="pull-right" type="text" value=""/>
                    </div>
                    <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Date Of Birth</span>
                        <input class="pull-right" type="text" value=""/>
                    </div>
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Billing</span>
                        <input class="pull-right" type="text" value=""/>
                    </div>
                     <div class="PatientInfoBox">
                        <span class="PatientInfoBoxSpan pull-left">Gender</span>
                        <input class="pull-right" type="text" value="Male"/>
                    </div>


                </div>
                <div class="PatientDetailsBox">
                    <span style="margin-left:40%;font-size:20px;font-weight:bolder;">Test Details</span>
                </div>
                <div class="TestInfo">
                    <div class="TestInfoBox">
                          <span class="PatientInfoBoxSpan pull-left">Ultrasound</span>
                        <select class="pull-right"></select>
                    </div>
                    
                    <div class="TestInfoBox">
                           <span class="PatientInfoBoxSpan pull-left">CT</span>
                      <select class="pull-right"></select>
                    </div>
                    <div class="TestInfoBox">
                           <span class="PatientInfoBoxSpan pull-left">MRI</span>
                       <select class="pull-right"></select>
                    </div>
                     
                    <div class="TestInfoBox">
                           <span class="PatientInfoBoxSpan pull-left">X-RAY</span>
                      <select class="pull-right"></select>
                    </div>
                    <input type="submit" class="SubmitButton btn btn-info" value="Submit Button"/>
                </div>
            </div>
              <div class="RemainderDiv EHR hidden">
               
            </div>
            <div class="RemainderDiv VISITS hidden">
               
            </div>

        </div>
    </form>
</body>
</html>
