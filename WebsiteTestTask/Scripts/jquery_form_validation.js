$(document).ready(function () {
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
            dv_userssList$tb_start_date: {
                date:true
            },
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