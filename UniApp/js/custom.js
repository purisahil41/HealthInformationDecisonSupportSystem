$(document).ready(function ($) {

    $('#NewPatient').click(function(){
        $('#modal').show();
        $('#NewPatientDetails').show();
       // $('#OpeningDiv').hide();
    });



    //$('#Page-Top-Tab a[aria-controls="CPOE"]').tab("show");
    //$('.Page-Sub-Tab a[aria-controls="Diagnostic"]').tab("show");

    //$('#Page-Top-Tab a').click(function(e) {
    //    e.preventDefault();
    //    $(this).tab("show");
    //});

    //$('.Page-Sub-Tab a').click(function (e) {
    //    e.preventDefault();
    //    $(this).tab("show");
    //});

    //$("#ddlDiagnosticXRay").change(function () {
    //    if ($(this).val() === "Chest >") {
    //        $('#ddlDiagnosticXRaySub').removeClass("hidden");
    //    } else {
    //        $('#ddlDiagnosticXRaySub').addClass("hidden");
    //    }
    //});

    //$("#ddlDiagnosticUltrasound").change(function () {
    //    if ($(this).val() === "Chest >") {
    //        $('#ddlDiagnosticUltrasoundSub').removeClass("hidden");
    //    } else {
    //        $('#ddlDiagnosticUltrasoundSub').addClass("hidden");
    //    }
    //});

    //$("#ddlDiagnosticCT").change(function () {
    //    if ($(this).val() === "Chest >") {
    //        $('#ddlDiagnosticCTSub').removeClass("hidden");
    //    } else {
    //        $('#ddlDiagnosticCTSub').addClass("hidden");
    //    }
    //});

    //$("#ddlDecisionSupportReasonforOverride").change(function () {
    //    if ($(this).val() === "Other – Enter reason") {
    //        $('#Page-Dialog-DecisionSupport-Confirm-Other').removeClass("hidden");
    //    } else {
    //        $('#Page-Dialog-DecisionSupport-Confirm-Other').addClass("hidden");
    //    }
    //});

  

    //$("#btnDiagnosticSubmit").click(function (e) {
    //    e.preventDefault();
    //    if ($("#ddlDiagnosticCT").val() === "Chest >") {
    //        $('#Diagnostic-Step1').addClass("hidden");
    //        $('#Diagnostic-Step2').removeClass("hidden");
    //    }
    //});

    //var decisionSupportDialogBox = $("#Page-Dialog-DecisionSupport").dialog({
    //    autoOpen: false,
    //    height: 280,
    //    width: 500,
    //    modal: true
    //});
    //decisionSupportDialogBox.parent().appendTo(jQuery("form:first"));

    //var decisionSupportWarningDialogBox = $("#Page-Dialog-DecisionSupport-Warning").dialog({
    //    autoOpen: false,
    //    height: 280,
    //    width: 500,
    //    modal: true
    //});
    //decisionSupportWarningDialogBox.parent().appendTo(jQuery("form:first"));

    //var decisionSupportConfirmDialogBox = $("#Page-Dialog-DecisionSupport-Confirm").dialog({
    //    autoOpen: false,
    //    height: 375,
    //    width: 300,
    //    modal: true
    //});
    //decisionSupportConfirmDialogBox.parent().appendTo(jQuery("form:first"));

    //if ($("#txtDecisionSupportTitle").val() !== "") {
    //    decisionSupportDialogBox.dialog("open");
    //    $('#Diagnostic-Step1').addClass("hidden");
    //    $('#Diagnostic-Step2').removeClass("hidden");
    //}

    //$("#lbnDecisionSupportCancel").click(function (e) {
    //    e.preventDefault();
    //    decisionSupportDialogBox.dialog("close");
    //});

    //$("#lbnDecisionSupportContinue").click(function (e) {
    //    e.preventDefault();
    //    decisionSupportDialogBox.dialog("close");
    //    decisionSupportConfirmDialogBox.dialog("open");
    //});

    //$("#lbnDecisionSupportConfirmConfirm").click(function (e) {
    //    e.preventDefault();
    //    //decisionSupportConfirmDialogBox.dialog("close");
    //    //decisionSupportWarningDialogBox.dialog("open");
    //    $("#Page-Dialog-DecisionSupport-Warning-PatientName").html($("#txtFirstName").val());
    //    window.location.href = "index.aspx";
    //});

    //$("#lbnDecisionSupportConfirmCancel").click(function (e) {
    //    e.preventDefault();
    //    decisionSupportConfirmDialogBox.dialog("close");
    //    decisionSupportDialogBox.dialog("open");
    //});

    //$("#lbnDecisionSupportWarningAccept").click(function (e) {
    //    e.preventDefault();
    //    //decisionSupportWarningDialogBox.dialog("close");
    //    //decisionSupportConfirmDialogBox.dialog("close");
    //    //decisionSupportDialogBox.dialog("close");
    //    window.location.href = "index.aspx";
    //});

    //$("#lbnDecisionSupportWarningCancel").click(function (e) {
    //    e.preventDefault();
    //    decisionSupportWarningDialogBox.dialog("close");
    //    decisionSupportConfirmDialogBox.dialog("close");
    //    decisionSupportDialogBox.dialog("close");
   // });
});
