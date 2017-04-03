var loginUser = "";
$(document).ready(function ($) {
   
      

    $('#cancelButton').click(function () {
        $('#modal').hide();
        $('#NewPatientDetails').hide();
        $('#OpeningDiv').show();
    });
    $('.LoginSubmit').click(function () {
        var userID = $('#LoginUserTextBox').val();
        var passWordID = $('#LoginUserPasswordTextBox').val();
        if ((userID == "parul" && passWordID == "verma") || (userID == "" && passWordID == ""))
        {
            loginUser = "ENTRYUSER";
            window.location.href = "http://localhost:59778/Index.aspx";
           // $('#LoginPage').hide();
            //$('#form1').show();
        }
        else if(userID == "admin" && passWordID == "admin")
        {
            loginUser = "ADMINUSER";
            window.location.href = "http://localhost:59778/Index.aspx";
          //  $('#LoginPage').hide();
           // $('#form1').show();
            //$('#InputBox').css('height', '30%');
            $('#InterfaceConfig').show();
        }
        else {
            alert("Incorrect login details");
            $('#LoginUserTextBox').val('');
            $('#LoginUserPasswordTextBox').val('');
        }
    });

    $('#NewPatient').click(function () {
        $('#modal').show();
        $('#NewPatientDetails').show();
        // $('#OpeningDiv').hide();
    });

    $('#btnDiagnosticExamSubmit').click(function () {
        //$('#modal').show();
        //alert("hey lo");

        if ($('#DropDownListMRI').val() == "Spine - Cervical Spine" || $('#DropDownListMRI').val() == "Spine - Lumbar Spine")
        {
            $("#lblDecisionSupportText").html("CT without contrast is not indicated initally [Grade B- moderate evidence] Includes situations where experience shows that the clinical problem usually resolves with time,and where deferring the study is suggested.CT is only indicated for patients with severe hemoptysis or other risk factors . (see F17 Hemoptysis: smoker, high risk of malignancy, >40 yrs of recurrent).Radiation Dose (mSv): 5 - 10 Reference source: <a href='http://www.car.ca/uploads/standards%20guidelines/car-referralguidelines-f-en_20120918.pdf' target='_blank' title='Canadian Association of Radiologists Referral guidelines for Thoracic system '> Canadian Association of Radiologists Referral guidelines for Thoracic system </a>");
            $('#Page-Dialog-DecisionSupport').show();
        }
        else {
            $('.TestInfo').hide();
            $('.ConfirmOrder').show();
        }
        
        // $('#OpeningDiv').hide();
    });

    $('#lbnDecisionSupportCancel').click(function () {
        //$('#modal').show();
        //alert("hey lo");
        //$("#lblDecisionSupportText").html("CT without contrast is not indicated initally [Grade B- moderate evidence] Includes situations where experience shows that the clinical problem usually resolves with time,and where deferring the study is suggested.CT is only indicated for patients with severe hemoptysis or other risk factors . (see F17 Hemoptysis: smoker, high risk of malignancy, >40 yrs of recurrent).Radiation Dose (mSv): 5 - 10 Reference source: <a href='http://www.car.ca/uploads/standards%20guidelines/car-referralguidelines-f-en_20120918.pdf' target='_blank' title='Canadian Association of Radiologists Referral guidelines for Thoracic system '> Canadian Association of Radiologists Referral guidelines for Thoracic system </a>");
        //alert("hello chahat");

        $('#Page-Dialog-DecisionSupport').hide();
        // $('#OpeningDiv').hide();
    });

    $('#lbnDecisionSupportContinue').click(function () {
        //$('#modal').show();
        //alert("hey lo");
        //$("#lblDecisionSupportText").html("CT without contrast is not indicated initally [Grade B- moderate evidence] Includes situations where experience shows that the clinical problem usually resolves with time,and where deferring the study is suggested.CT is only indicated for patients with severe hemoptysis or other risk factors . (see F17 Hemoptysis: smoker, high risk of malignancy, >40 yrs of recurrent).Radiation Dose (mSv): 5 - 10 Reference source: <a href='http://www.car.ca/uploads/standards%20guidelines/car-referralguidelines-f-en_20120918.pdf' target='_blank' title='Canadian Association of Radiologists Referral guidelines for Thoracic system '> Canadian Association of Radiologists Referral guidelines for Thoracic system </a>");
        //alert("hello chahat");
        
        $('#Page-Dialog-DecisionSupport').hide();
        $('.TestInfo').hide();
        $('.ConfirmOrder').show();
        // $('#OpeningDiv').hide();
    });
    
    //$('#ReturningPatient').click(function () {
    //    $('#OpeningDiv').css({ 'transition': '3s', 'background-position': '0px -200px' });
    //    $('#OpeningDiv').css({ 'transition': '3s', 'height': '0px' });
    //    //$('#OpeningDiv > div:nth-child(2)').css({ 'transition': '1s', 'opacity': '0' });
    //    $('#OpeningDiv > div').css({ 'transition': '1s', 'opacity': '0' });
    //    setTimeout(function () {
    //        //$('#OpeningDiv div:nth-child(2)').hide();
    //        $('#OpeningDiv > div').hide();
    //        $('#PatientSelector').show();
    //    }, 2000);
    //});

    $('.TabHeader').click(function () {
        if(!$(this).hasClass('TabSelected'))
        {
            $('.TabHeader').each(function () {
                $(this).removeClass('TabSelected');
            });
            var text = $(this).text().trim();
            $(this).addClass('TabSelected');
            $('.RemainderDiv').each(function () {
                if ($(this).hasClass(text)) {
                    $(this).show();
                }
                else {
                    $(this).hide();
                }
            });
        }
    });
});
