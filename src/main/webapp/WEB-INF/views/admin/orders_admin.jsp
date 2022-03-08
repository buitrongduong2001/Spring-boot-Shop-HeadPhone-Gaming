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
                        <h4 class="mt-4">Quản lý</h4>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item active">Quản lý đơn hàng</li>
                        </ol>
                    </div>
                    <div class="container-fluid order-admin">
                        <div class="main-order">
                            <div class="mytabs">
                                <input type="radio" id="tabtable" class="tab-table" name="mytabs" checked="checked">
                                <label for="tabtable">Đơn hàng</label>
                                <div class="tab">
                                    <div class="tabtable-header">
                                        <div class="form-tabtable-order">
                                            <div class="search-table-order">

                                                    <label for="searchorder">Tìm kiếm: </label>
                                                    <div class="search-order-input">
                                                        <form action="${base}/admin/orders" method="get">
                                                        <div class="search-input" style="width: 40%;">
                                                                <c:if test="${param.get('status') != null}">
                                                                    <input class="form-check-input" value="${param.get('status')}" id="status" type="hidden" name="status"/>
                                                                </c:if>
                                                                <c:if test="${param.get('page') != null}">
                                                                    <input class="form-check-input" value="${param.get('page')}" type="hidden" name="page"/>
                                                                </c:if>
                                                                <input class="ant-input" type="text" id="searchorder"
                                                                   placeholder="Tìm kiếm..." name="keyword">
                                                                <button style="border: none; background: none;" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                                                        </div>
                                                        </form>

                                                    </div>



                                            </div>
                                            <div class="status-order">
                                                <label for="statusorder">Trạng thái: </label>
                                                <div class="status-order-input">
                                                    <select name="status" id="statusorder" onchange="location = this.value;">
                                                        <option class="huy" value="${base}/admin/orders?status=-1">Hủy</option>
                                                        <option class="cho-xac-nhan" value="${base}/admin/orders?status=0" selected>Chờ xác nhận</option>
                                                        <option class="dang-giao" value="${base}/admin/orders?status=1">Đang giao</option>
                                                        <option class="da-giao" value="${base}/admin/orders?status=2">Đã giao</option>
                                                    </select>
                                                    <a id="link-status" disabled="true" class="link-status-op"></a>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Danh sách đơn hàng -->
                                        <div class="table-orders">
                                            <div class="ant-table-content">
                                                <table  style="table-layout: auto;">

                                                    <thead class="ant-table-thead ng-star-inserted">
                                                    <tr class="ant-table-row ng-star-inserted">
                                                        <th class="ant-table-cell">STT</th>
                                                        <th class="ant-table-cell">Mã đơn hàng</th>
                                                        <th class="ant-table-cell">Người mua</th>
                                                        <th class="ant-table-cell">Điện thoại</th>
                                                        <th class="ant-table-cell">Ngày mua</th>
                                                        <th class="ant-table-cell">Tổng tiền</th>
                                                        <th class="ant-table-cell">Trạng thái thanh toán</th>
                                                        <th class="ant-table-cell">Trạng thái</th>
                                                        <th class="ant-table-cell">Thao tác</th>
                                                    </tr>

                                                    </thead>
                                                    <tbody class="ant-table-tbody ng-star-inserted">
                                                    <c:forEach var="item" items="${listCho.data}" varStatus="loop">
                                                        <tr style="cursor: pointer;" class="ant-table-row ng-star-inserted data-order-row" data-order="${item.id}">
                                                            <td class="ant-table-cell">${loop.count}</td>
                                                            <td class="ant-table-cell">${item.codeOrder}</td>
                                                            <td class="ant-table-cell">${item.customerName}</td>
                                                            <td class="ant-table-cell">${item.customerPhone}</td>
                                                            <td class="ant-table-cell">${item.createdDate}</td>
                                                            <td style="color: rgb(223, 28, 28);" class="ant-table-cell">
                                                                <fmt:setLocale value="vi_VN" scope="session" />
                                                                <fmt:formatNumber value="${item.total}" type="currency" />
                                                            </td>
                                                            <td class="ant-table-cell">
                                                                <c:choose>
                                                                    <c:when test="${item.statusPayment == 0}">
                                                                        <label style="background-color: rgb(236, 240, 247); border-radius: 100px; padding: 2px 7.5px;">
                                                                            Chưa thanh toán
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${item.statusPayment == 1}">
                                                                        <label style="background-color: rgb(236, 240, 247); border-radius: 100px; padding: 2px 7.5px;">
                                                                            Đã thanh toán
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>

                                                            </td>
                                                            <td class="ant-table-cell" style="color: #52c41a; font-weight: 600;">
                                                                <c:choose>
                                                                    <c:when test="${item.statusOrder == 0}">
                                                                        Chờ xác thực
                                                                    </c:when>
                                                                    <c:when test="${item.statusOrder == 1}">
                                                                        <label class="ng-star-inserted" style="font-size: 12.5px;background-color: rgb(24, 144, 255); border-radius: 100px; color: rgb(255, 255, 255); padding: 2px 7.5px;">
                                                                            <i class="anticon anticon-inbox">
                                                                                <svg viewBox="0 0 1024 1024" focusable="false" fill="currentColor" width="1em" height="1em" data-icon="inbox" aria-hidden="true">
                                                                                <path d="M885.2 446.3l-.2-.8-112.2-285.1c-5-16.1-19.9-27.2-36.8-27.2H281.2c-17 0-32.1 11.3-36.9 27.6L139.4 443l-.3.7-.2.8c-1.3 4.9-1.7 9.9-1 14.8-.1 1.6-.2 3.2-.2 4.8V830a60.9 60.9 0 0060.8 60.8h627.2c33.5 0 60.8-27.3 60.9-60.8V464.1c0-1.3 0-2.6-.1-3.7.4-4.9 0-9.6-1.3-14.1zm-295.8-43l-.3 15.7c-.8 44.9-31.8 75.1-77.1 75.1-22.1 0-41.1-7.1-54.8-20.6S436 441.2 435.6 419l-.3-15.7H229.5L309 210h399.2l81.7 193.3H589.4zm-375 76.8h157.3c24.3 57.1 76 90.8 140.4 90.8 33.7 0 65-9.4 90.3-27.2 22.2-15.6 39.5-37.4 50.7-63.6h156.5V814H214.4V480.1z">
                                                                                </path>
                                                                            </svg></i> Đang giao hàng </label>
                                                                    </c:when>
                                                                    <c:when test="${item.statusOrder == 2}">
                                                                        <label class="ng-star-inserted" style="background-color: rgb(82, 196, 26); border-radius: 100px; color: rgb(255, 255, 255); padding: 2px 7.5px;">
                                                                            <i class="anticon anticon-check">
                                                                                <svg viewBox="64 64 896 896" focusable="false" fill="currentColor" width="1em" height="1em" data-icon="check" aria-hidden="true">
                                                                                    <path d="M912 190h-69.9c-9.8 0-19.1 4.5-25.1 12.2L404.7 724.5 207 474a32 32 0 00-25.1-12.2H112c-6.7 0-10.4 7.7-6.3 12.9l273.9 347c12.8 16.2 37.4 16.2 50.3 0l488.4-618.9c4.1-5.1.4-12.8-6.3-12.8z">
                                                                                    </path>
                                                                                </svg>
                                                                            </i>
                                                                            Đã giao hàng
                                                                        </label>
                                                                    </c:when>
                                                                    <c:when test="${item.statusOrder == -1}">
                                                                        <label class="ng-star-inserted" style="background-color: rgb(255, 77, 79); border-radius: 100px; color: rgb(255, 255, 255); padding: 2px 7.5px;">
                                                                            <i class="anticon anticon-close">
                                                                                <svg viewBox="64 64 896 896" focusable="false" fill="currentColor" width="1em" height="1em" data-icon="close" aria-hidden="true">
                                                                                    <path d="M563.8 512l262.5-312.9c4.4-5.2.7-13.1-6.1-13.1h-79.8c-4.7 0-9.2 2.1-12.3 5.7L511.6 449.8 295.1 191.7c-3-3.6-7.5-5.7-12.3-5.7H203c-6.8 0-10.5 7.9-6.1 13.1L459.4 512 196.9 824.9A7.95 7.95 0 00203 838h79.8c4.7 0 9.2-2.1 12.3-5.7l216.5-258.1 216.5 258.1c3 3.6 7.5 5.7 12.3 5.7h79.8c6.8 0 10.5-7.9 6.1-13.1L563.8 512z">
                                                                                    </path>
                                                                                </svg>
                                                                            </i>
                                                                            Đã hủy đơn
                                                                        </label>
                                                                    </c:when>
                                                                </c:choose>
                                                            </td>
                                                            <td class="ant-table-cell d-flex">
                                                                <c:choose>
                                                                    <c:when test="${item.statusOrder == 0}">
                                                                        <button class="btn-done" onclick="setIdOrder(${item.id})" id="btn-done" data-id="${item.id}" type="button" data-bs-toggle="modal" data-bs-target="#modalDone">
                                                                            <i class="fa-solid fa-check"></i>
                                                                        </button>
                                                                        <!-- Modal -->
                                                                        <div class="modal fade" id="modalDone" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title" id="exampleModalLabel">Xác nhận đơn hàng</h5>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Bạn có chắc muốn xác nhận đơn hàng này không ??
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                                        <button type="button" id="dong-y-done" data-bs-dismiss="modal" class="btn btn-primary dong-y-done">Đồng ý</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button class="btn-done" type="button" disabled>
                                                                            <i class="fa-solid fa-check"></i>
                                                                        </button>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <c:choose>
                                                                    <c:when test="${item.statusOrder == 0}">
                                                                        <button class="btn-delete" onclick="setIdOrderDe(${item.id})" id="btn-done" data-id="${item.id}" type="button" data-bs-toggle="modal" data-bs-target="#modalDelete">
                                                                            <i class="fa-solid fa-xmark"></i>
                                                                        </button>

                                                                        <!-- Modal -->
                                                                        <div class="modal fade" id="modalDelete" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                                                                            <div class="modal-dialog">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title" id="exampleModalLabel2">Hủy đơn hàng</h5>
                                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        Bạn có chắc muốn hủy đơn hàng này không!!
                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                                        <button type="button" id="dong-y-delete" data-bs-dismiss="modal" class="btn btn-primary dong-y-delete">Đồng ý</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button class="btn-delete" disabled>
                                                                            <i class="fa-solid fa-xmark"></i>
                                                                        </button>
                                                                    </c:otherwise>
                                                                </c:choose>


                                                                <a href="${base}/admin/detail/order/${item.id}" class="btn-detail"><i class="fa-solid fa-pen-to-square"></i></a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <form action="${base}/admin/orders" method="get" class="mt-5">
                                            <input type="hidden" name="page" id="page">
                                            <c:if test="${param.get('status') != null}">
                                                <input class="form-check-input" value="${param.get('status')}" id="status" type="hidden" name="status"/>
                                            </c:if>
                                            <c:if test="${param.get('keyword') != null}">
                                                <input class="form-check-input" value="${param.get('keyword')}" id="keyword" type="hidden" name="keyword"/>
                                            </c:if>
                                            <button style="display: none" type="submit" id="btnSearch"></button>
                                            <div class="row">
                                                <div class="col-12 d-flex justify-content-center">
                                                    <div id="paging-list-order"></div>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>

                                <input type="radio" disabled id="tabdetail" class="tab-detail" name="mytabs">
                                <label for="tabdetail">Chi tiết đơn hàng</label>
                                <div class="tab">
                                    Đây là thông tin chi tiết đơn hàng
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
    function setIdOrder(idOrder){
        var id = $('#dong-y-done').attr('data-id',idOrder);

    }
    function setIdOrderDe(idOrder){
        var id = $('#dong-y-delete').attr('data-id',idOrder);

    }
    $(document).ready(function() {
        $('#paging-list-order').pagination({
            currentPage: ${listCho.currentPage},
            items: ${listCho.totalItems},
            itemsOnPage: 2,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                $('#page').val(pageNumber);
                $('#btnSearch').trigger('click');
            },
        });
    });
</script>
<script>
    $(document).ready(function (){
        var  url = document.URL;
        var  url2 = new URL(url);
        var sta = url2.searchParams.get("status");
        if (parseInt(sta) == 0){
            $('.cho-xac-nhan').attr("selected",true);
        }else if (parseInt(sta) == 1){
            $('.dang-giao').attr("selected",true);
        }else if (parseInt(sta) == 2){
            $('.da-giao').attr("selected",true);
        }else if (parseInt(sta) == -1){
            $('.huy').attr("selected",true);
        }
    })

</script>
</body>

</html>