<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 3/2/2022
  Time: 09:34
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Chi tiết đơn hàng</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/order_customers.css">
    <link rel="stylesheet" href="${base}/css/manager.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
          integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
<%--End Header--%>
<section class="order-detail-page">
    <div class="container">
        <article class="card">
            <header class="card-header-detail"> Đơn hàng / Chi tiết đơn hàng  </header>
            <div class="card-body">
                <h6>ID Đơn Hàng: <span style="color: red;">${saleOrders.codeOrder}</span></h6>
                <article class="card info">
                    <div class="card-body row">
                        <div class="col"> <strong>Thời gian đặt hàng::</strong> <br>
                            <span>${saleOrders.createdDate}</span>
                        </div>
                        <div class="col"> <strong>Thời gian ước tính:</strong> <br>
                            <span>${dateNew}</span>
                        </div>
                        <div class="col"> <strong>Trạng thái đơn hàng:</strong> <br>

                                <c:choose>
                                    <c:when test="${saleOrders.statusOrder == 0}">
                                         <span style="color: #2F76F0; font-size: 18px; font-weight: 600;"> Đang chờ xác nhận</span>
                                    </c:when>
                                    <c:when test="${saleOrders.statusOrder == 1}">
                                        <span style="color: #8ad21d; font-size: 18px; font-weight: 600;"> Đang giao</span>
                                    </c:when>
                                    <c:when test="${saleOrders.statusOrder == 2}">
                                        <span style="color: #1048bd; font-size: 18px; font-weight: 600;"> Đã giao</span>
                                    </c:when>
                                    <c:when test="${saleOrders.statusOrder == -1}">
                                        <span style="color: #d31929; font-size: 18px; font-weight: 600;"> Đã hủy đơn</span>
                                    </c:when>
                                </c:choose>

                        </div>
                        <div class="col"> <strong>Trạng thái thanh toán:</strong> <br>
                            <c:choose>
                                <c:when test="${saleOrders.statusPayment == 0}">
                                    <span>Chưa thanh toán</span>
                                </c:when>
                                <c:when test="${saleOrders.statusPayment == 1}">
                                    <span>Đã thanh toán</span>
                                </c:when>
                            </c:choose>

                        </div>
                    </div>
                </article>
                <div class="list-product-order row">
                    <div class="col-sm-7">
                        <table class="table table-order-detail">
                            <tbody>
                            <c:forEach items="${saleOrders.saleOrderProducts}" var="data">
                                <tr>
                                    <td>
                                        <div class="info-product">
                                            <div class="img-product">
                                                <img src="${base}/uploads/${data.products.avatar}" alt="" width="100%">
                                            </div>
                                            <div class="product-detail">
                                                <div class="name-product">
                                                    <b>${data.products.title}</b>
                                                </div>
                                                <div class="more-detail-product">
                                                    <div class="phan-loai">Phân loại: ${data.products.categories.name}</div>
                                                    <div class="quantity-detail">x${data.quality}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="price-order">
                                            <h4 class="price">
                                                <c:choose>
                                                    <c:when test="${data.products.priceSale != null}">
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${data.quality * data.products.priceSale}" type="currency"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${data.quality * data.products.price}" type="currency"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                    <div class="col-sm-5 info-order-detail">
                        <h3>Thông tin chi tiết đơn hàng</h3>
                        <div class="info-order">
                            <div class="info-total-price-order">
                                <div class="title-total-price-order">
                                    <span>Tổng tiền hàng</span>
                                </div>
                                <div class="price-total-price-order fee">
                                    <fmt:setLocale value="vi_VN" scope="session"/>
                                    <fmt:formatNumber value="${saleOrders.total}" type="currency"/>
                                </div>
                            </div>
                            <div class="info-transport-order">
                                <div class="title-transport-order">
                                    <span>Phí vận chuyển</span>
                                </div>
                                <div class="fee-transport-order fee">
                                    <span>0 đ</span>
                                </div>
                            </div>
                            <div class="info-voucher-order">
                                <div class="title-voucher-order">
                                    <span>Voucer từ shop</span>
                                </div>
                                <div class="fee-voucher-order fee">
                                    <span>0 đ</span>
                                </div>
                            </div>
                            <div class="info-total-price-order-detail">
                                <div class="title-total-price-order">
                                    <span>Tổng số tiền</span>
                                </div>
                                <div class="fee-total-price-order">
                                    <span>
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${saleOrders.total}" type="currency"/>
                                    </span>
                                </div>
                            </div>
                            <div class="info-payment-order">
                                <div class="title-payment-order">
                                    <i class="fas fa-money-check-alt"></i>
                                    <span> Phương thức thanh toán</span>
                                </div>
                                <div class="fee-payment-order">
                                    <span>
                                        <c:choose>
                                            <c:when test="${saleOrders.payments == 1}">
                                                Trực tiếp
                                            </c:when>
                                            <c:otherwise>
                                                Zalo Pay
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="track">
                    <c:choose>
                        <c:when test="${saleOrders.statusOrder >= 0}">
                            <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span
                                    class="text">Đã xác nhận đơn hàng</span> </div>
                        </c:when>
                        <c:otherwise>
                            <div class="step"> <span class="icon"> <i class="fa fa-check"></i> </span> <span
                                    class="text">Đã xác nhận đơn hàng</span> </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${saleOrders.statusOrder >= 1}">
                            <div class="step active"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text">
                                Đã giao cho đơn vị vận chuyển</span> </div>
                        </c:when>
                        <c:otherwise>
                            <div class="step"> <span class="icon"> <i class="fa fa-user"></i> </span> <span class="text">
                                Đã giao cho đơn vị vận chuyển</span> </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${saleOrders.statusOrder >= 1}">
                            <div class="step active"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text">
                            Đang vận chuyển </span> </div>
                        </c:when>
                        <c:otherwise>
                            <div class="step"> <span class="icon"> <i class="fa fa-truck"></i> </span> <span class="text">
                            Đang vận chuyển </span> </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${saleOrders.statusOrder >= 2}">
                            <div class="step active"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">
                            Đã giao hàng
                        </span> </div>
                        </c:when>
                        <c:otherwise>
                            <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">
                            Đã giao hàng
                        </span> </div>
                        </c:otherwise>
                    </c:choose>



                </div>

                <div class="address-status-order row">
                    <div class="col-sm-5">
                        <div class="adress-order">
                            <h4>Địa chỉ nhận hàng</h4>
                            <div class="name-user">
                                <span>${saleOrders.customerName}</span>
                            </div>
                            <div class="address-phone-number">
                                <p class="phone-number-order title-customer"><span>Phone:</span> ${saleOrders.customerPhone}</p>
                                <p class="email-customer-order title-customer"><span>Email:</span> ${saleOrders.customerEmail}</p>
                                <p class="address-user-order title-customer"><span>Địa chỉ:</span> ${saleOrders.customerAddress}</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7">
                        <h4>Trạng thái đơn hàng</h4>
                        <div class="status-order">
                            <div class="info-status">
                                <div class="date-status">
                                    10:56 05-10-2021
                                </div>
                                <div class="title-status">Giao hàng thành công</div>
                            </div>
                            <div class="info-status">
                                <div class="date-status">10:56 05-10-2021</div>
                                <div class="title-status">Đang giao hàng</div>
                            </div>
                            <div class="info-status">
                                <div class="date-status">10:56 05-10-2021</div>
                                <div class="title-status">Đơn hàng đã xuất khỏi kho</div>
                            </div>
                            <div class="info-status">
                                <div class="date-status">10:56 05-10-2021</div>
                                <div class="title-status">Lấy hàng thành công</div>
                            </div>
                            <div class="info-status">
                                <div class="date-status">10:56 05-10-2021</div>
                                <div class="title-status">Người gửi đang chuẩn bị hàng</div>
                            </div>

                        </div>
                    </div>
                </div>
                <hr> <a href="${base}/list-order" class="btn btn-warning-detail" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to
                orders</a>
            </div>
        </article>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="${base}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${base}/js/users.js"></script>
</body>
</html>
