$(document).ready(function ($) {

    $('#NewPatient').click(function () {
        $('#modal').show();
        $('#NewPatientDetails').show();
        // $('#OpeningDiv').hide();
    });

    $('#ReturningPatient').click(function () {
        $('#OpeningDiv').css({ 'transition': '3s', 'background-position': '0px -200px' });
        $('#OpeningDiv').css({ 'transition': '3s', 'height': '0px' });
        //$('#OpeningDiv > div:nth-child(2)').css({ 'transition': '1s', 'opacity': '0' });
        $('#OpeningDiv > div').css({ 'transition': '1s', 'opacity': '0' });
        setTimeout(function () {
            //$('#OpeningDiv div:nth-child(2)').hide();
            $('#OpeningDiv > div').hide();
            $('#PatientSelector').show();
        }, 2000);
    });

    $('.TabHeader').click(function () {
        if(!$(this).hasClass('TabSelected'))
        {
            $('.TabHeader').each(function () {
                $(this).removeClass('TabSelected');
            });
            $(this).addClass('TabSelected');
        }
    });
});
