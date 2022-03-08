<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Order</title>
    <!-- pageContext.servletContext.contextPath chuyển thành BASE -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/send-order.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<section>
    <!-- Header -->
    <jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
    <!-- End Header -->
    <div class="container">
        <div class="form-main">
            <div class="row">
                <div class="col-sm-4">
                    <div class="img-cart-send">
                        <img src="${base}/images/tk-shopping-img.png" width="100%" alt="">
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="form-send-order">
                        <div class="title-send-order">
                            Cảm ơn bạn đã mua hàng tại King of computer
                        </div>
                        <div class="code-order">
                            <p class="title-code-order">
                                Mã số đơn hàng của bạn:
                            </p>
                            <div class="value-code-order">
                                #${codeOrder}
                            </div>
                        </div>
                        <p class="description-send-order">
                            Đơn hàng <span class="d-code">#${codeOrder}</span> của bạn đã được tiếp nhận. Thông tin chi tiết về đơn hàng đã được gửi qua email
                            <span class="d-email">buitrongduong@gmail.com</span>. Chúng tôi xin hân hạnh được phục vụ.
                        </p>
                        <div class="address-user-order">
                            <div class="name-user">
                                <p class="user-title">Khách hàng:</p>
                                <p class="user-value">${name}</p>
                            </div>
                            <div class="address-user">
                                <p class="user-title">Địa chỉ khách hàng:</p>
                                <p class="user-value">${address}</p>
                            </div>
                            <div class="phone-user">
                                <p class="user-title">Số điện thoại:</p>
                                <p class="user-value">${phone}</p>
                            </div>
                            <div class="email-user">
                                <p class="user-title">Email:</p>
                                <p class="user-value">${email}</p>
                            </div>
                        </div>
                        <div class="detail-total-cart">
                            <div class="title-total-cart">
                                Tổng tiền:
                            </div>
                            <div class="value-total-cart">
                                <fmt:setLocale value="vi_VN" scope="session"/>
                                <fmt:formatNumber value="${totalPrice}" type="currency"/>
                            </div>
                        </div>
                        <div class="continue-shopping">
                            <a href="#"> <i class="fas fa-shopping-cart"></i>  Tiếp tục mua sắm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

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
<script src="${base}/js/ajax.js"></script>
<script src="${base}/js/users.js"></script>
</body>
</html>
