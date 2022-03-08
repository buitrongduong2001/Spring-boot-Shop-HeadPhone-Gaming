const icon = document.querySelector('.icon-search');
const search = document.querySelector('.search-input');
const list = document.querySelector('.t-popover__pane');
const mysearch = document.querySelector('#mysearch');
icon.onclick = function(){
    search.classList.toggle('active');

}
mysearch.onclick = function(){
    $('.t-popover__pane').addClass('active');
}

$(document).mouseup(function (e) {
    var container = $("#pane-list-search");
    // if the target of the click isn't the container nor a descendant of the container
    if (!container.is(e.target) && container.has(e.target).length === 0) {
        if($('.t-popover__pane').hasClass('active')){
            $('.t-popover__pane').removeClass('active');
        }
    }
});
$('#mysearch').on("input",function (){
    jQuery.ajax({
        url: "/ajax/search/customer?keyword="+$(this).val(),
        type: "POST",
        contentType: "application/json",
        dataType: "json",
        success: function (jsonValue){
            $('#list-product-search-header').find('a').remove();
            $('#quantity-pro-header').text('Tìm thấy ('+jsonValue.length+')');
            let formatter = new Intl.NumberFormat('vi-VN', { style: 'currency',currency:'VND'});

            for (let i = 0; i < jsonValue.length; i++) {
                var price = 0;
                if (jsonValue[i].priceSale == null){
                    price = jsonValue[i].price;
                }else {
                    price = jsonValue[i].priceSale;
                }
                $('#list-product-search-header').append(
                    '<a href="/detail-product/'+jsonValue[i].seo+'" class="section-product-option-item">\n' +
                    '                                            <div class="mr-3">\n' +
                    '                                                <img src="'+'/uploads/'+jsonValue[i].avatar+'  " width="50px" height="50px" alt="">\n' +
                    '                                            </div>\n' +
                    '                                            <div class="item_results space-y-1">\n' +
                    '                                                <span class="text-ui font-bold">'+jsonValue[i].title+'</span>\n' +
                    '                                                <div class="t-product-spec-text divide-disc">\n' +
                    '                                                    <span>Danh mục: </span>'+jsonValue[i].categories.name +
                    '                                                </div>\n' +
                    '                                                <div class="flex items-center space-x-2 text-ui">\n' +
                    '                                                    <span class="font-bold text-light-magenta">\n' + formatter.format(price)+
                    '                                                    </span>\n' +
                    '                                                </div>\n' +
                    '                                            </div>\n' +
                    '                                        </a>'
                );
            }

            console.log(jsonValue)
        },
        error: function(jqXhr, textStatus, errorMessage) {
            if(jqXhr.status == 400){
                alert("Sản phẩm này đã không hoạt động !!");
            }
        }
    });

})