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
            $('#name-wards').val('');
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
            $('#name-district').val('');
            $('#name-wards').val('');
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
$('.dong-y-delete').on('click',function (){
    var id = $(this).data('id');
    console.log("Id: "+id);
    jQuery.ajax({
        url: "/admin/update/status-delete/order/"+parseInt(id),
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            var idR = $('.data-order-row').map(function (){
                console.log($(this).data('order'));
                if (parseInt($(this).data('order')) == jsonValue.id ){
                    $(this).remove();
                }
            });
        },
        error: function(jqXhr, textStatus, errorMessage) {
            if(jqXhr.status == 400){
                alert("Lỗi thay đổi trạng thái");
            }
        }
    });
})