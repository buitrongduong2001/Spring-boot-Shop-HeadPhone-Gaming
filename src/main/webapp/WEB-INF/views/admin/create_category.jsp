<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Create Category</title>
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
					<main class="container">
                    <section class="row" style="width: 1200px;">
                        <div class="col mt-4">
                            <form:form action="${base}/admin/store/category"  method="POST" modelAttribute="category" class="col-sm-12" id="form-1">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <h2>Add New Category</h2>
                                    </div>
                                    <div class="card-body"  >
                                        <div class="row" style="justify-content: center;">
                                            <div class="col-6">
                                                <form:hidden path="id"/>
                                                <div class="form-group">
                                                    <label for="name_category">Tên loại danh mục: </label>
                                                    <form:input path="name" type="text" class="form-control" name="name"
                                                           id="name_category"/>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <label >Chọn danh mục cha: </label>
                                                <form:select path="parent.id" class="form-control" id="categoryId">
                                                    <option value disabled selected>Chọn danh mục</option>
                                                    <form:options items="${categories}" itemLabel="name" itemValue="id"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label>Mô tả: </label>
                                                    <form:textarea path="description" type="text" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <button class="btn btn-success" type="reset">New</button>
                                        <button type="submit" class="btn btn-primary btn-submit-category">Save</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </section>
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
        <script src="${base}/js/scripts3.js"></script>
        <!-- Bootstrap core JavaScript-->
    <script src="${base}/vendor/jquery/jquery.min.js"></script>
    <script src="${base}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${base}/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${base}/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${base}/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${base}/js/demo/chart-area-demo.js"></script>
    <script src="${base}/js/demo/chart-pie-demo.js"></script>
    <script src="${base}/js/scripts3.js"></script>
</body>

</html>