<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="UniApp.Index" %>

<!doctype html>
<!--[if IEMobile 7 ]> <html class="no-js iem7"> <![endif]-->
<!--[if (gt IEMobile 7)|!(IEMobile)]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
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
    <div id="LoginPage">
        <div id="LoginDialog">
            <div style="height:20%;width:100%;border-bottom:1px dashed black; text-align:center;padding-top:10px;font-weight:bold;font-size:35px;">Login!</div>
       <div style="height:30%; width:100%;padding:8%;">
           <div style="float:left;width:40%;height:10%;font-size:25px;"> User Name : </div>
           <input id="LoginUserTextBox" style="height:30px;" type="text" value="" />
       </div>
             <div style="height:30%; width:100%;padding:8%;">
           <div style="float:left;width:40%;height:10%;font-size:25px;"> Password : </div>
           <input id="LoginUserPasswordTextBox" style="height:30px;font-size:20px;" type="Password" value=""/>
       </div>
             <input type="submit" class="SubmitButton btn btn-info LoginSubmit" style="width:100px;height:40px;color:black" value="Submit!">
             </div>
    </div>
    <form id="form1" runat="server">
        <div id="modal"></div>
        <div id="OpeningDiv">
            <div style="position: absolute; top: 5%; left: 35%; width: 10%; width: 50%; color: white; color: midnightblue; font-size: 35px; font-weight: 900;">
                MRI Order Entry System!
            </div>
            <div id="InputBox" style="top: 40%; height: 20%; margin-left: 30%; width: 40%; position: absolute; padding: 3%; padding-top: 4%; background-color: #fff; opacity: 0.8; border-radius: 30px;">
                <div id="NewPatient" class="label OpeningDivLabel">Add New Patient?</div>
                <asp:LinkButton runat="server" id="ReturningPatient" class="label OpeningDivLabel" OnClick="ReturningPatient_Click">Returning Patients?</asp:LinkButton><br />
     <div id="InterfaceConfig" style="display:none; position: relative;
    /* margin-top: -1%; */
    top: 60%;
    left: 20%;" class="label OpeningDivLabel">Rule Base Add/Edits?</div>
            </div>
        </div>
        <div id="NewPatientDetails">
            
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 2%;">
                    <label for="title" style="font:20px">Title:</label>
                    <asp:DropDownList id="titleBox" runat="server" AutoPostBack="true" Style="width: 40%; margin-left: 5%;height: 5%">
                        <asp:ListItem>Mr.</asp:ListItem>
                        <asp:ListItem>Ms.</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="first_name">First Name:</label>
                    <input type="text" class="form-control" runat="server" id="firstNameBox" style="height: 5%;">
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="last_name">Last Name:</label>
                    <input type="text" class="form-control" runat="server" id="lastNameBox" style="height: 5%;">
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="dob">Date of Birth:</label>
                    <input type="text" class="form-control" runat="server" id="dobBox">
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="gender">Sex:</label>
                    <asp:DropDownList id="gender" runat="server" AutoPostBack="true" Style="width: 40%; margin-left: 5%;height: 5%;">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="clinic">Clinic:</label>
                    <input type="text" class="form-control" id="clinicBox" runat="server" style="height: 5%;">
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="MRN">MRN:</label>
                    <input type="text" class="form-control" id="MRNBox" runat="server" style="height: 5%;">
                </div>
                <div class="form-group" style="margin-left: 5%; width: 40%;padding-top: 0.01%;">
                    <label for="billing">Billing:</label>
                    <input type="text" class="form-control" id="billingBox" runat="server" style="height: 5%;">
                </div>
                <button type="button" id="addDetailsButton" class="btn btn-primary" style="margin-left: 5%; width: 38%;padding-top: 0.1%;font: 10px">Submit</button><button type="button" id="cancelButton" class="btn btn-primary" style="margin-left: 5%; width: 38%;padding-top: 0.1%;font: 10px">Cancel</button>
                                
            
        </div>
    </form>
    <%--  <form id="form1" runat="server" style="position:absolute;top:0;left:0;z-index:-1;">
        <div id="Page-Wrapper">
            <div id="Page-Container">
                <div id="Page-Body">
                    <div id="Page-Content">
                        <div id="Page-Content-Inner">
                            <div id="Page-Content-Patient">
                                <asp:DropDownList ID="ddlMainPatient" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMainPatient_SelectedIndexChanged">
                                     <asp:ListItem>-- Select One --</asp:ListItem>
                                                    <asp:ListItem>Patient 1</asp:ListItem>
                                                    <asp:ListItem>Patient 2</asp:ListItem>

                                </asp:DropDownList>
                            </div>
                            <!-- Nav tabs -->
                            <ul id="Page-Top-Tab" class="nav nav-tabs" role="tablist">
                                <li role="presentation"><a class="blue" href="#home" aria-controls="home" role="tab" data-toggle="tab">Patient EHR</a></li>
                                <li role="presentation"><a class="orange" href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Visits</a></li>
                                <li role="presentation"><a class="green" href="#CPOE" aria-controls="CPOE" role="tab" data-toggle="tab">CPOE</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <asp:Panel ID="pnlContent" runat="server" CssClass="tab-content" Enabled="false">
                                <div role="tabpanel" class="tab-pane active" id="home"><p>text for Patient EHR</p></div>
                                <div role="tabpanel" class="tab-pane" id="profile"><p>text for Patient EHR</p></div>
                                <div role="tabpanel" class="tab-pane" id="CPOE">
                                    <table class="table-Default">
                                        <tr>
                                            <td><span>Title</span></td>
                                            <td><asp:TextBox ID="txtTitle" runat="server" /></td>
                                            <td><span>Clinic</span></td>
                                            <td><asp:TextBox ID="txtClinic" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td><span>First Name</span></td>
                                            <td><asp:TextBox ID="txtFirstName" runat="server" /></td>
                                            <td><span>MRN</span></td>
                                            <td><asp:TextBox ID="txtMRN" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td><span>Last Name</span></td>
                                            <td><asp:TextBox ID="txtLastName" runat="server" /></td>
                                            <td><span>Referring physician</span></td>
                                            <td><asp:TextBox ID="txtReferringPhysician" runat="server" /></td>
                                        </tr>
                                        <tr>
                                            <td><span>Date of Birth</span></td>
                                            <td><asp:TextBox ID="txtDateofBirth" runat="server" /></td>
                                            <td><span>Billing</span></td>
                                            <td>
                                                <asp:DropDownList ID="ddlBilling" runat="server">
                                                    <asp:ListItem>-- Select One --</asp:ListItem>
                                                    <asp:ListItem>Provincial payer</asp:ListItem>
                                                    <asp:ListItem>Cash / Credit</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><span>Gender</span></td>
                                            <td>
                                                <asp:DropDownList ID="ddlGender" runat="server">
                                                    <asp:ListItem>-- Select One --</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div class="Sub-Block" style="padding-bottom: 0">
                                                    <!-- Nav tabs -->
                                                    <ul class="nav nav-tabs Page-Sub-Tab" role="tablist">
                                                        <li class=""><a class="blue" href="#BlockMedication" aria-controls="BlockMedication" role="tab" data-toggle="tab">Medication</a></li>
                                                        <li class=""><a class="orange" href="#BlockLaboratory" aria-controls="BlockLaboratory" role="tab" data-toggle="tab">Laboratory</a></li>
                                                        <li class=""><a class="blue" href="#BlockDiagnostic" aria-controls="Diagnostic" role="tab" data-toggle="tab">Diagnostic</a></li>
                                                        <li class=""><a class="green" href="#BlockConsult" aria-controls="BlockConsult" role="tab" data-toggle="tab">Consult</a></li>
                                                    </ul>

                                                    <!-- Tab panes -->
                                                    <div class="tab-content">
                                                        <div role="tabpanel" class="tab-pane light-blue" id="BlockMedication"><p>text for Patient EHR</p></div>
                                                        <div role="tabpanel" class="tab-pane light-orange" id="BlockLaboratory"><p>text for Patient EHR</p></div>
                                                        <div role="tabpanel" class="tab-pane light-blue" id="BlockDiagnostic">
                                                            <div id="Diagnostic-Step1">
                                                                <h4>Exam Selection</h4>
                                                                <table class="table-Default">
                                                                <tr>
                                                                    <td><span>X-Ray</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticXRay" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>Head ></asp:ListItem>
                                                                            <asp:ListItem>Facial ></asp:ListItem>
                                                                            <asp:ListItem>Neck ></asp:ListItem>
                                                                            <asp:ListItem>Chest ></asp:ListItem>
                                                                            <asp:ListItem>Abdomen / Pelvis ></asp:ListItem>
                                                                            <asp:ListItem>Musculoskeletal ></asp:ListItem>
                                                                            <asp:ListItem>Spine ></asp:ListItem>
                                                                            <asp:ListItem>Other ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:DropDownList ID="ddlDiagnosticXRaySub" runat="server" CssClass="hidden">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>> Single View Chest X-Ray</asp:ListItem>
                                                                            <asp:ListItem>> Bilateral Ribs chest x-ray</asp:ListItem>
                                                                            <asp:ListItem>> Two views chest x-ray</asp:ListItem>
                                                                            <asp:ListItem>> Two views chest x-ray (posterior-anterior, lateral decubitus)</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><span>Ultrasound</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticUltrasound" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>Head ></asp:ListItem>
                                                                            <asp:ListItem>Neck ></asp:ListItem>
                                                                            <asp:ListItem>Chest ></asp:ListItem>
                                                                            <asp:ListItem>Abdomen / Pelvis ></asp:ListItem>
                                                                            <asp:ListItem>Musculoskeletal ></asp:ListItem>
                                                                            <asp:ListItem>Spine ></asp:ListItem>
                                                                            <asp:ListItem>Other ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:DropDownList ID="ddlDiagnosticUltrasoundSub" runat="server" CssClass="hidden">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>> Ultrasound Chest</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><span>CT</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticCT" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>Head ></asp:ListItem>
                                                                            <asp:ListItem>Facial ></asp:ListItem>
                                                                            <asp:ListItem>Neck ></asp:ListItem>
                                                                            <asp:ListItem>Chest ></asp:ListItem>
                                                                            <asp:ListItem>Abdomen / Pelvis ></asp:ListItem>
                                                                            <asp:ListItem>Musculoskeletal ></asp:ListItem>
                                                                            <asp:ListItem>Spine ></asp:ListItem>
                                                                            <asp:ListItem>Other ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:DropDownList ID="ddlDiagnosticCTSub" runat="server" CssClass="hidden">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>> CT Chest  without IV contrast</asp:ListItem>
                                                                            <asp:ListItem>> CT Chest  with IV contrast</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><span>MRI</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticMRI" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>Head ></asp:ListItem>
                                                                            <asp:ListItem>Facial ></asp:ListItem>
                                                                            <asp:ListItem>Neck ></asp:ListItem>
                                                                            <asp:ListItem>Chest ></asp:ListItem>
                                                                            <asp:ListItem>Abdomen / Pelvis ></asp:ListItem>
                                                                            <asp:ListItem>Musculoskeletal ></asp:ListItem>
                                                                            <asp:ListItem>Spine ></asp:ListItem>
                                                                            <asp:ListItem>Other ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <asp:DropDownList ID="ddlDiagnosticMRISub" runat="server" CssClass="hidden">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>> MR Chest without IV contrast</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><span>Nuclear Medicine</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticNuclearMedicine" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>PT/CT Bone Skull to Thigh ></asp:ListItem>
                                                                            <asp:ListItem>PT/CT Bone Whole Body ></asp:ListItem>
                                                                            <asp:ListItem>PT/CT Tumor Loc Ltd ></asp:ListItem>
                                                                            <asp:ListItem>PT/CT Tumor Loc Skull To Thigh ></asp:ListItem>
                                                                            <asp:ListItem>PT/CT Tumor Loc Whole Body ></asp:ListItem>
                                                                            <asp:ListItem>PT/CT Simulation Limited Area ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                </table>
                                                                <div style="text-align: right; margin: 0 10px;">
                                                                    <asp:LinkButton ID="btnDiagnosticSubmit" Text="Submit" CssClass="Button blue" runat="server"/>
                                                                </div>
                                                            </div>
                                                            <div id="Diagnostic-Step2" class="hidden">
                                                                <h4>Clinical Indication for Exam</h4>
                                                                <table class="table-Default">
                                                                <tr>
                                                                    <td><span>Reason for study</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticReasonforStudy" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>Chest Pain ></asp:ListItem>
                                                                            <asp:ListItem>Trauma ></asp:ListItem>
                                                                            <asp:ListItem>Infection ></asp:ListItem>
                                                                            <asp:ListItem>Thoracentesis ></asp:ListItem>
                                                                            <asp:ListItem>Hemorrhage ></asp:ListItem>
                                                                            <asp:ListItem>Interstitial disease ></asp:ListItem>
                                                                            <asp:ListItem>Nodule ></asp:ListItem>
                                                                            <asp:ListItem>Metastasis ></asp:ListItem>
                                                                            <asp:ListItem>Malignant Neoplasm ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><span>Diagnosis/ problem</span></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlDiagnosticDiagnosis" runat="server">
                                                                            <asp:ListItem>-- Select One --</asp:ListItem>
                                                                            <asp:ListItem>Upper respiratory tract infection ></asp:ListItem>
                                                                            <asp:ListItem>acute exacerbation of COPD ></asp:ListItem>
                                                                            <asp:ListItem>pneumonia ></asp:ListItem>
                                                                            <asp:ListItem>pneumonia follow-up ></asp:ListItem>
                                                                            <asp:ListItem>Immunosupressed patient with respiratory symptoms/ febrile neutropenia ></asp:ListItem>
                                                                            <asp:ListItem>Hemoptysis: nonsmoker, low risk of malignancy, infrequent ></asp:ListItem>
                                                                            <asp:ListItem>Chronic dyspnea of pulmonary cause or suspected interstitial / diffuse lung disease ></asp:ListItem>
                                                                            <asp:ListItem>Solitary pulmonary nodule (solid) ></asp:ListItem>
                                                                            <asp:ListItem>pulmonary metastases ></asp:ListItem>
                                                                            <asp:ListItem>Suspected mediastinal lesion on CXR ></asp:ListItem>
                                                                            <asp:ListItem>Suspected lymphadenopathy on CXR or clinical examination. ></asp:ListItem>
                                                                            <asp:ListItem>Elevated Diaphragm on CXR ></asp:ListItem>
                                                                            <asp:ListItem>minor chest trauma ></asp:ListItem>
                                                                            <asp:ListItem>major chest trauma ></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                </table>
                                                                <div style="text-align: right; margin: 0 10px;">
                                                                    <asp:LinkButton ID="btnDiagnosticExamSubmit" Text="Submit" CssClass="Button blue" OnClick="btnDiagnosticExamSubmit_OnClick" runat="server"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane light-green" id="BlockConsult"><p>text for Patient EHR</p></div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td style="vertical-align: top;">
                                                <asp:LinkButton ID="lbnViewEhr" Text="View EHR" CssClass="Button green" runat="server"/>
                                                <Br/><Br/><Br/>
                                                <img border="0" alt="Hospital" src="/graphics/iHospital.png"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </asp:Panel>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:TextBox ID="txtDecisionSupportTitle" runat="server" CssClass="hidden" />
        <div id="Page-Dialog-DecisionSupport" class="modal-content">
            <h3>Decision Support</h3>
            <p><b>
                <asp:Label ID="lblDecisionSupportText" runat="server"/>
            </b></p>
            <div style="text-align: center;">
                <asp:LinkButton ID="lbnDecisionSupportCancel" Text="Cancel Order" CssClass="Button blue" runat="server"/>
                <asp:LinkButton ID="lbnDecisionSupportContinue" Text="Continue Order" CssClass="Button blue" runat="server"/>
            </div>
        </div>
        
        <div id="Page-Dialog-DecisionSupport-Warning" class="modal-content">
            <h3>Interaction Warning</h3>
            <p><span id="Page-Dialog-DecisionSupport-Warning-PatientName"></span> is allergic to the following medications:</p>
            <p><ul>
                <li><b>Drug Name #1</b></li>
                <li><b>Drug Name #2</b></li>
            </ul></p>
            <p>Please verify that this is the correct medication you would like to prescribe.</p>
            <div style="text-align: center;">
                <asp:LinkButton ID="lbnDecisionSupportWarningAccept" Text="Accept" CssClass="Button blue" runat="server"/>
                <asp:LinkButton ID="lbnDecisionSupportWarningCancel" Text="Cancel" CssClass="Button blue" runat="server"/>
            </div>
        </div>
        
        <div id="Page-Dialog-DecisionSupport-Confirm" class="modal-content">
            <span>Select Reason for override:</span><Br/>
            <asp:DropDownList ID="ddlDecisionSupportReasonforOverride" runat="server">
                <asp:ListItem>-- Select One --</asp:ListItem>
                <asp:ListItem>Distinctive clinical context</asp:ListItem>
                <asp:ListItem>Required for emergency urgent care</asp:ListItem>
                <asp:ListItem>Radiologist and or specialist consulted who recommended reject recommendation.</asp:ListItem>
                <asp:ListItem>New clinical practice guidelines  who recommend reject recommendation.</asp:ListItem>
                <asp:ListItem>New research evidence who recommend reject recommendation.</asp:ListItem>
                <asp:ListItem>Limited access to imaging tests and have to choose the best alternative.</asp:ListItem>
                <asp:ListItem>Other – Enter reason</asp:ListItem>
            </asp:DropDownList><Br/>
            <div id="Page-Dialog-DecisionSupport-Confirm-Other" class="hidden">
                <span>Specify Reason:</span><Br/>
                <asp:TextBox ID="txtDecisionSupportOther" runat="server" TextMode="MultiLine" /><Br/><Br/>
            </div>
            <span>eSignature:</span><Br/>
            <asp:TextBox ID="txtDecisionSupporteSignature" runat="server" /><Br/><Br/>
            <span style="display: block; text-align: center;">Confirm override?</span>
            <div style="text-align: right; margin: 15px 10px;">
                <asp:LinkButton ID="lbnDecisionSupportConfirmConfirm" Text="Confirm" CssClass="Button blue" runat="server"/>
                <asp:LinkButton ID="lbnDecisionSupportConfirmCancel" Text="Cancel" CssClass="Button blue" runat="server"/>
            </div>
        </div>
    </form>--%>
</body>
</html>
