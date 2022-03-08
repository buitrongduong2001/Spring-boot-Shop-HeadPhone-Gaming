
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
    <title>Create Product</title>
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
                    <section class="row" style="width: 100%">
                        <div class="col mt-4">
                            <form:form action="${base}/admin/store/product" method='POST' modelAttribute="product"
                                       class="col-sm-12" enctype="multipart/form-data">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <h2>Add New Product</h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-7">
                                                <form:hidden path="id" />
                                                <div class="form-group">
                                                    <label for="title">Name Product: </label>
                                                    <form:input type="text" class="form-control" name="title"
                                                                id="title" aria-describedby="name" path="title"/>
                                                    <small id="nameHid" class="form-text text-muted">Nhập
                                                        name </small>
                                                    <span class="form-message" id="error_name_product"></span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="categoryId">Category</label>
                                                    <form:select path="categories.id" class="form-control" name="category" id="categoryId">
                                                        <option value disabled selected>Chọn danh mục</option>
                                                        <form:options items="${categories}" itemLabel="name" itemValue="id"/>
                                                    </form:select>
                                                </div>
                                                <!-- FIELD PRODUCT STATUS -->
                                                <div class="form-group">
                                                    <label for="status">Status</label>
                                                    <form:select path="status" class="form-control" name="status"
                                                                 id="status">
                                                        <form:option value="true">Hoạt Động</form:option>
                                                        <form:option value="false">Không hoạt động</form:option>
                                                    </form:select>
                                                </div>
                                                <!-- FIELD PRODUCT CREATE DATE -->
                                                <div class="form-group">
                                                    <label for="date">Ngày Tạo </label>
                                                    <form:input path="createdDate" type="date" class="form-control"
                                                                name="createdDate"  id="createdDate"
                                                                aria-describedby="id"/> <small id="date"
                                                                                               class="form-text text-muted">Chọn
                                                    Ngày</small> <span
                                                        class="form-message" id="error_date_product"
                                                        style="color: red;"></span>
                                                </div>
                                                <!-- FIELD PRODUCT SALE -->
                                                <div class="form-check form-switch ml-4">
                                                    <c:choose>
                                                        <c:when test="${product.priceSale == null}">
                                                            <input class="form-check-input" type="checkbox" id="onSale" onchange="checkedSale(this)">
                                                        </c:when>
                                                        <c:when test="${product.priceSale != null}">
                                                            <input class="form-check-input" checked type="checkbox" id="onSale" onchange="checkedSale(this)">
                                                        </c:when>
                                                    </c:choose>
                                                    <label class="form-check-label" for="onSale">Status On Sale</label>
                                                </div>
                                                <div class="sale-price input-group form-group">

                                                </div>

                                            </div>

                                            <div class="col-3">
                                                <img src="${base}/images/hg.jpg" width="90%" class="img-fluid"/>
                                                <div class="form-group">
                                                    <label for="avatarProduct">Image Main File: </label>
                                                    <input type="file" class="form-control-file"
                                                                name="avatarProduct"
                                                                aria-describedby="productImage" id="avatarProduct"
                                                                placeholder="Product Image"/> <small
                                                        id="productImage"
                                                        class="form-text text-muted">Nhập Image Product</small>
                                                    <span class="form-message" id="error_name_cate"
                                                          style="color: red;"></span>
                                                </div>
                                                <div class="input-group form-group">
                                                    <label class="input-group-text">Price</label>
                                                    <form:input path="price" type="number" class="form-control"
                                                                name="price"
                                                                id="price" aria-describedby="price"/>
                                                    <span class="input-group-text">$</span>
                                                </div>
                                                <div class="input-group form-group">
                                                    <label class="input-group-text">Quantity</label>
                                                    <form:input path="quantity" type="number" class="form-control"
                                                                name="quantity"
                                                                id="quantity" aria-describedby="quantity"/>
                                                    <span class="input-group-text">Cái</span>
                                                </div>
                                                <div class="form-group mt-3 ml-3 ">
                                                    <label>Is Hot</label>
                                                    <div class="d-flex">
                                                    <div class="form-check mr-2">
                                                        <form:radiobutton path="hot" value="true" class="form-check-input" id="hot"/>
                                                        <label class="form-check-label" for="hot"> Hot </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <form:radiobutton path="hot" value="false" class="form-check-input"  id="notHot"/>
                                                        <label class="form-check-label" for="notHot"> Không Hot </label>
                                                    </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row container">
                                            <div class="col d-flex" >
                                                <div class="form-group ">
                                                    <div style="width: 250px">
                                                        <img src="${base}/images/hg.jpg" width="90%" class="img-fluid"/>
                                                        <input type="file" name="childAvatar1" id="childAvatar1" class="form-control-file" multiple="multiple">
                                                    </div>
                                                    <label for="childAvatar1">Image One: </label>

                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">

                                                <div class="form-group">
                                                    <label for="shortDescription">Mô Tả Ngắn</label>
                                                    <form:textarea path="shortDescription" class="form-control" name="shortDescription"
                                                                   id="shortDescription" rows="2s"></form:textarea>
                                                    <span class="form-message" id="error_moTa_product"
                                                          style="color: red;"></span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="detailDescription">Mô Tả Dài</label>
                                                    <form:textarea path="detailDescription" class="form-control" name="detailDescription"
                                                                   id="summernote" rows="5s"></form:textarea>
                                                    <span class="form-message" id="error_moTa_product"
                                                          style="color: red;"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer text-muted">
                                        <button class="btn btn-success">New</button>
                                        <button class="btn btn-primary btn-submit-product" type="submit" >Save</button>
                                        <%--<button onclick="SaveProduct()" type="button"
                                                class="btn btn-primary btn-submit-product">Save
                                        </button>--%>
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
<script>
    var doc = document.getElementById('onSale');
    if(doc.checked){
        $('.sale-price').append('<div class="sale-p d-flex"><label class="input-group-text">Price Sale </label> <input value="${product.priceSale}" type="number" name="priceSale" class="form-control" aria-describedby="price"/> <span class="input-group-text">$</span></div>');
    }else {
        $('.sale-price').find('.sale-p').remove();
    }
    function checkedSale(checkEle){

        if(checkEle.checked){
            $('.sale-price').append('<div class="sale-p d-flex"><label class="input-group-text">Price Sale </label> <input value="${product.priceSale}" type="number" name="priceSale" class="form-control" aria-describedby="price"/> <span class="input-group-text">$</span></div>');

        }else {
            $('.sale-price').find('.sale-p').remove();
        }
    }
    //<label class="input-group-text">Price Sale</label>
</script>
<script>
    $(document).ready(function () {
        $("#summernote").summernote();
    });
</script>
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