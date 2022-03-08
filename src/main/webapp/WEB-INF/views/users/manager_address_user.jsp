<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <!-- pageContext.servletContext.contextPath chuyển thành BASE -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/manager.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
<!-- End Header -->

<main id="main" class="main-address">

    <c:choose>
        <c:when test="${not empty errorSizeManager}">
            <div class="alert-size show showAlert ">
                <span class="fas fa-exclamation-circle"></span>
                <span class="msg">Thông báo: Mỗi tài khoản chỉ tối đa 4 địa chỉ ${errorSizeManager}</span>
                <div class="close-btn">
                    <span class="fas fa-times"></span>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert-size">
                <span class="fas fa-exclamation-circle"></span>
                <span class="msg">Thông báo: Mỗi tài khoản chỉ tối đa 4 địa chỉ</span>
                <div class="close-btn">
                    <span class="fas fa-times"></span>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <section class="container clearfix">
        <div>
            <!--Title breadcrumb-->
            <div>
                <ul class="breadcrumb pb-8 flex items-center space-x-2">
                    <li class="breadcrumb-item home">
                        <a href="#" class="nuxt-link-active" itemprop="item">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item font-semibold text-sm active">
                        <a href="#" aria-current="page"
                           class="text-black flex items-center nuxt-link-exact-active nuxt-link-active"
                           itemprop="item">
                            Thông tin tài khoản
                        </a>
                    </li>
                </ul>
            </div>

            <section class="clearfix">
                <div class="account-information">
                    <!--Side bar manager-->
                    <div class="account-information_left">
                        <div class="info-user-header">
                            <img src="${base}/images/user-img-1.png" alt="taikhoan" width="100%" class="loading">
                            <div class="info-user-header-detail">
                                <span class="title-user">Tài khoản của</span>
                                <span class="name-user">${account.username}</span>
                            </div>
                        </div>
                        <ul class="menu-nav">
                            <li class="active">
                                <a href="${base}/manager-user" class="link-account">
                                    <i class="far fa-user-circle"></i>
                                    <span>Tài Khoản</span>
                                </a>
                            </li>
                            <li>
                                <a href="${base}/list-order" class="link-order">
                                    <i class="far fa-list-alt"></i>
                                    <span>Danh sách đơn hàng</span>
                                </a>
                            </li>
                            <li>
                                <a href="${base}/address-user" class="link-account">
                                    <i class="far fa-address-card"></i>
                                    <span>Quản lý địa chỉ</span>
                                </a>
                            </li>
                            <li class="">
                                <a href="#" class="link-change-password">
                                    <i class="fas fa-lock"></i>
                                    <span>Thay đổi mật khẩu</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="right-manager">
                        <div class="info-user">
                            <div class="header-info-user">
                                <h2 class="title-form">
                                    <span>Danh sách địa chỉ địa chỉ</span>
                                </h2>
                            </div>
                            <div class="manager-list-address">
                                <div class="add-new-address">
                                    <c:choose>
                                        <c:when test="${listAddress.data.size()  >= 4}">
                                            <a href="javascript:;" class="btn btn-add-new  btn-error-size">
                                                <i class="fas fa-plus"></i>
                                                <span>Thêm mới địa chỉ</span>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${base}/form-address" class="btn btn-add-new">
                                                <i class="fas fa-plus"></i>
                                                <span>Thêm mới địa chỉ</span>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <!--Danh sách địa chỉ-->
                                <c:choose>
                                    <c:when test="${listAddress.data.size() == 0}">
                                        <div class="info-address">
                                            <div class="address-none">Thông báo ! bạn chưa có địa chỉ nào</div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${listAddress.data}" var="item">
                                            <c:choose>
                                                <c:when test="${item.setAsDefault}">
                                                    <div class="info-address">
                                                        <div class="info-address-left">
                                                            <p class="address-name-user">
                                                                <span>Họ Và Tên</span>
                                                                    ${item.name}
                                                                <b class="mac-dinh">Mặc Định</b>
                                                            </p>
                                                            <p><span><i class="fas fa-phone"></i> Số Điện Thoại</span>${item.phone}</p>
                                                            <p><span><i class="fas fa-email"></i> Email</span>${item.email}</p>
                                                            <p><span><i class="fas fa-map-marker-alt"></i> Địa Chỉ</span>${item.address}</p>

                                                        </div>
                                                        <div class="info-address-right">
                                                            <a href="${base}/detail-address/${item.id}" class="address-edit">Chỉnh Sửa</a>
                                                            <a href="javascript:;"  class="address-set-default">Thiết Lập Mặc Định</a>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="info-address">
                                                        <div class="info-address-left">
                                                            <p class="address-name-user">
                                                                <span>Họ Và Tên</span>
                                                                    ${item.name}
                                                            </p>
                                                            <p><span><i class="fas fa-phone"></i> Số Điện Thoại</span>${item.phone}</p>
                                                            <p><span><i class="fas fa-email"></i> Email</span>${item.email}</p>
                                                            <p><span><i class="fas fa-map-marker-alt"></i> Địa Chỉ</span>${item.address}</p>

                                                        </div>
                                                        <div class="info-address-right">
                                                            <a href="${base}/detail-address/${item.id}" class="address-edit">Chỉnh Sửa</a>
                                                            <a href="javascript:;"  class="address-delete">Xóa</a>
                                                            <a href="javascript:;"  class="address-set-default">Thiết Lập Mặc Định</a>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>
    </section>
</main>
<div class="popup-delate-address-cart">
    <div class="h-pop">
        <span class="txt">Xóa địa chỉ</span>
        <span class="h-pop-close"><i class="fas fa-times"></i></span>
    </div>
    <div class="ct-pop">
        <input type="hidden" id="js-delete-address-id" value="1833">
        <p>Bạn có muốn xóa địa chỉ này khỏi danh sách địa chỉ?</p>
        <div class="h-pop-action">
            <a href="javascript:;" class="h-pop-not">Không</a>
            <a href="javascript:;" class="h-pop-ok">Đồng ý</a>
        </div>
    </div>
</div>
<div class="bg-h-pop"></div>


<!-- Footer-->
<jsp:include page="/WEB-INF/views/users/layout/footer.jsp"></jsp:include>
<!-- End Footer-->
<div class="button-to-top">
    <a href="#" class="btn-go-to-top">
        <i class="fas fa-chevron-up"></i>
    </a>
</div>
<script src="${base}/js/jquery.min.js"></script>
<script src = "${base}/vendor/jquery/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="${base}/js/users.js"></script>
<!-- owl carousel -->
<script src="${base}/js/ajax.js"></script>
</body>
<script src="${base}/js/script2.js"></script>
<script>
    if ($('.alert-size').hasClass('showAlert')){
        setTimeout(function(){
            $('.alert-size').removeClass("show");
            $('.alert-size').addClass("hide");
        },2300);
    }
    $('.btn-error-size').on('click',function (){
        if (!$('.alert-size').hasClass('showAlert')){
            $('.alert-size').addClass("showAlert");
            $('.alert-size').addClass("show");
            setTimeout(function(){
                $('.alert-size').removeClass("show");
                $('.alert-size').addClass("hide");
            },2300);
        }
    })

</script>
</html>