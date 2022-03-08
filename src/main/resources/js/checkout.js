$("#action-add-new").on("click", function () {
    if ($("#add-address").hasClass("hide")) {
        $("#add-address").removeClass("hide").addClass("show");
    }
});

$(".close-modal").on("click", function () {
    if ($("#add-address").hasClass("show")) {
        $("#add-address").removeClass("show").addClass("hide");
    }
});
$(".select-address").on("click", function () {
    if ($(".item-add").hasClass("active")) {
        $(".item-add").removeClass("active");
        $(this).closest('div.item-add').addClass("active");
        var idAdress = $(this).data('id-address');
        $('#id-address-select').val(idAdress);
    }
    if (!$(this).hasClass("active")){
        $(this).closest('div.item-add').addClass("active");
        var idAdress = $(this).data('id-address');
        $('#id-address-select').val(idAdress);
    }
});
$("#js-bandc-province").on("click", function () {
    if ($("#js-bandc-distric-list").css("display") == "block" || $("#js-bandc-wards-list").css("display") == "block") {
        $("#js-bandc-distric-list").css("display", "none");
        $("#js-bandc-wards-list").css("display", "none");
    }
    $("#js-bandc-province-list").css("display", "block");
});
$("#js-bandc-distric").on("click", function () {
    if (
        $("#js-bandc-province-list").css("display") == "block" ||
        $("#js-bandc-wards-list").css("display") == "block"
    ) {
        $("#js-bandc-province-list").css("display", "none");
        $("#js-bandc-wards-list").css("display", "none");
    }
    $("#js-bandc-distric-list").css("display", "block");
});
$("#js-bandc-wards").on("click", function () {
    if (
        $("#js-bandc-province-list").css("display") == "block" ||
        $("#js-bandc-distric-list").css("display") == "block"
    ) {
        $("#js-bandc-province-list").css("display", "none");
        $("#js-bandc-distric-list").css("display", "none");
    }
    $("#js-bandc-wards-list").css("display", "block");
});

$('.h-pop-close').on('click',function(){
    $(".popup-delate-address-cart").removeClass("active");
    $(".bg-h-pop").removeClass("active");
})

$(".h-pop-not").on("click", function () {
    $(".popup-delate-address-cart").removeClass("active");
    $(".bg-h-pop").removeClass("active");
});

$(".bg-h-pop").on("click", function () {
    $(".popup-delate-address-cart").removeClass("active");
    $(this).removeClass("active");
});

