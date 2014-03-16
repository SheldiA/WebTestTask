$(document).ready(function(){
    $("#form1").validate({
        rules:{
            tb_fromDate:{
                date:true,
            },
            tb_toDate: {
                date:true,
            },
        },

        messages:{
            tb_fromDate:{
                date:"Enter correct date!",
            },
            tb_toDate: {
                date: "Enter correct date!",
            },
        },
    });
});