<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create Category</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="${base}/css/orders_admin.css">
    <script src="https://kit.fontawesome.com/fcf6782c6a.js" crossorigin="anonymous"></script>
    <link type="text/css" rel="stylesheet"  href="${pageContext.servletContext.contextPath}/css/simplePagination.css"/>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/admin/scss/css.jsp"></jsp:include>

</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/admin/layout/layoutSidenav.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <jsp:include page="/WEB-INF/views/admin/layout/headerNav.jsp"></jsp:include>

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <main>
                    <div class="container-fluid">
                        <h4 class="mt-4">Qu???n l??</h4>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">Qu???n l?? ????n h??ng</li>
                        </ol>
                    </div>
                    <div class="container-fluid order-admin">
                        <div class="main-order">
                            <div class="mytabs">
                                <input type="radio" id="tabtable" class="tab-table" name="mytabs" >
                                <label for="tabtable"><a href="${base}/admin/orders" style="text-decoration: none; padding: 10px; color: #000;">????n h??ng</a></label>
                                <div class="tab">

                                </div>

                                <input type="radio" id="tabdetail" class="tab-detail" name="mytabs" checked="checked">
                                <label for="tabdetail">Chi ti???t ????n h??ng</label>
                                <div class="tab">
                                    <form:form method="post" action="${base}/admin/update/order" modelAttribute="saleOrder">


                                    <div class="container-order-detail">
                                        <div class="title-order">????n h??ng</div>
                                        <div class="main-order-detail">
                                            <div class="address-company">
                                                C???a h??ng tai nghe gaming D????ng D????ng | Th???y T??n, Th??i Th???y, Th??i B??nh.
                                            </div>
                                            <div class="info-order-detail">
                                                <div class="info-user-bought">
                                                    <div class="row">

                                                        <div class="col-3">
                                                            <label class="form-label" for="codeorder">M?? ????n h??ng:</label>
                                                            <input disabled name="codeOrder" value="${saleOrder.codeOrder}" id="codeorder" class="input-form-order-detail iput-blod " style="color: #1890ff;">
