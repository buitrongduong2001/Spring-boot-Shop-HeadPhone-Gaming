function validateEmail(email) {
    const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
  }
  
  function validatePass(password) {
    const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    return re.test(password);
  }
function validateUser() {
    var username = $(".user-username").val();
    var fulname = $(".user-fullname").val();
    var pass = $(".user-password").val();
    var email = $(".user-email").val();
    if (username == "") {
        $(".user-username").closest(".form-group").find('span').text("*Không được để trống username");
        return true;
    }

    if (fulname == "") {
        $(".user-fullname").closest(".form-group").find('span').text("*Không được để trống fullname");
        return true;
    }

    var checkPass = validatePass(pass);
    if(pass==""){
        $(".user-password").closest(".form-group").find('span').text("*Không được để trống password");
        return true;
    }else if(checkPass === false){
        $(".user-password").closest(".form-group").find('span').text("*Password gồm số và chữ và trên 6 kí tự");
        return true;
    }
    


    var checkEmail = validateEmail(email);
    if(email == ""){
        $(".user-email").closest(".form-group").find('span').text("*Không được để trống Email");
        return true;
    }else if(checkEmail===false){
        $(".user-email").closest(".form-group").find('span').text("*Sai định dạng email");
        return true;
    } 
    return false;
}
$(".btn-submit-user").on("click",function(event){
    var check = validateUser();
    if(check==true){
        event.preventDefault();
    }
    console.log(check);
})

// Validate Category
function validateCategory(){
    var cate = $("#name_category").val();
    if(cate == ""){
        $("#name_category").closest(".form-group").find("span").text("*Name category không được để trống");
        return true;
    }
}
$(".btn-submit-category").on("click",function(event){
    var check = validateCategory();
    if(check==true){
        event.preventDefault();
    }
})


//Validate Product
function validateProduct(){
    var idPro = $("#id-product").val();
    var namePro = $("#name-product").val();
    var datePro = $("#date-product").val();
    var pricePro = $("#price-product").val();
    var moTaPro = $("#moTa-product").val();
    if(idPro==""){
        $("#id-product").closest(".form-group").find("#error_id_product").text("*Id product không được để trống");
        return true;
    }

    if(namePro==""){
        $("#name-product").closest(".form-group").find("#error_name_product").text("*Name product không được để trống");
        return true;
    }

    if(datePro==""){
        $("#date-product").closest(".form-group").find("#error_date_product").text("*Date product không được để trống");
        return true;
    }

    if(pricePro==""){
        $("#price-product").closest(".form-group").find("#error_price_product").text("*Price product không được để trống");
        return true;
    }
    if(moTaPro==""){
        $("#moTa-product").closest(".form-group").find("#error_moTa_product").text("*Mô tả product không được để trống");
        return true;
    }
}
$(".btn-submit-product").on("click",function(event){
    var check = validateProduct();
    if(check==true){
        event.preventDefault();
    }
})
function keyupValidateInput(id_input, id_error, field_name){
    var valueInput = document.getElementById(id_input);
    var errorMessage = document.getElementById(id_error);
    if(valueInput.value != ''){
        errorMessage.innerHTML = '';
    }else{
        errorMessage.innerHTML = "*Vui lòng nhập " + field_name;
    }
}
