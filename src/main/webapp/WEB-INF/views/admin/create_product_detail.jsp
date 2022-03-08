<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Create Product Detail</title>
    <script
            src="https://code.jquery.com/jquery-3.5.1.min.js"
            crossorigin="anonymous"
    ></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"
    ></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"
    ></script>

    <link
            href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/admin/scss/css.jsp"></jsp:include>

</head>
<body id="page-top">

<div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/admin/layout/layoutSidenav.jsp"></jsp:include>

    <div id="content-wrapper" class="d-flex flex-column">
        <jsp:include page="/WEB-INF/views/admin/layout/headerNav.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">
            <main class="container">
                <section class="row" style="width: 100%">
                    <div class="col mt-4">
                        <form:form action="${base}/admin/store/product-detail" method="POST" class="col-sm-12"
                                   id="form-1" modelAttribute="productDetail">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <h2>Add New Product Detail</h2>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-6">
                                            <!--Input title product detail-->
                                            <form:hidden path="id"/>
                                            <!--Input quantity-->
                                            <div class="form-group">
                                                <label for="quantity-product-detail">Quantity Product: </label>
                                                <form:input path="quantityStore" type="text" class="form-control" name="quantity" id="quantity-product-detail"
                                                            aria-describedby="quantity-product-detail" placeholder="Quantity product is number"/>
                                            </div>

                                            <!--Select product-->
                                            <div class="form-group">
                                                <label for="product">Product</label>
                                                <form:select path="products.id" class="form-select" name="product" id="product">
                                                    <option selected disabled>Select product</option>
                                                    <form:options items="${listProduct}" itemLabel="title" itemValue="id"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-6">

                                            <!--Select Size-->
                                            <div class="form-group">
                                                <label for="size">Size</label>
                                                <form:select path="sizes.id" class="form-select" name="size" id="size">
                                                    <option selected disabled>Select Size</option>
                                                    <form:options items="${listSizes}" itemLabel="nameSize" itemValue="id"/>
                                                </form:select>
                                            </div>

                                            <div class="form-group">
                                                <label for="title-description">Description: </label>
                                                <form:input path="description" type="text" class="form-control" name="description" id="title-description"
                                                            aria-describedby="description-product-detail" placeholder="Description product detail"/>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">

                                        </div>
                                    </div>

                                </div>
                                <div class="card-footer text-muted">
                                    <button class="btn btn-success">New</button>
                                    <button type="submit" class="btn btn-primary btn-submit-product">Save</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </section>
            </main>
        </div>

    </div>
</div>

<script src="${base}/js/ajax.js"></script>
<!-- Bootstrap core JavaScript-->
<%--<script src="${base}/vendor/jquery/jquery.min.js"></script>--%>
<script src="${base}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${base}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${base}/js/sb-admin-2.min.js"></script>
</body>
</html>
