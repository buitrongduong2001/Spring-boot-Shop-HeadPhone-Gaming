<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Quản Lý Category</title>

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
                        <div class="col-xl-1">
                            <div class="card mb-4">
                            </div>
                        </div>
                        <div class="col-xl-12 ">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                Data Table Category
                            </div>
                            <form class="form-inline" action="${base}/admin/list/categories" method="get" >
                            <div class="card-body">
                                <div class="input-group">
                                    <div class="form-outline">
                                        <input type="hidden" name="page" id="page">
                                        <input type="search" id="form1" name="keyword" class="form-control" />
                                    </div>
                                    <button style="height: 40px" type="submit" id="btnSearch"  class="btn btn-primary">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name Category</th>
                                                <th>Update</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name Category</th>
                                                <th>Update</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                        <c:forEach var="item" items="${catePage.data}">
                                            <tr>
                                                <td>${item.id}</td>
                                                <td>${item.name}</td>
                                                <td> <a type="button" class="btn btn-primary"
                                                        href="${base}/admin/edit/category/${item.id}">Update</a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                                <!-- Paging -->
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <div id="paging-list-cate"></div>
                                    </div>
                                </div>
                            </div>
                            </form>
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

    <jsp:include page="/WEB-INF/views/admin/scss/js.jsp"></jsp:include>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#paging-list-cate').pagination({
                currentPage: ${catePage.currentPage},
                items: ${catePage.totalItems},
                itemsOnPage: 5,
                cssStyle: 'light-theme',
                onPageClick: function(pageNumber, event) {
                    $('#page').val(pageNumber);
                    $('#btnSearch').trigger('click');
                },
            });
        });
    </script>


    </body>


</html>