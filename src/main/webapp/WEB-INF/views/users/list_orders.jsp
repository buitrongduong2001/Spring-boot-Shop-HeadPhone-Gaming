<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2/25/2022
  Time: 15:50
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
    <title>Danh sách đơn hàng</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/order_customers.css">
    <link rel="stylesheet" href="${base}/css/manager.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet"  href="${pageContext.servletContext.contextPath}/css/simplePagination.css"/>
</head>
<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
<%--End Header--%>
<main id="main" class="main-order">
    <section class="container clearfix">
        <div>
            <div>
                <ul class="breadcrumb pb-8 flex items-center space-x-2">
                    <li class="breadcrumb-item home">
                        <a href="#" class="nuxt-link-active" itemprop="item">Trang chủ</a>
                    </li>
                    <li class="breadcrumb-item font-semibold text-sm active">
                        <a href="#" aria-current="page" class="text-black flex items-center nuxt-link-exact-active nuxt-link-active" itemprop="item">
                            Đơn hàng
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
                            <li >
                                <a href="${base}/manager-user" class="link-account">
                                    <i class="far fa-user-circle"></i>
                                    <span>Tài Khoản</span>
                                </a>
                            </li>
                            <li class="active">
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

                    <div class="order-user-history">
                        <div class="history-order">
                            <div class="header-history-order">
                                <h2 class="title_cate">
                                    <span>Đơn hàng của tôi</span>
                                </h2>
                            </div>
                            <div class="list-status">
                                <c:choose>
                                    <c:when test="${(param.status==null)}">
                                        <a href="${base}/list-order" class="active">Tất cả</a>
                                    </c:when>
                                    <c:when test="${(param.status!=null)}">
                                        <a href="${base}/list-order">Tất cả</a>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${param.get('status')!=0}">
                                        <a href="${base}/list-order?status=0" >Chờ xác nhận</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${base}/list-order?status=0" class="active">Chờ xác nhận</a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${param.get('status') != 1}">
                                        <a href="${base}/list-order?status=1">Đang giao</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${base}/list-order?status=1" class="active">Đang giao</a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${param.get('status')!=2}">
                                        <a href="${base}/list-order?status=2">Đã giao</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${base}/list-order?status=2" class="active">Đã giao</a>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${param.get('status')!=-1}">
                                        <a href="${base}/list-order?status=-1">Đã hủy</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${base}/list-order?status=-1" class="active">Đã hủy</a>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="title-total-order">
                                <p>Tổng giá trị <strong>20.000.000 đ/2</strong> đơn hàng</p>
                            </div>

                            <div class="table-history-order">
                                <table class="table table-default">
                                    <thead>
                                    <tr>
                                        <th><strong>Đơn hàng</strong></th>
                                        <th><strong>Thời gian mua</strong></th>
                                        <th><strong>Sản phẩm</strong></th>
                                        <c:choose>
                                            <c:when test="${param.get('status')==null}">
                                                <th class="th-status"><span class="order-stt">Tất cả</span></th>
                                            </c:when>
                                            <c:when test="${param.get('status')==0}">
                                                <th class="th-status"><span class="order-stt">Chờ xác nhận</span></th>
                                            </c:when>
                                            <c:when test="${param.get('status')==1}">
                                                <th class="th-status"><span class="order-stt">Đang giao</span></th>
                                            </c:when>
                                            <c:when test="${param.get('status')==2}">
                                                <th class="th-status"><span class="order-stt">Đã giao</span></th>
                                            </c:when>
                                            <c:when test="${param.get('status')==-1}">
                                                <th class="th-status"><span class="order-stt">Đã hủy hàng</span></th>
                                            </c:when>
                                        </c:choose>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!--Product number one-->
                                    <c:forEach items="${listOrder.data}" var="data">
                                        <tr  class="data-order-row" data-order="${data.id}">
                                            <td>${data.codeOrder}</td>
                                            <td>${data.createdDate}</td>
                                            <td colspan="2">
                                                <c:forEach var="item" items="${data.saleOrderProducts}">
                                                <div class="product-my-order">
                                                    <div class="info-product">
                                                        <div class="img-product">
                                                            <img src="${base}/uploads/${item.products.avatar}" alt="" width="100%">
                                                        </div>
                                                        <div class="product-detail">
                                                            <div class="name-product">
                                                                <b>${item.products.title}</b>
                                                            </div>
                                                            <div class="more-detail-product">
                                                                <div class="phan-loai">Phân loại: ${item.products.categories.name}</div>
                                                                <div class="quantity-detail">x${item.quality}</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <span class="pro-price">
                                                        <c:choose>
                                                            <c:when test="${item.products.priceSale != null}">
                                                                <fmt:setLocale value="vi_VN" scope="session"/>
                                                                <fmt:formatNumber value="${item.quality * item.products.priceSale}" type="currency"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:setLocale value="vi_VN" scope="session"/>
                                                                <fmt:formatNumber value="${item.quality * item.products.price}" type="currency"/>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </span>
                                                </div>
                                                </c:forEach>
                                            </td>
                                        </tr>

                                        <tr class="data-order-row" data-order="${data.id}">
                                            <td colspan="4">
                                                <div class="total-price-order">
                                                    Tổng tiền: <span><fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${data.total}" type="currency"/></span>
                                                </div>
                                                <div class="group-btn-order">
                                                    <c:choose>
                                                        <c:when test="${data.statusOrder == 0}">
                                                            <a class="btn btn-cancel-order" onclick="setIdOrder(${data.id})" data-id="${data.id}" id="cancel-order" data-bs-toggle="modal" data-bs-target="#modalCancel" type="button" href="javascript:;">Hủy hàng</a>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="modalCancel" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel2">Hủy đơn hàng</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Bạn có chắc muốn <span style="color: red;">hủy đơn hàng</span> này không!!
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                            <button type="button" id="dong-y-cancel" data-bs-dismiss="modal" class="btn btn-primary dong-y-cancel">Đồng ý</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <a class="btn btn-order-detail" type="button" href="#">Chi tiết đơn hàng</a>
                                                        </c:when>
                                                        <c:when test="${data.statusOrder == -1 || data.statusOrder == 2}">
                                                            <form action="${base}/by-again/${data.id}" method="post">
                                                                <button class=" btn-buy-again" type="submit">Mua lại</button>
                                                            </form>

                                                            <a class="btn btn-order-detail" type="button" href="#">Chi tiết đơn hàng</a>
                                                        </c:when>

                                                        <c:when test="${data.statusOrder == 1}">
                                                            <a class="btn btn-order-detail" type="button" href="#">Chi tiết đơn hàng</a>
                                                        </c:when>
                                                    </c:choose>




                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>

                                </table>
                            </div>
                            <form method="get" action="${base}/list-order">
                                <input type="hidden" name="page" id="page">
                                <input type="hidden" name="status" value="${param.get('status') != null?param.get('status'):''}">
                                <button style="display: none" type="submit" id="btnSearch"></button>
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <div id="paging-list-order"></div>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>
</main>
<div id="myModal" class="modal-order">
    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">Thông báo !! <span class="close">&times;</span></div>
        <p>Do đơn hàng này đã được <span class="thanh-toan">Thanh toán</span> vì vậy vui lòng cho chúng tôi theo số điện thoại
            <span class="phone">0362015907</span> để được giải quyết !! CẢM ƠN !</p>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="${base}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${base}/vendor/chart.js/Chart.min.js"></script>
<script src="${base}/js/jquery.simplePagination.js"></script>
<script src="${base}/js/users.js"></script>
<!-- owl carousel -->
<script src="${base}/js/ajax.js"></script>
<script>
    function setIdOrder(idOrder){
        $('#dong-y-cancel').attr('data-id',idOrder);
    }
    $(document).ready(function() {
        $('#paging-list-order').pagination({
            currentPage: ${listOrder.currentPage},
            items: ${listOrder.totalItems},
            itemsOnPage: 2,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                $('#page').val(pageNumber);
                $('#btnSearch').trigger('click');
            },
        });
    });



    $('.dong-y-cancel').on('click',function (){
        var id = $(this).data('id');
        console.log("Id: "+id);
        jQuery.ajax({
            url: "/update/remove/order/"+parseInt(id),
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
</script>

</body>
</html>
