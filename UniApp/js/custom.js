var loginUser = "";
$(document).ready(function ($) {
    //alert(loginUser);
  
        //$('#LoginPage').show();
        //$('#form1').hide();
  
    

        //$('#addDetailsButton').click(function () {
        //    $.ajax({
        //        type: "GET",
        //       url: "Index.aspx/addDetailsButtonClick",
        //        //contentType: 'application/json; charset=utf-8',
        //        //dataType: 'json',
        //        error: function (XMLHttpRequest, textStatus, errorThrown) {
        //            alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
        //        },
        //        success: function (data) {
        //            $('#modal').hide();
        //            $('#NewPatientDetails').hide();
        //            $('#OpeningDiv').show();
        //            alert(data);
        //        }

        //    });
        //});

      

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
