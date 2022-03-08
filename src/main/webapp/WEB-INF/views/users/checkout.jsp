<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- pageContext.servletContext.contextPath chuyển thành BASE -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/checkout.css">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
<!-- End Header -->
<c:if test="${not empty errorAddress}">
    <div class="alert-size show showAlert">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Thông báo: Mỗi tài khoản chỉ tối đa 4 địa chỉ</span>
        <div class="close-btn">
            <span class="fas fa-times"></span>
        </div>
    </div>
</c:if>
<c:if test="${not empty errorCart}">
    <div class="alert-size show showAlert">
        <span class="fas fa-exclamation-circle"></span>
        <span class="msg">Thông báo: Chưa có sản phẩm trong giỏ hàng</span>
        <div class="close-btn">
            <span class="fas fa-times"></span>
        </div>
    </div>
</c:if>

<!-- Main -->
<section id="cart_items">
    <div class="container">
        <div class="breadcrumbs">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">Check out</li>
            </ol>
        </div>
        <h4>Đặt Hàng</h4>
        <form:form action="${base}/save-order" method="post">
        <div class="form-checkout">
            <!--Form checkout-->
            <div class="info-checkout">
                <div class="form-default-checkout">
                    <div class="title-list-address">
                        Địa chỉ nhận hàng
                    </div>
                    <c:choose>
                        <c:when test="${addressDefault != null}">
                            <input type="hidden" id="id-address-select" name="idAddress" value="${addressDefault.getId()}" >
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" id="id-address-select" name="idAddress" value="" >
                        </c:otherwise>
                    </c:choose>
                    <div class="list-address">
                        <c:forEach var="address" items="${listAddress}">
                            <c:choose>
                                <c:when test="${address.setAsDefault.booleanValue()}">
                                    <div class="item-add default active">
                                        <div class="radio-box">
                                            <div class="custom-radio-1-box">
                                                <div class="custom-radio-1"></div>
                                            </div>
                                        </div>
                                        <div class="name">
                                            <span class="name-user">${address.name}</span>
                                            <div class="name-note">Mặc định</div>
                                        </div>
                                        <p>Địa chỉ: ${address.address}</p>
                                        <p>Điện thoại: ${address.phone}</p>
                                        <p>Email: ${address.email}</p>
                                        <div class="list-active">
                                            <a href="javascript:;" data-id-address = ${address.id} class="select-address">Giao đến địa chỉ này</a>
                                            <a href="javascript:;" data-edit = ${address.id} class="edit-address">Sửa</a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="item-add" data-address="${address.id}">
                                        <div class="radio-box">
                                            <div class="custom-radio-1-box">
                                                <div class="custom-radio-1"></div>
                                            </div>
                                        </div>
                                        <div class="name">
                                            <span class="name-user">${address.name}</span>
                                            <div class="name-note">Mặc định</div>
                                        </div>
                                        <p>Địa chỉ: ${address.address}</p>
                                        <p>Điện thoại: ${address.phone}</p>
                                        <p>Email: ${address.email}</p>
                                        <div class="list-active">
                                            <a href="javascript:;" data-id-address = ${address.id} class="select-address">Giao đến địa chỉ này</a>
                                            <a href="javascript:;" data-edit = ${address.id} class="edit-address">Sửa</a>
                                            <a href="javascript:;" data-delete="${address.id}" class="delete-address">Xóa</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                    <c:if test="${listAddress.size() >= 4}">
                        <div class="add-new-address-event remove">
                            Bạn muốn giao hàng đến địa chỉ khác?<a href="javascript:;" id="action-add-new"> Thêm mới địa
                            chỉ</a>
                        </div>
                    </c:if>
                    <c:if test="${listAddress.size() < 4}">
                        <div class="add-new-address-event ">
                            Bạn muốn giao hàng đến địa chỉ khác?<a href="javascript:;" id="action-add-new"> Thêm mới địa
                            chỉ</a>
                        </div>
                    </c:if>

                    <div class="delivery-date-time-section" id="description_order">
                        <div class="input-wrapper-description">
                            <span class="input-wrapper__label">Để lại lời nhắn</span>
                            <textarea name="description" aria-label="delivery note" rows="3" style="width: 100%;"></textarea>
                        </div>
                    </div>
                    <!--Payment-->
                    <div class="payment-status">
                        <div class="title-form-payment">
                            <strong>Hình thức thanh toán</strong>
                        </div>
                        <div class="form-payment row">
                            <div class="col-sm-6 form-group">
                                <div class="radio-payment">
                                    <input checked type="radio" value="1" class="check-radio" name="payment">
                                    <span class="radiobtn"></span>
                                </div>
                                <div class="name-form-payment">
                                    Thanh toán tiền mặt khi nhận hàng (tiền mặt)
                                </div>
                            </div>
                            <div class="col-sm-6 form-group">
                                <div class="radio-payment">
                                    <input type="radio" value="2" class="check-radio" name="payment">
                                    <span class="radiobtn"></span>
                                </div>
                                <div class="name-form-payment">
                                    Thanh toán qua Zalo Pay
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End payment-->
                </div>
            </div>

            <!--Info Product-->
            <div class="info-product-order">
                <div class="checkout-sidebar">
                    <div class="quantity-order">
                        <div>Đơn hàng (3 sp)</div>
                        <a href="#" class="redirect-cart">
                            <strong>Về giỏ hàng</strong>
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </div>
                   <c:forEach items="${cartCheckout.cartItems}" var="item">
                       <div class="product-order">
                           <a href="#">
                               <div class="title-product-order">
                                   <div class="img-product-order">
                                       <img width="100%" src="${base}/uploads/${item.avatarProduct}" alt="">
                                   </div>
                                   <div class="info-title-product-order">
                                       ${item.productName}
                                       <p>x${item.quantity}</p>
                                   </div>
                               </div>
                           </a>
                           <div class="price-product-order">
                               <fmt:setLocale value="vi_VN" scope="session" />
                               <fmt:formatNumber value="${item.priceUnit * item.quantity}" type="currency" />
                           </div>
                       </div>
                   </c:forEach>


                    <%--<div class="info-total-price-order info">
                        <div class="title-total-price-order title">
                            Tạm tính
                        </div>
                        <div class="total-price-order">
                            67.990.000 đ
                        </div>
                    </div>--%>

                    <div class="info-fee-transport-order info">
                        <div class="title-fee-transport-order title">
                            Phí vận chuyển
                        </div>
                        <div class="fee-transport-order">
                            0 đ
                        </div>
                    </div>
                    <div class="info-voucher-order">
                        <div class="title-voucher-order title">
                            Mã giảm giá
                        </div>
                        <div class="form-voucher-order info">
                            <div class="input-voucher-order">
                                <input type="text" name="" id="" placeholder="Nhập vào nếu có">
                            </div>
                            <div class="voucher-order">
                                <button class="btn">Áp dụng</button>
                            </div>
                        </div>
                    </div>

                    <div class="info-price-sale-order info">
                        <div class="title-price-sale-order title">
                            Giảm giá
                        </div>
                        <div class="price-sale-order">
                            <p>-0 đ</p>
                        </div>
                    </div>

                    <div class="info-price-total-order info">
                        <div class="title-price-total-order title">
                            Tổng tiền
                        </div>
                        <div class="price-total-order">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${cartCheckout.totalPrice}" type="currency" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="btn-checkout-order">
                <button type="submit" id="submit-form-checkout" class="btn btn-checkout">Đặt Hàng</button>
                <a href="${base}/index" type="button" class="btn btn-continue">Tiếp tục mua hàng</a>
            </div>
        </div>
        </form:form>
    </div>