<%--                                                            <form:input path="codeOrder" disabled="true" id="codeorder" class="input-form-order-detail iput-blod " style="color: #1890ff;"/>--%>
                                                            <form:hidden path="codeOrder" />
                                                        </div>
                                                        <div class="col-3">
                                                            <label class="form-label" for="nguoinhan">Ng?????i nh???n: </label>
                                                            <form:input path="customerName" id="nguoinhan" class="input-form-order-detail iput-blod "/>
                                                        </div>
                                                        <div class="col-3">
                                                            <label class="form-label" for="phonenumber">S??? ??i???n tho???i: </label>
                                                            <form:input path="customerPhone" id="phonenumber" class="input-form-order-detail iput-blod "/>
                                                        </div>
                                                        <div class="col-3">
                                                            <label class="form-label" for="paymentmethod">Ph????ng th???c thanh to??n:</label>
                                                            <c:choose>
                                                                <c:when test="${saleOrder.payments == 1}">
                                                                    <input disabled value="Tr???c ti???p" class="input-form-order-detail inp-payment" type="text" name="paymentmethod" id="paymentmethod">
                                                                </c:when>
                                                                <c:when test="${saleOrder.payments == 2}">
                                                                    <input disabled value="Zalo pay" class="input-form-order-detail inp-payment" type="text" name="paymentmethod" id="paymentmethod">
                                                                </c:when>
                                                            </c:choose>

                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col-3">
                                                            <label class="form-label" for="wards">Ph?????ng/X??: </label>
                                                            <select class="input-form-order-detail placeholder" name="wards" id="wards">
                                                                <option value disabled selected>Ph?????ng/X??</option>
                                                                <c:forEach items="${listWard}" var="ward">
                                                                    <option value="${ward.get('code')}">${ward.get('name')}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <input name="wardsname" id="name-wards" type="hidden">
                                                        </div>
                                                        <div class="col-3">
                                                            <label class="form-label" for="district">Qu???n/Huy???n: </label>
                                                            <select class="input-form-order-detail placeholder" name="district" id="district">
                                                                <option value disabled selected>Qu???n/Huy???n</option>
                                                                <c:forEach items="${listDistrict}" var="district">
                                                                    <option value="${district.get('code')}">${district.get('name')}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <input name="districtname" id="name-district" type="hidden">
                                                        </div>
                                                        <div class="col-3">
                                                            <label class="form-label" for="city">T???nh/Th??nh Ph???:</label>
                                                            <select class="input-form-order-detail placeholder" name="city" id="city">
                                                                <option value disabled selected>T???nh/Th??nh ph???</option>
                                                                <c:forEach items="${countries}" var="city">
                                                                    <option value="${city.get('code')}">${city.get('name')}</option>
                                                                </c:forEach>
                                                            </select>
                                                            <input name="cityname" id="name-city" type="hidden">
                                                        </div>
                                                        <div class="col-3">
                                                            <label class="form-label" for="soNha">?????a ch??? chi ti???t: </label>
                                                            <input value="${country.soNha}" name="sonha"  id="soNha" class="input-form-order-detail iput-blod "/>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-3">
                                                        <div class="col">
                                                            <label class="form-label" for="note">Ghi ch??: </label>
                                                            <textarea disabled class="form-control text-note" name="note" id="note" >${saleOrder.note}</textarea>
                                                        </div>
                                                    </div>

                                                    <div class="info-detail-other">
                                                        <div class="row">
                                                            <div class="col-9">
                                                                <div class="row">
                                                                    <div class="col-3">
                                                                        <label class="form-label">Ph????ng th???c v???n chuy???n: </label>
                                                                        <input disabled class="inpt-detail-none inp-shipping" value="Giao h??ng ti???t ki???m" type="text" name="shipping">
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <label class="form-label">T???ng ti???n: </label>

                                                                        <fmt:setLocale value="vi_VN" scope="session" />
                                                                        <fmt:formatNumber var="myNum" value="${saleOrder.total}" type="currency" />
                                                                        <input disabled class="inpt-detail-none inp-money" value="${myNum}" type="text" name="totalMoney">
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <label class="form-label">Tr???ng th??i thanh to??n: </label>
                                                                        <c:choose>
                                                                            <c:when test="${saleOrder.statusPayment == 0}">
                                                                                <input disabled class="inpt-detail-none inp-stutus-pay" value="Ch??a thanh to??n" type="text">
                                                                                <input value="0" type="hidden" id="paystatus" name="paystatus">
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <input style="color: red;" disabled class="inpt-detail-none inp-stutus-pay" value="???? thanh to??n" type="text">
                                                                                <input value="1" type="hidden" name="paystatus">
                                                                            </c:otherwise>
                                                                        </c:choose>

                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <label class="form-label">Ng??y ?????t h??ng: </label>
                                                                        <input disabled class="inpt-detail-none date-order" value="${saleOrder.createdDate}" type="text" name="ngaydat">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="row mt-4">
                                                            <div class="col-9">
                                                                <div class="row">
                                                                    <div class="col-3">
                                                                        <label class="form-label">X??c th???c ????n h??ng: </label>
                                                                        <c:if test="${saleOrder.statusOrder == 0}">
                                                                            <input disabled class="inpt-detail-none inp-accuracy" value="Ch??a x??c th???c" type="text" name="shipping">
                                                                        </c:if>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <label class="form-label">Tr???ng th??i ????n h??ng: </label>
                                                                        <c:choose>
                                                                            <c:when test="${saleOrder.statusOrder == 0}">
                                                                                <input disabled class="inpt-detail-none inp-trangthaidonhang" value="??ang ch??? x??c th???c" type="text" name="trangthaidonhang">
                                                                            </c:when>
                                                                            <c:when test="${saleOrder.statusOrder == 1}">
                                                                                <input disabled class="inpt-detail-none inp-trangthaidonhang" value="??ang giao h??ng" type="text" name="trangthaidonhang">
                                                                            </c:when>
                                                                            <c:when test="${saleOrder.statusOrder == 2}">
                                                                                <input disabled class="inpt-detail-none inp-trangthaidonhang" value="???? giao h??ng" type="text" name="trangthaidonhang">
                                                                            </c:when>
                                                                            <c:when test="${saleOrder.statusOrder == -1}">
                                                                                <input disabled class="inpt-detail-none inp-trangthaidonhang" value="???? h???y h??ng" type="text" name="trangthaidonhang">
                                                                            </c:when>
                                                                        </c:choose>

                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <label class="form-label">Ng??y ho??n th??nh: </label>
                                                                        <input disabled class="inpt-detail-none inp-authentication" value="${saleOrder.finishDate != null?saleOrder.finishDate:''}" type="text" name="authentication">
                                                                        <form:hidden path="finishDate"/>
                                                                    </div>
                                                                    <div class="col-sm-3">
                                                                        <label class="form-label">Email kh??ch h??ng: </label>
                                                                        <input disabled class="inpt-detail-none date-order" value="${saleOrder.customerEmail}" type="text" name="authentication">
                                                                        <form:hidden path="customerEmail"/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="order-detail-products">
                                            <c:forEach var="data" items="${saleOrder.saleOrderProducts}" varStatus="loop">
                                                <div class="row">
                                                    <div class="col-3">
                                                        <label class="form-label">T??n s???n ph???m:</label>
                                                        <input disabled class="inpt-detail-none form-control name-product" value="${data.products.title}" type="text" name="product">
                                                    </div>
                                                    <div class="col-3">
                                                        <label class="form-label">Gi?? b??n:</label>
                                                        <c:choose>
                                                            <c:when test="${data.products.priceSale != null}">
                                                                <fmt:setLocale value="vi_VN" scope="session" />
                                                                <fmt:formatNumber var="pricePro" value="${data.products.priceSale}" type="currency" />
                                                                <input disabled class="inpt-detail-none form-control inp-gia-ban" value="${pricePro}" type="text" name="product">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <fmt:setLocale value="vi_VN" scope="session" />
                                                                <fmt:formatNumber var="pricePro" value="${data.products.price}" type="currency" />
                                                                <input disabled class="inpt-detail-none form-control inp-gia-ban" value="${pricePro}" type="text" name="product">
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </div>
                                                    <div class="col-3 parent-quantity">
                                                        <label class="form-label">S??? l?????ng:</label>
                                                        <c:choose>
                                                            <c:when test="${saleOrder.statusOrder == 0}">
                                                                <input value="${data.quality}" data-id="${data.id}" type="number"  class="inpt-detail-none form-control inp-quantity "/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <input value="${data.quality}" disabled data-id="${data.id}" type="number"  class="inpt-detail-none form-control inp-quantity "/>
                                                            </c:otherwise>
                                                        </c:choose>


                                                    </div>
                                                    <div class="col-3">
                                                        <label class="form-label">????n v??? t??nh:</label>
                                                        <input disabled class="inpt-detail-none form-control inp-don-vi" value="Chi???c" type="text" name="product">
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <input type="hidden" value="" class="quantity-sale-product" name="quantityProduct">
                                            <form:input type="hidden" path="id"/>
                                            <form:input id="statusPayment" type="hidden" path="statusPayment"/>
                                            <form:input id="statusOrder" type="hidden" path="statusOrder"/>
                                            <form:input type="hidden" path="createdDate"/>
                                            <input type="hidden" name="userid" value="${saleOrder.users.id}">
                                            <form:input type="hidden" path="payments"/>
                                            <form:input type="hidden" path="customerAddress"/>
                                        </div>
                                        <div class="order-detail-action">
                                            <div class="action-exit" style="float: right;">
                                                <a href="${base}/admin/orders" class="btn-action">
                                                    <span>Quay l???i</span>
                                                </a>
                                            </div>
                                            <div class="action-okay" style="float: right;">
                                                <button type="submit" class="btn-action">
                                                    <span>X??c nh???n</span>
                                                </button>
                                            </div>
                                            <c:if test="${saleOrder.statusOrder == 1}">
                                            <div class="action-exit action-shipping" style="float: right;">
                                                <button type="button" class="btn-action" onclick="setIdOrder(${saleOrder.id})" data-bs-toggle="modal" data-bs-target="#modalShipping">
                                                    <span>X??c nh???n ???? giao h??ng</span>
                                                </button>
                                                <div class="modal fade" id="modalShipping" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">X??c nh???n ????n h??ng ???? giao th??nh c??ng</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                B???n c?? ch???c ????n h??ng n??y <span style="color: red;">???? giao th??nh c??ng</span> kh??ng !!
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">????ng</button>
                                                                <button type="button" id="dong-y-shipping" data-bs-dismiss="modal" class="btn btn-primary dong-y-shipping">?????ng ??</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </c:if>
                                        </div>
                                    </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>


                </main>
            </div>
        </div>
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2021</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
    </div>


