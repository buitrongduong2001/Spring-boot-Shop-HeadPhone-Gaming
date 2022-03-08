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

<main id="main" class="main-order">
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
                                <span class="name-user">${account.fullName}</span>
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
                                <a href="#" class="link-order">
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
                        <form:form modelAttribute="addressUser" action="${base}/add-address-form">
                            <div class="info-user">
                                <div class="header-info-user">
                                    <h2 class="title-form">
                                        <span>Chỉnh sửa địa chỉ</span>
                                    </h2>
                                </div>
                                <div class="form-manager-address">
                                    <form:hidden path="id"/>
                                    <div class="item-form">
                                        <label>Họ và tên</label>
                                        <div class="item-form-input">
                                            <form:input type="text" placeholder="Họ và Tên" path="name" class="inputText" id="full_name"/>
                                        </div>
                                    </div>

                                    <div class="item-form">
                                        <label>Số điện thoại</label>
                                        <div class="item-form-input">
                                            <form:input path="phone" placeholder="Số điện thoại" type="text" class="inputText" maxlength="12" minlength="10" id="phone_number"/>
                                        </div>
                                    </div>
                                    <div class="item-form">
                                        <label>Email</label>
                                        <div class="item-form-input">
                                            <form:input path="email" placeholder="Email" autocomplete="Email" type="email" class="inputText" id="email"/>
                                        </div>
                                    </div>
                                    <div class="item-form number-home">
                                        <label>Đường / Số nhà</label>
                                        <div class="item-form-input">
                                            <input value="${country.soNha}" type="text" class="inputText" placeholder="Số nhà" name="addressDetail" id="addressDetail"/>
                                        </div>
                                    </div>
                                    <div class="item-form">
                                        <label>Tỉnh / Thành phố</label>
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
                                    <div class="item-form">
                                        <label>Quận / Huyện</label>
                                        <div class="item-form-select">
                                            <div class="select-style">

                                                <select class="placeholder" name="district" id="district">
                                                    <option value disabled selected>Quận/Huyện</option>
                                                    <c:forEach items="${listDistrict}" var="district">
                                                        <option value="${district.get('code')}">${district.get('name')}</option>
                                                    </c:forEach>
                                                </select>
                                                <input name="districtname" id="name-district" type="hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-form">
                                        <label>Phường / Xã</label>
                                        <div class="item-form-select">
                                            <div class="select-style">
                                                <select class="placeholder" name="wards" id="wards">
                                                    <option value disabled selected>Phường/Xã</option>
                                                    <c:forEach items="${listWard}" var="ward">
                                                        <option value="${ward.get('code')}">${ward.get('name')}</option>
                                                    </c:forEach>
                                                </select>
                                                <input name="wardsname" id="name-wards" type="hidden">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-form item-checkbox">
                                        <label></label>
                                        <lable class="lable-check-default">
                                            <c:choose>
                                                <c:when test="${addressUser.setAsDefault == true}">
                                                    <input class="checkbox-default" checked id="checkBox-default" type="checkbox" name="setAsDefault">
                                                </c:when>
                                                <c:otherwise>
                                                    <input class="checkbox-default" id="checkBox-default" type="checkbox" name="setAsDefault">
                                                </c:otherwise>
                                            </c:choose>

                                            <span class="theme-checkbox"></span>
                                            <span>Đặt làm địa chỉ mặt định</span>
                                        </lable>
                                    </div>

                                </div>
                                <div class="btn-submit-form">
                                    <button class="btn btn-submit">Lưu thông tin</button>
                                </div>
                            </div>
                        </form:form>

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
<!-- owl carousel -->
<script src="${base}/js/manager.js"></script>
<script>
    $('#city option').each(function (){
        if ($(this).val() == ${country.city}){
            $(this).attr("selected","selected");
            $('#name-city').val('${country.nameCity}');
        }
    })

    $('#district option').each(function (){
        if ($(this).val() ==  ${country.district}){
            $(this).attr("selected","selected");
            $('#name-district').val('${country.nameDistrict}');

        }
    })
    $('#wards option').each(function (){
        if ($(this).val() ==  ${country.ward}){
            $(this).attr("selected","selected");
            $('#name-wards').val('${country.nameWard}');
        }
    })
</script>
<script src="${base}/js/users.js"></script>
</body>


</html>