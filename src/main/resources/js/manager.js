
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