</div>
<!-- Bootstrap core JavaScript-->
<script src="${base}/js/jquery.min.js"></script>
<script src = "${base}/vendor/jquery/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="${base}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${base}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${base}/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${base}/vendor/chart.js/Chart.min.js"></script>
<script src="${base}/js/jquery.simplePagination.js"></script>

<!-- Page level custom scripts -->
<script src="${base}/js/demo/chart-area-demo.js"></script>
<script src="${base}/js/demo/chart-pie-demo.js"></script>
<script src="${base}/js/ajax.js"></script>
<script src="${base}/js/order_admin.js"></script>
<script type="text/javascript">

    $('#dong-y-shipping').on('click',function (){
        var id = $(this).data('id');
        console.log("Id: "+id);
        jQuery.ajax({
            url: "/admin/update/order-ship/"+parseInt(id),
            type: "POST",
            contentType: "application/json",
            dataType: "json",
            success: function (jsonValue){
                $('.action-shipping').remove();
                $('.inp-trangthaidonhang').val("???? giao h??ng");
                $('#paystatus').val(1);
                $('.inp-stutus-pay').val("???? thanh to??n");
                $('.inp-stutus-pay').css("color","red");
                $('#statusPayment').val(1);
                $('#statusOrder').val(2);
            },
            error: function(jqXhr, textStatus, errorMessage) {
                if(jqXhr.status == 400){
                    alert("L???i thay ?????i tr???ng th??i");
                }
            }
        });
    })

    function setIdOrder(idOrder){
         $('#dong-y-shipping').attr('data-id',idOrder);

    }

    $('.inp-quantity').on('change',function (){
        var idSaleProduct = $(this).data('id');
        var parentD = $(this).parent('.parent-quantity');
        var quantity = parentD.find('.inp-quantity').val();
        var quantityOld = $('.quantity-sale-product').val();
        var quantityNew = idSaleProduct+"-"+quantity;
        if (quantityOld != '' && quantityOld != null){
            var check = false;
            var arr = quantityOld.split('-');
            $.each(arr,function (index,val){
                if (arr[index] == idSaleProduct){
                    check = true;
                    var subStr = arr[index]+"-"+arr[index+1];
                    var newInput = quantityOld.replace(subStr,quantityNew);
                    $('.quantity-sale-product').val(quantityOld.replace(subStr,quantityNew));
                }
            })
            if (check != true){
                $('.quantity-sale-product').val(quantityOld+"-"+quantityNew);
            }

        }else {
            $('.quantity-sale-product').val(idSaleProduct+"-"+quantity);
        }

    })

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
</body>

</html>