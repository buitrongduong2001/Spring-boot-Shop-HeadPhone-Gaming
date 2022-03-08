function SaveProduct(){
    // javascript object.  data la du lieu ma day len action cua controller
    let data = {
        title: jQuery("#title").val(), // lay theo id
        status: jQuery("#status").val(), // lay theo id
        createdDate: jQuery("#createdDate").val(), // lay theo id
        avatar: jQuery("#avatar").val(), // lay theo id
        price: jQuery("#price").val(), // lay theo id
        priceSale: jQuery("#priceSale").val(),
        shortDescription: jQuery("#shortDescription").val(),
        detailDescription: jQuery("#detailDescription").val(),
        categories: jQuery("#categoryId").val(),

    };
    // $ === jQuery
    // json == javascript object
    jQuery.ajax({
        url:"/admin/ajax/product", //->action
        type: "post",
        contentType: "application/json",
        data: JSON.stringify(data),

        dataType: "json", // kieu du lieu tra ve tu controller la json
        success: function(jsonResult) {
            alert("Chuc mung! da luu thanh cong dia chi email " + jsonResult.message.title);
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
}

function deleteProduct(id){
    jQuery.ajax({
        url: "/admin/ajax/delete/product/"+id,
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            var idStop = $('.stop-product-text').data('id');
            if (parseInt(idStop) == jsonValue.id){
                $('.stop-product-text').html('<p class="stop-product-text" data-id = "'+jsonValue.id+ '" style = "color: #F70211; font-weight: 700;">Dừng hoạt động</p>');
            }
        },
        error: function(jqXhr, textStatus, errorMessage) {
            if(jqXhr.status == 400){
                alert("Sản phẩm này đã không hoạt động !!");
            }
        }
    });
}

function NewLetters(){
    let data = {
        name: jQuery("#name").val(),
        email: jQuery("#email").val(),
    }
    jQuery.ajax({
        url: "/user/letter/ajax",
        type: "POST",
        contentType: "application/json",
        //Convert data (javaScript Object) thành String json
        data: JSON.stringify(data),
        dataType: "JSON",
        success: function (jsonValue){
            // alert("Name: " + jsonValue.message.name);
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
}
$('.shopping-btn-minus').on('click',function (){
    var productId = $(this).data("product");
    var c = $(this).parent().find('#product-shopping-quantity').val();
    var total = $(this).parent().parent().find('.text-right').find('.subtotal');
    let formatter = new Intl.NumberFormat('vi-VN', { style: 'currency',currency:'VND'});
    var dem = 0;
    if (c > 1) {
        dem = parseInt(c) - 1;
        $(this).parent().find('#product-shopping-quantity').val(dem);
    }
    if (c <= 1) {
        dem = 1;
        $(this).parent().find('#product-shopping-quantity').val(dem)
    }
    let data = {
        quantity: dem,
        productId: productId,
    }

    jQuery.ajax({
        url: "/cart/ajax/updateQuantity",
        type: "POST",
        contentType: "application/json",
        //Convert data (javaScript Object) thành String json
        data: JSON.stringify(data),
        dataType: "JSON",
        success: function (jsonValue){
            let price = formatter.format(jsonValue.totalCart);
            let price2 = formatter.format(jsonValue.totalPrice);
            total.html(price2);
            $('#price-total').html(price)
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
})

$('.shopping-btn-plus').on('click',function (){
    var productId = $(this).data("product");
    var c = $(this).parent().find('#product-shopping-quantity').val();
    var total = $(this).parent().parent().find('.text-right').find('.subtotal');
    let formatter = new Intl.NumberFormat('vi-VN', { style: 'currency',currency:'VND'});
    var dem = 0;
    var quantityProduct = $(this).parent().find('#product-shopping-quantity').data("quantity");
    if (c >= 1) {
        dem = parseInt(c) + 1;
        if (dem >= parseInt(quantityProduct)){
            dem = parseInt(quantityProduct);
            $(this).parent().find('#product-shopping-quantity').val(parseInt(quantityProduct));
        }else {
            $(this).parent().find('#product-shopping-quantity').val(dem);
        }

    }
    let data = {
        quantity: dem,
        productId: productId,
    }

    jQuery.ajax({
        url: "/cart/ajax/updateQuantity",
        type: "POST",
        contentType: "application/json",
        //Convert data (javaScript Object) thành String json
        data: JSON.stringify(data),
        dataType: "JSON",
        success: function (jsonValue){
            let price = formatter.format(jsonValue.totalCart);
            let price2 = formatter.format(jsonValue.totalPrice);
            total.html(price2);
            $('#price-total').html(price)
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
})

$(".shopping-cart-action-remove").on("click",function(){
    var productId = $(this).data("product");
    var td = $(this).closest("tr");
    let formatter = new Intl.NumberFormat('vi-VN', { style: 'currency',currency:'VND'});

    let data = {
        productId: productId,
    }
    jQuery.ajax({
        url: "/cart/ajax/deleteItemCart",
        type: "POST",
        contentType: "application/json",
        //Convert data (javaScript Object) thành String json
        data: JSON.stringify(data),
        dataType: "JSON",
        success: function (jsonValue){
            let price = formatter.format(jsonValue.totalCart);
           td.remove();
            $('#price-total').html(price);
            $('#total-cart').html(jsonValue.totalItems);
        },
        error: function(jqXhr, textStatus, errorMessage) {
            alert(errorMessage);
        }
    });
});

function AddToCart(productId,quantityProduct){
    if (quantityProduct == 0){
        $('.alert-quantity').addClass("show");
        $('.alert-quantity').removeClass("hide");
        $('.alert-quantity').addClass("showAlert");
        setTimeout(function(){
            $('.alert-quantity').removeClass("show");
            $('.alert-quantity').addClass("hide");
        },5000);
    }else {
        var size = null;
        var nameSize = null;
        var quantity = 1;
        if ($('#product-detail-quantity').val() != null){
            quantity = $('#product-detail-quantity').val();
        }else {

        }
        size = $("input[name='attribute_size']:checked").closest('.attribute-swatch-item').data('id');
        nameSize = $("input[name='attribute_size']:checked").val();
        var qua = $("input[name='attribute_size']:checked").parent().parent().find('.quantity-store').data('quantity');
        let data = {
            productId: productId,
            quantity: quantity,
            productDetail: size,
            size: nameSize,
        }
        jQuery.ajax({
            url: "/cart/ajax/addToCart",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            dataType: "JSON",
            success: function (jsonValue){
                $("#total-cart").html(jsonValue.totalItem);
                $('.message-addCart').find('.inactive').removeClass('inactive');
                setTimeout(function (){
                    $('.message-addCart').find('.alert').addClass('inactive');
                },2000);
            },
            error: function(jqXhr, textStatus, errorMessage) {
                alert(errorMessage);
                console.log(errorMessage)
            }
        });
    }

}


//Quantity ở product detail
$('#add-to-cart-detail').on('click',function (){
    var quantity = $('#product-detail-quantity').val();

    var size = $('input[name="attribute_size"]:checked').val();
    var productId = $('#id-product-detail-hidden').val();

    let data = {
        productId: productId,
        size: size,
        quantity
    }

})
$('.table #btnDelete').on('click',function (event){
    event.preventDefault();
    var idd = $(this).attr('idd');
    $('#deleteModal').attr('onclick','deleteProduct('+idd+')');
    $('#myModal').modal();

})

$('input:radio[name = "attribute_size"]').change(function (){
    if ($(this).is(':checked')){
        let idProductDetail = $(this).data('detail');
        jQuery.ajax({
            url: "/ajax/product-detail?idDetail="+idProductDetail,
            type: "post",
            contentType: "application/json",
            dataType: "json",
            success: function (jsonValue){
                console.log(jsonValue.productDetail.quantityStore);
                if (jsonValue.productDetail.quantityStore <= 0){
                    $('.quantity-product-store .title-store').text('Size '+jsonValue.productDetail.size+' đang hết hàng vui lòng quay lại sau !! ')
                    $('#add-to-cart-detail').attr('disabled','disabled');
                }else {
                    $('.quantity-product-store .title-store').text('Đang có '+jsonValue.productDetail.quantityStore+' sản phẩm')
                    $('#add-to-cart-detail').removeAttr('disabled');
                }
            },
            error: function(jqXhr, textStatus, errorMessage) {
                alert(errorMessage);
            }
        });
    }
})
$('.dong-y-done').on('click',function (){
    var id = $(this).data('id');
    console.log("Id: "+id);
    jQuery.ajax({
        url: "/admin/update/status-done/order/"+parseInt(id),
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

