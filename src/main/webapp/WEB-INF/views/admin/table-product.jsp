<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!DOCTYPE html >
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Quản Lý Sản Phẩm</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css"
    />
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

                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table mr-1"></i>
                                    Data Table Products
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table id="example" class="table table-bordered" width="100%">
                                            <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Price Sale</th>
                                                <th>Trạng Thái(Status)</th>
                                                <th>Create Date</th>
                                                <th>Avatar</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                            </tr>
                                            </thead>
                                            <tfoot>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th>Title</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Price Sale</th>
                                                <th>Trạng Thái(Status)</th>
                                                <th>Create Date</th>
                                                <th>Avatar</th>
                                                <th>Edit</th>
                                                <th>Update</th>
                                            </tr>
                                            </tfoot>
                                            <tbody>
                                            <c:forEach items="${listProduct}" var="item" varStatus="loop">
                                                <tr>
                                                    <th scope="row">${loop.count}</th>
                                                    <td>${item.title}</td>
                                                    <td>${item.categories.name}</td>
                                                    <td>
                                                        <fmt:setLocale value="vi_VN" scope="session" />
                                                        <fmt:formatNumber value="${item.price}" type="currency" />

                                                    </td>
                                                    <td>
                                                        <fmt:setLocale value="vi_VN" scope="session" />
                                                        <fmt:formatNumber value="${item.priceSale}" type="currency" />
                                                    </td>


                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${item.status == true}">
                                                                <p class="stop-product-text" data-id="${item.id}" style="color: #0d6efd; font-weight: 700;">Hoạt Động</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p class="stop-product-text" data-id="${item.id}" style="color: #F70211; font-weight: 700;">Dừng hoạt động</p>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </td>
                                                    <td>${item.createdDate}</td>
                                                    <td><img src="${base}/uploads/${item.avatar}" width="90%"
                                                             class="rounded mx-auto d-block"></td>
                                                    <td><a type="button" class="btn btn-info"
                                                           href="${pageContext.servletContext.contextPath}/admin/edit/product/${item.id}">Edit</a>
                                                    </td>
                                                    <td>
                                                        <button type="button" idd = "${item.id}" onclick="deleteProduct($(item.id))"  id="btnDelete" class="btn btn-danger" >Delete</button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="myModal">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                            <span aria-hidden="true">&times;</span>
                                                                        </button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Bạn chắc không ??
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button onclick="" type="button" id="deleteModal" data-dismiss="modal"  class="btn btn-danger">Save changes</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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
<script src="  https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src=" https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
<script src="${base}/js/ajax.js"></script>
<script>
    $(document).ready(function () {
        $("#example").DataTable();
    });
</script>
<script src="${pageContext.servletContext.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.servletContext.contextPath}/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${pageContext.servletContext.contextPath}/vendor/chart.js/Chart.min.js"></script>


</body>

</html>
