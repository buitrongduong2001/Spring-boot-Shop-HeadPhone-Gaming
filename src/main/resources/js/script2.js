$("#btn_show_menu").on("click", function () {
    $(".menu").css("margin-left", '0');
});
$(".btn-hide-sidebar").on("click", function () {
    $(".menu").css("margin-left", '-700px');
});


$("#detail-btn-minus").on("click", function () {
    var c = $("#product-detail-quantity").val();
    if (c > 1) {
        var dem = parseInt(c) - 1;
        $("#product-detail-quantity").val(parseInt(dem));
    }
});

$("#detail-btn-plus").on("click", function () {
    var c = $("#product-detail-quantity").val();
    var quantityProduct = $('#product-detail-quantity').data("quantity");
    if (c > 0) {
        var dem = parseInt(c) + 1;
        if (dem >= parseInt(quantityProduct)){
            $("#product-detail-quantity").val(parseInt(quantityProduct));
        }else {
            $("#product-detail-quantity").val(parseInt(dem));
        }

    }
});

$(".small-img-select").on("click", function () {
    var att = $(this).attr('src');
    $("#product-detail-img").find("img").attr('src', att);
})