</section>
<div class="form-add-address hide" id="add-address">
    <div class="form-add-container">
        <form:form action="${base}/add-address"  method="post" modelAttribute="addressUser" id="form-address-checkout">
            <div class="header-form">
                <div class="title-header-form">Thêm mới địa chỉ</div>
            </div>
            <div class="body-form">
                <form:input path="id" id="id-address"  type="hidden" />
                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper-lable mini">Họ và Tên <em>*</em></span>
                        <form:input type="text" path="name" class="form-control lable-mini" id="full_name"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper-lable mini">Số điện thoại <em>*</em></span>
                        <form:input path="phone" type="text" class="form-control lable-mini" maxlength="12" minlength="10" id="phone_number"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper-lable mini">Email <em>*</em></span>
                        <form:input path="email" type="email" class="form-control lable-mini" id="email"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper__label select">Tỉnh / Thành Phố <em>(*)</em></span>
                        <div class="item-form-select">
                            <div class="select-style">
                                <select class="placeholder" name="city" id="city">
                                    <option value disabled selected>Tỉnh/Thành phố</option>
                                    <c:forEach items="${countries}" var="city">
                                        <option value="${city.get('code')}">${city.get('name')}</option>
                                    </c:forEach>
                                </select>
                                <input name="cityname" id="name-city" type="hidden">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper__label select">Quận / Huyện <em>(*)</em></span>
                        <div class="item-form-select">
                            <div class="select-style">
                                <select class="placeholder" name="district" id="district">
                                    <option value disabled selected>Quận / Huyện</option>
                                </select>
                                <input name="districtname" id="name-district" type="hidden">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper__label select">Xã / Phường <em>(*)</em></span>
                        <div class="item-form-select">
                            <div class="select-style">
                                <select class="placeholder" name="wards" id="wards">
                                    <option value disabled selected>Phường/Xã</option>
                                </select>
                                <input name="wardsname" id="name-wards" type="hidden">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-wrapper">
                        <span class="input-wrapper-lable mini">Số nhà/ Tên đường</span>
                        <input type="text" class="form-control lable-mini" name="addressDetail" id="addressDetail">
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-wrapper">
                        <div class="item-tk-ct item-tk-ct-checkbox">
                            <input class="inputCheckbox" id="checkBox-default" type="checkbox" name="setAsDefault">
                            <span>Đặt làm địa chỉ mặc định</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-form">
                <button type="submit" class="button button-add-new-address">Lưu Địa Chỉ</button>
                <a href="javascript:;" class="button btn-close-while close-modal">Quay Lại </a>
            </div>
        </form:form>
    </div>
