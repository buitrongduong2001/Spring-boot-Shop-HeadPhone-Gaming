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

<main id="main" class="main-account">
    <section class="container clearfix">
        <div>
            <!--Title breadcrumb-->
            <div>
                <ul class="breadcrumb pb-8 flex items-center space-x-2">
                    <li class="breadcrumb-item home">
                        <a href="#" class="nuxt-link-active" itemprop="item">Home</a>
                    </li>
                    <li class="breadcrumb-item font-semibold text-sm active">
                        <a href="#" aria-current="page"
                           class="text-black flex items-center nuxt-link-exact-active nuxt-link-active"
                           itemprop="item">
                            User
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
                                <span class="name-user">${accountLogin.username}</span>
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
                            <form:form method="post" action="${base}/save-user" enctype="multipart/form-data" modelAttribute="accountLogin">
                            <div class="header-info-user">
                                <h2 class="title-form">
                                    <span>Thông tin tài khoản</span>
                                </h2>
                            </div>
                            <div class="form-user">
                                <div class="form-info-user">
                                    <form:hidden path="id" />
                                    <div class="item-form">
                                        <label>Họ và tên</label>
                                        <div class="item-form-input">
                                            <form:input path="fullName" type="text" name="" class="inputText" placeholder="Họ và tên"/>
                                        </div>
                                    </div>

                                    <div class="item-form">
                                        <label>Số điện thoại</label>
                                        <div class="item-form-input">
                                            <form:input path="phone" type="text" name="" class="inputText"
                                                   placeholder="Số điện thoại"/>
                                        </div>
                                    </div>

                                    <div class="item-form">
                                        <label>Email</label>
                                        <div class="item-form-input">
                                            <form:input path="email"  type="email" name="" class="inputText"
                                                   placeholder="Địa chỉ email"/>
                                        </div>
                                    </div>
                                    <div class="item-form">
                                        <label>Giới tính</label>
                                        <div class="item-form-radio">
                                            <label for="gender-male">
                                                <form:radiobutton path="sex" value="true" id="gender-male" class="check-radio"/>
                                                <span class="radiobtn"></span>
                                                Nam
                                            </label>
                                            <label for="gender-female">
                                                <form:radiobutton path="sex" value="false" id="gender-female" class="check-radio"/>
                                                <span class="radiobtn"></span>
                                                Nữ
                                            </label>
                                        </div>
                                    </div>

                                    <div class="item-form">
                                        <label>Ngày sinh</label>
                                        <div class="item-form-select">
                                            <div class="select-style">
                                                <select name="dayBird" class="placeholder" id="day">
                                                    <option value disabled selected>Ngày</option>
                                                </select>
                                            </div>
                                            <div class="select-style">
                                                <select name="monthBird" class="placeholder" id="month">
                                                    <option value disabled selected>Tháng</option>
                                                </select>
                                            </div>

                                            <div class="select-style">
                                                <select name="yearBird" class="placeholder" id="years">
                                                    <option value disabled selected>Năm</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-img-user">
                                    <div class="parent-img-user">
                                        <div class="info-img-user">
                                            <div id="avatar-user" class="img-user" style="background-image: url(${base}/uploads/${accountLogin.imgUser});">
                                            </div>
                                        </div>
                                        <input type="file" class="input-file-img" name="fileImageUser" id="image-user" accept=".jpg,.jpeg,.png">
                                        <button type="button" id="btn-select-file" class="btn btn-select-img">Chọn
                                            ảnh</button>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-submit-form">
                                <button class="btn btn-submit">Lưu thông tin</button>
                            </div>
                            </form:form>
                        </div>
                    </div>


                </div>
            </section>
        </div>
    </section>
</main>





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
<script>
    $(document).ready(function () {
        let qntYears = 60;
        let selectMonth = $('#month');
        let selectDay = $('#day');
        let selectYear = $('#years');
        let currentYear = new Date().getFullYear();
        let dayBird = '${dayBird}';
        let monthBird = '${monthBird}';
        let yearBird = '${yearBird}';

        for (var y = 0; y < qntYears; y++) {
            let date = new Date(currentYear);
            let yearElem = document.createElement("option");
            if (currentYear == yearBird){
                yearElem.setAttribute("selected","selected");
            }
            yearElem.value = currentYear
            yearElem.textContent = currentYear;
            selectYear.append(yearElem);
            currentYear--;
        }
        for (var m = 1; m <= 12; m++) {
            let month = m;
            let monthElem = document.createElement("option");
            if (m == monthBird){
                monthElem.setAttribute("selected","selected");
            }
            monthElem.value = m;
            monthElem.textContent = m;
            selectMonth.append(monthElem);
        }


        for (var d = 1; d <= 31; d++) {
            let day = d;
            let dayElem = document.createElement("option");
            if(d == dayBird){
                dayElem.setAttribute("selected","selected");
            }
            dayElem.value = d;
            dayElem.textContent = d;
            selectDay.append(dayElem);
        }
    })

</script>
<script >
    document.getElementById('btn-select-file').onclick = function () {
        document.getElementById('image-user').click();
    };
    $('input[type=file]').change(function (e) {
        var image = URL.createObjectURL(e.target.files[0]);
        $('#avatar-user').css('background-image','url('+image+')');
    });

</script>
</body>
<script src="${base}/js/script2.js"></script>

</html>