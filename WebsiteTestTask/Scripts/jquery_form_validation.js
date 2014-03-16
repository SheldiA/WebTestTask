$(document).ready(function () {
    $.validator.addMethod("datetime", function (value, element) {
        return /^(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[012])\.(19|20)\d\d\s([01]\d|2[0-3])(:[0-5]\d){2}$/.test(value);
    }, "Enter date-time in format DD.MM.YYYY HH:MM:SS");
    $("#fm_usersEditor").validate({
        rules: {
            dv_userssList$tb_name: {
                required: true,
                minlength: 3,
                maxlength:10,
            },
            dv_userssList$tb_password: {
                required: true,
                maxlength:10,
            },
            dv_userssList$tb_email:{
                required:true,
                email:true,
            },
            dv_userssList$tb_start_date: "datetime",
        },
        highlight: function (element, errorClass) {
            $(element).fadeOut(function () {
                $(element).fadeIn();
            });
        },
        success: function (label) {
            label.text('OK!').addClass('valid');
        }
    });

    $(".connect").click(function () {
        var validator = $("#fm_usersEditor").validate();
        if (validator.numberOfInvalids() > 0)
            return false;
    });
});