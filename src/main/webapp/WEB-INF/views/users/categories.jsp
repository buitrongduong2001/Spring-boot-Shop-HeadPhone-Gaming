<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/category.css">
    <link type="text/css" rel="stylesheet"  href="${pageContext.servletContext.contextPath}/css/simplePagination.css"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        .table thead th {
            border-bottom: none;
        }

        .table th {
            border-top: none;
        }

        .list-group-item {
            padding: .2rem 1.25rem;
        }

        .btn.focus,
        .btn:focus {
            box-shadow: none;
        }

        .breadcrumb {
            padding-left: 10%;
        }

        .btn_loc>.btn {
            width: 75px;
            font-size: .85em;
            border-radius: 99px;
        }

        .pagination {
            align-items: center;
            justify-content: center;
        }
    </style>
</head>

<body>
    <!-- Header -->
   <jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
    <!-- End Header -->
    <div class="top_breadcrumb">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Category</li>
            </ol>
        </nav>
    </div>
    <!-- Main-->
    <main>

        <div class="row category_content ">
            <div class="col-lg-3 d-lg-block d-md-none d-sm-none category_silde_bar">
                <div id="shop_sidebar" class=" category_silde_bar_menu ">
                    <aside class="widget category_silde_bar_menu_item">
                        <span class="widget_title ">
                            <a href="#"><i class="far fa-bars"></i></a> Danh mục sản phẩm</span>
                        <div class="is-divider small"></div>
                        <div class="category_silde_bar_menu_container">
                            <ul class="category_silde_bar_menu_ul menu">
                                <c:forEach var="item" items="${listCate}">
                                    <li class="category_silde_bar_menu_li">
                                        <a href="${base}/danh-sach-san-pham?parent=${item.id}" class="category_silde_bar_menu_link"> ${item.name} </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </aside>


                    <aside class="category_filter_price">
                        <span class="widget_title "> Lọc theo giá</span>
                        <div class="is-divider small"></div>
                        <c:choose>
                            <c:when test="${param.get('parent') == null}">
                                <form method="get" action="${base}/danh-sach-san-pham">
                                    <div class="row category_check_checkbox ">
                                        <div class="col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                                   value="1">
                                            <label class="form-check-label" for="exampleRadios1">
                                                1tr-5tr
                                            </label>
                                        </div>
                                        <div class="col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                                   value="2">
                                            <label class="form-check-label" for="exampleRadios1">
                                                5tr-10tr
                                            </label>
                                        </div>
                                        <div class=" col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                                   value="3">
                                            <label class="form-check-label" for="exampleRadios1">
                                                10tr-25tr
                                            </label>
                                        </div>
                                        <div class="col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios"
                                                   value="4">
                                            <label class="form-check-label" for="exampleRadios1">
                                                25tr-60tr
                                            </label>
                                        </div>
                                    </div>
                                    <div class="btn_loc">
                                        <button id="id-loc" class="btn btn-secondary">Lọc</button>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form method="get" action="${base}/danh-sach-san-pham">
                                    <div class="row category_check_checkbox ">
                                        <input type="hidden" name="parent" value="${param.get('parent')}">
                                        <div class="col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                                   value="1">
                                            <label class="form-check-label" for="exampleRadios1">
                                                1tr-5tr
                                            </label>
                                        </div>
                                        <div class="col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                                   value="2">
                                            <label class="form-check-label" for="exampleRadios1">
                                                5tr-10tr
                                            </label>
                                        </div>
                                        <div class=" col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1"
                                                   value="3">
                                            <label class="form-check-label" for="exampleRadios1">
                                                10tr-25tr
                                            </label>
                                        </div>
                                        <div class="col-6 form-check">
                                            <input class="form-check-input" type="radio" name="exampleRadios"
                                                   value="4">
                                            <label class="form-check-label" for="exampleRadios1">
                                                25tr-60tr
                                            </label>
                                        </div>
                                    </div>
                                    <div class="btn_loc">
                                        <button id="id-loc" class="btn btn-secondary">Lọc</button>
                                    </div>
                                </form>
                            </c:otherwise>
                        </c:choose>


                    </aside>

                    <aside class="category_products">
                        <span class="widget_title "> Sản Phẩm</span>
                        <div class="is-divider small"></div>
                        <div class="cateory_products_list">
                            <ul class="cateory_products_list_ul">
                                <li class="cateory_products_list_li">
                                    <a href="#" class="cateory_products_list_link">
                                        <img src="${pageContext.servletContext.contextPath}/images/JBL_E55BT_KEY_BLACK_6175_FS_x1-1605x1605px.png" alt=""
                                            class="cateory_products_list_li_img" width="100%">
                                        <span>Headphone  Lorem ipsum dolor sit amet consectetur adipisicing
                                            elit. Ipsa magni facilis, iste eligendi corporis sequi sint voluptatum ab
                                            assumenda dignissimos repellat, placeat unde ad odit maiores quia molestiae
                                            explicabo fuga!</span>
                                    </a>
                                    <span class="cateory_products_list_price">200$</span>
                                </li>
                                <li class="cateory_products_list_li">
                                    <a href="#" class="cateory_products_list_link">
                                        <img src="${pageContext.servletContext.contextPath}/images/71TEMutZIiL._AC_UY327_FMwebp_QL65_.webp" alt=""
                                            class="cateory_products_list_li_img" width="100%">
                                        <span>Earphones MuGo Wireless Earbuds</span>

                                    </a>
                                    <span class="cateory_products_list_price">200$</span>
                                </li>
                                <li class="cateory_products_list_li">
                                    <a href="#" class="cateory_products_list_link">
                                        <img src="${pageContext.servletContext.contextPath}/images/smart_watch_01.png" alt=""
                                            class="cateory_products_list_li_img" width="100%">
                                        <span>Smart watch </span>
                                    </a>
                                    <span class="cateory_products_list_price">200$</span>
                                </li>
                            </ul>
                        </div>
                    </aside>
                </div>

            </div>
            <!-- List products -->
            <div class="col-lg-9 col-md-12 category_silde_bar_item">
                <div class="message-addCart">
                    <div class="alert inactive">
                        <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                        <strong>Success!</strong> You add one item to cart !
                    </div>
                </div>
                <div class="alert-quantity hide">
                    <span class="fas fa-exclamation-circle"></span>
                    <span class="msg">Thông báo: Sản phẩm đã hến hàng</span>
                    <div class="close-btn">
                        <span class="fas fa-times"></span>
                    </div>
                </div>
                <div class="card-deck row justify-content-center ">
                    <c:forEach var="item" items="${productModel.data}">
                        <div class = "col-3 product-item ">
                            <div class = "product-img">
                                <img src = "${base}/uploads/${item.avatar}" width="100%" alt = "" class = "img-fluid d-block mx-auto">
                                <span class = "heart-icon">
                                    <i class = "far fa-heart"></i>
                                </span>
                                <div class = "row btns w-100 mx-auto text-center">
                                    <button onclick="AddToCart(${item.id},${item.quantity})" type = "button" class = "col-6 py-2">
                                        <i class="fas fa-shopping-cart"></i> Add To Cart
                                    </button>
                                    <a href="${base}/detail-product/${item.seo}" type = "button" class = "col-6 py-2">
                                        <i class = "fa fa-binoculars"></i> View
                                    </a>
                                </div>
                            </div>

                            <div class = "product-info p-3">
                                <span class = "product-type">${item.categories.name}</span>
                                <a  href="${base}/detail-product/${item.seo}" class = "d-block text-dark text-decoration-none py-2 product-name">
                                        ${item.title}
                                </a>

                                <c:choose>
                                    <c:when test="${item.priceSale != null}">
                                    <span class="product-price-sale">
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${item.priceSale}" type="currency"/>
                                    </span>
                                        <span class="product-price ml-2">
                                         <s>
                                            <fmt:setLocale value="vi_VN" scope="session"/>
                                            <fmt:formatNumber value="${item.price}" type="currency"/>
                                        </s>
                                    </span>
                                    </c:when>
                                    <c:when test="${item.priceSale == null}">
                                    <span class="product-price-sale">
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${item.price}" type="currency"/>
                                    </span>
                                    </c:when>
                                </c:choose>

                                <div class = "rating d-flex mt-1">
                                    <span><i class = "fa fa-star"></i></span>
                                    <span><i class = "fa fa-star"></i></span>
                                    <span><i class = "fa fa-star"></i></span>
                                    <span><i class = "fa fa-star"></i></span>
                                    <span><i class = "fa fa-star"></i></span>
                                    <span>(25 reviews)</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
            </div>
                <form action="${base}/danh-sach-san-pham" method="get" >
                    <input type="hidden" name="page" id="page">
                        <c:if test="${param.get('exampleRadios') != null}">
                            <input class="form-check-input" value="${param.get('exampleRadios')}" id="locInput" type="hidden" name="exampleRadios"/>
                        </c:if>
                    <button style="display: none" type="submit" id="btnSearch"></button>
                    <div class="row">
                        <div class="col-12 d-flex justify-content-center">
                            <div id="paging-list-cate-filter"></div>
                        </div>
                    </div>
                </form>
                <!-- Page -->

                <!-- End Page -->
            <!-- End List products -->
        </div>
        </div>
    </main>
    <!--End Main-->

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
    <script src = "${base}/vendor/owl_carousel/owl.carousel.js"></script>
    <script src="${base}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${base}/js/jquery.simplePagination.js"></script>
    <script src="${base}/js/ajax.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#paging-list-cate-filter').pagination({
                currentPage: ${productModel.currentPage},
                items: ${productModel.totalItems},
                itemsOnPage: 9,
                cssStyle: 'light-theme',
                onPageClick: function(pageNumber, event) {
                    $('#page').val(pageNumber);
                    $('#btnSearch').trigger('click');
                },
            });
        });
    </script>
    <script src="${base}/js/users.js"></script>

</body>
<%--    <script src="${base}/js/script2.js"></script>--%>

</html>