</div>
<div class="popup-delate-address-cart">
    <div class="h-pop">
        <span class="txt">Xóa địa chỉ</span>
        <span class="h-pop-close"><i class="fas fa-times"></i></span>
    </div>
    <div class="ct-pop">
        <input type="hidden" id="js-delete-address-id">
        <p>Bạn có muốn xóa địa chỉ này khỏi sổ địa chỉ?</p>
        <div class="h-pop-action">
            <a href="javascript:;"  class="h-pop-not">Không</a>
            <a href="javascript:;"  class="h-pop-ok">Đồng ý</a>
        </div>
    </div>
</div>
<div class="bg-h-pop" ></div>
<!--End Main-->
<jsp:include page="/WEB-INF/views/users/layout/footer.jsp"></jsp:include>
<!-- End Footer-->
<div class="button-to-top">
    <a href="#" class="btn-go-to-top">
        <i class="fas fa-chevron-up"></i>
    </a>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="${base}/js/jquery.min.js"></script>
<script src = "${base}/vendor/jquery/jquery.js"></script>
<script src="${base}/js/checkout.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
<script src="${base}/js/users.js"></script>
<script>
    if ($('.alert-size').hasClass('showAlert')){
        setTimeout(function(){
            $('.alert-size').removeClass("show");
            $('.alert-size').addClass("hide");
        },3000);
    }

</script>

</body>
</html>