$('#district').on('change',function (){
    let code = $(this).val();
    let codeCity = $('#city').val();
    let nameStr = $(this).find(":selected").text();
    $('#name-district').val(nameStr);
    jQuery.ajax({
        url:"/ajax/wards-address?code="+code+"&city="+codeCity, //->action
        type: "post",
        contentType: "application/json",
        dataType: "json", // kieu du lieu tra ve tu controller la json
        success: function(jsonResult) {
            $('#wards option').remove();
            $('#wards').append("<option value disabled selected>Phường/Xã</option>");
            for (let i = 0; i < jsonResult.length; i++) {
                $('#wards').append("<option value="+jsonResult[i]['code']+">"+jsonResult[i]['name']+"</option>");
            }
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
});
$('#wards').on('change',function (){
    let nameStr = $(this).find(":selected").text();
    $('#name-wards').val(nameStr);
})
$('#city').on('change',function (){
    let code = $(this).val();
    let nameStr = $(this).find(":selected").text();
    $('#name-city').val(nameStr);
    jQuery.ajax({
        url:"/ajax/districts-address?code="+code, //->action
        type: "post",
        contentType: "application/json",
        dataType: "json", // kieu du lieu tra ve tu controller la json
        success: function(jsonResult) {
            $('#wards option').remove();
            $('#wards').append("<option value disabled selected>Phường/Xã</option>");
            $('#district option').remove();
            $('#district').append("<option value disabled selected>Quận/Huyện</option>");
            for (let i = 0; i < jsonResult.length; i++) {
                $('#district').append("<option value="+jsonResult[i]['code']+">"+jsonResult[i]['name']+"</option>");
            }
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
});

$('.edit-address').on('click',function (){
    if ($("#add-address").hasClass("hide")) {
        $("#add-address").removeClass("hide").addClass("show");
    }
    var idAddress = $(this).data('edit');
    jQuery.ajax({
        url:"/ajax/getAddress?idAddress="+idAddress, //->action
        type: "post",
        contentType: "application/json",
        dataType: "json", // kieu du lieu tra ve tu controller la json
        success: function(jsonResult) {
            console.log(jsonResult)
            var addressStr = jsonResult.address.address;
            $('#full_name').val(jsonResult.address.name);
            $('#phone_number').val(jsonResult.address.phone);
            $('#id-address').val(jsonResult.address.id);
            $('#name-wards').val(jsonResult.country.nameWard);
            $('#name-district').val(jsonResult.country.nameDistrict);
            $('#name-city').val(jsonResult.country.nameCity);
            $('#addressDetail').val(jsonResult.country.soNha);
            $('#email').val(jsonResult.address.email);
            if (jsonResult.address.setAsDefault == true){
                $('#checkBox-default').attr('checked','checked');
            }
            $('#city option').each(function (){
                if ($(this).val() == jsonResult.country.city){
                    $(this).attr("selected","selected");
                }
            })

            for (let i = 0; i < jsonResult.listDistrict.length; i++) {
                $('#district').append('<option value='+jsonResult.listDistrict[i].code+'>'+jsonResult.listDistrict[i].name+'</option>')
            }
            for (let i = 0; i < jsonResult.listWard.length; i++) {
                $('#wards').append('<option value='+jsonResult.listWard[i].code+'>'+jsonResult.listWard[i].name+'</option>')
            }
            $('#district option').each(function (){
                if ($(this).val() ==  jsonResult.country.district){
                    $(this).attr("selected","selected");
                }
            })
            $('#wards option').each(function (){
                if ($(this).val() ==  jsonResult.country.ward){
                    $(this).attr("selected","selected");
                }
            })
            $('.title-header-form').text("Sửa thổng tin địa chỉ");
            $('.button-add-new-address').text("Sửa Địa Chỉ");
        },
        error: function(jqXhr, textStatus, errorMessage) {
        }
    });
})
$(".delete-address").on('click',function(){
    $(".popup-delate-address-cart").addClass("active");
    $('.bg-h-pop').addClass('active');
    var idDelete = $(this).data('delete');
    $('#js-delete-address-id').val(idDelete);
})
$('.h-pop-ok').on('click',function (){
    var idAddressDelete = $('#js-delete-address-id').val();
    jQuery.ajax({
        url:"/ajax/delete-address?idAddress="+idAddressDelete, //->action
        type: "post",
        contentType: "application/json",
        dataType: "json", // kieu du lieu tra ve tu controller la json
        success: function(jsonResult) {
            console.log(jsonResult)
            $('.item-add[data-address='+jsonResult.data.id+']').remove();
            $(".popup-delate-address-cart").removeClass("active");
            $(".bg-h-pop").removeClass("active");
            if ($('.add-new-address-event').hasClass('remove')){
                $('.add-new-address-event').removeClass('remove');
            }
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
});
$('#submit-form-checkout').on('click',function (e){
    if ($('#id-address-select').val() == '' || $('#id-address-select').val().length  == 0){
        e.preventDefault();
        alert("Vui lòng chọn địa chỉ");
    }
})

//validate form
$().ready(function (){
    $.validator.addMethod("validatePhone", function (value, element) {
        return this.optional(element) || /(84|0[3|5|7|8|9])+([0-9]{8})\b/i.test(value);
    },"Sai định dạng số điện thoại !");

    $.validator.addMethod("validateEmail",function (value,element){
        return this.optional(element) || /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/i.test(value);
    },"Sai định dạng Email !");


    $('#form-address-checkout').validate({
        rules: {
            name: "required",
            addressDetail:"required",
            phone: {
                required:true,
                minlength:10,
                validatePhone:true,
            },
            email:{
                required: true,
                validateEmail: true,
            },
            city:"required",
            district:"required",
            wards:"required",
        },
        messages: {
            name: "Vui lòng nhập tên !",
            addressDetail:"Vui lòng nhật số nhà/ tên đường !",
            email: {
                required: "Vui lòng nhập email !"
            },
            phone: {
                required: "Vui lòng nhập số điện thoại !",
                minlength: "Số điện thoại ít nhất 10 số !"
            },
            wards:"Vui lòng chọn xã/phường",
            city: "Vui lòng chọn tỉnh/thành phố",
            district: "Vui lòng chọn quận/huyện",
        },
        errorElement : 'div',
        submitHandler: function(form) {
            form.submit();
        },
    });

    $('#form-checkout').validate({
        rules: {
            payment: "required",
        },
        messages: {
            payment: "Vui lòng chọn hình thức thanh toán",
        },
        errorElement : 'div',
        errorPlacement: function(error, element) {
            if (element.attr('name') == 'payment') {
                error.insertAfter('#payment-error');
            } else{
                error.insertAfter(element);
            }
        },
        submitHandler: function(form) {
            form.submit();
        },
    })
})
