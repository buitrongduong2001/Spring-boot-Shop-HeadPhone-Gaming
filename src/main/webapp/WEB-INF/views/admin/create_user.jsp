<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Static Navigation - SB Admin</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/admin/scss/css.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/css/stylecheckbox.css">

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
                        <h1 class="mt-4">Create User</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Create User</li>
                        </ol>

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
                                    Create User
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive" style="width: 1000px;">
                                        <form class="col-sm-12" id="form-1" method="GET" >
                                            <div class="col-sm-12">
                                                <div class="row">
                                                    <div class="col-sm-6 form-group">
                                                        <label for="username" class="form-label">Username</label>
                                                        <input type="text"  placeholder="Enter Username Here.."
                                                            class="form-control user-username" id="username" name="username"
                                                            onkeyup="keyupValidateInput('username','error_username','Username')">
                                                        <span class="form-message " id="error_username" style="color: red;"></span>
                                                    </div>
                                                    <div class="col-sm-6 form-group">
                                                        <label for="password" class="form-label">Password</label>
                                                        <input type="text" placeholder="Enter Password Here.."
                                                            class="form-control user-password" id="password" name="password"
                                                            onkeyup="keyupValidateInput('password','error_password','Password')">
                                                        <span class="form-message" id="error_password" style="color: red;"></span>
                                                    </div>
                                                    <div class="col-sm-6 form-group">
                                                        <label for="fullname" class="form-label">Full Name</label>
                                                        <input type="text" placeholder="Enter Full Name Here.."
                                                            class="form-control user-fullname" id="fullname" name="fullname"
                                                            onkeyup="keyupValidateInput('fullname','error_fullname','Fullname')">
                                                        <span class="form-message" id="error_fullname" style="color: red;"></span>
                                                    </div>
                                                    <div class="col-sm-12 form-group">
                                                        <label for="email" class="form-label">Email</label>
                                                        <input type="text" placeholder="Enter Email Here.."
                                                            class="form-control user-email" id="email" name="email"
                                                            onkeyup="keyupValidateInput('email','error_email','Email')">
                                                        <span class="form-message" id="error_email" style="color: red;"></span>
                                                    </div>
                                                    <div class="col-sm-12 form-group">
                                                        <label for="photo" class="form-label">Avatar</label>
                                                        <input type="file" placeholder="Enter Photo Here.."
                                                            class="form-control user-image" id="photo" name="photo">
                                                        <img src="" alt="">
                                                        <span class="form-message" style="color: red;"></span>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 form-group ">
                                                    <label>Vai Trò</label>
                                                    <select class="form-control">
                                                        <option value="0">User</option>
                                                        <option value="1">Admin</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-6 form-group activated">
                                                    <label class="form-label">Activated</label>
                                                    <input type="checkbox" class="form-control swtich" name="activated">
                                                </div>
                                                <button type="submit"  class="btn btn-lg btn-info btn-submit-user">Submit</button>
                                            </div>
                                        </form>
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