
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Product</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <!-- base là của thằng variables.jsp cấu hình -->
    <link rel="stylesheet" href="${base}/css/detail.css">
    <jsp:include page="/WEB-INF/views/users/style/css/indexCss.jsp"></jsp:include>
    
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


    <!-- Main -->
    <main class="container ">

        <!-- Signle product -->
        <div class="single-product ">
            <div class="message-addCart">
                <div class="alert inactive">
                    <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
                    <strong>Success!</strong> You add one item to cart !
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-5 col-md-12">
                    <div class="product-detail-img" id="product-detail-img">
                        <img src="${base}/uploads/${product.avatar}" alt="">
                    </div>
                    <div class="box">
                        <div class="small-img-row">
                            <div class="small-img-col">
                                <img class="small-img-select" src="${base}/uploads/${product.avatar}"
                                     alt="">
                            </div>

                            <c:forEach items="${product.productsImages}" var="item">
                                <div class="small-img-col">
                                    <img class="small-img-select" src="${base}/uploads/${item.path}"
                                         alt="">
                                </div>
                            </c:forEach>


                        </div>
                    </div>
                </div>
                <div class="col-lg-7 ">
                    <p class="detail-breadcrumb">Home/ Headphone</p>
                    <input hidden value="${product.id}" id="id-product-detail-hidden">
                    <h1 class="detail-product-name">${product.title}</h1>
                    <div class="product-info-detail">
                        <span class="product-info-detail-title">Brand: </span>
                        <a href="#">${product.categories.name}</a>
                    </div>

                    <div class="product-info-detail">
                        <span class="product-info-detail-rated">Rated: </span>
                        <span class="product-info-detail-star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </span>
                    </div>

                    <!--Size radio-->
                        <%--<div class="product-info-detail">
                            <span class="product-info-detail-rated">Size: </span>
                            <ul class="text-swatch attribute-swatch color-swatch">
                                <c:forEach var="item" items="${listDetail}" varStatus="loopCount">
                                    <li data-slug="${item.sizes}" data-id = "${item.id}" class="attribute-swatch-item">
                                        <div>
                                            <input hidden class="quantity-store" data-quantity="${item.quantityStore}">
                                            <label>
                                                        <input class="product-filter-item" data-detail="${item.id}" type="radio" name="attribute_size" value="${item.sizes.id}">
                                                        <span>${item.sizes.nameSize}</span>
                                            </label>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>--%>
                    <p class="product-detail-description">${product.shortDescription}</p>
                    <div class="product-info-price">
                        <c:choose>
                            <c:when test="${hot.priceSale != null}">
                                    <span class="product-price-sale">
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${product.priceSale}" type="currency"/>
                                    </span>
                            </c:when>
                            <c:when test="${product.priceSale == null}">
                                    <span class="product-price-sale">
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${product.price}" type="currency"/>
                                    </span>
                            </c:when>
                        </c:choose>

                    </div>
                    <div class="product-quantity-wrapper">
                        <span id="detail-btn-minus" class=" product-quantity-btn">
                            <i class="fas fa-minus"></i>
                        </span>
                        <input type="number" name="" data-quantity="${product.quantity}" class="product-info-quantity" id="product-detail-quantity"
                              value="1" disabled>
                        <span id="detail-btn-plus" class="product-quantity-btn">
                            <i class="fas fa-plus"></i>
                        </span>
                    </div>
                    <div class="quantity-product-store">
                        <span class="title-store">Còn đang có ${product.quantity} sản phẩm</span>
                    </div>
                    <div class="product-detail-add">
                        <c:if test="${product.quantity > 0 && product.quantity != null}">
                        <button onclick="AddToCart(${product.id})" id="add-to-cart-detail" class="add-to-cart add-cart-hover text-uppercase">
                            Add to cart
                        </button>
                        </c:if>
                        <c:if test="${product.quantity <= 0 || product.quantity == null}">
                            <div class="alert-size-none">
                                Sản phẩm đã hết vui lòng liên hệ để đặt hàng
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Signle product -->

        <!-- Review Comments -->
        <div class="comment-product box tabs effect-3">
            <!-- tab-title -->
            <input type="radio" id="tab-1" name="tab-effect-3" >
            <span>Reviews</span>

            <input type="radio" id="tab-2" name="tab-effect-3" checked="checked">
            <span>Description Product</span>

            <div class="line ease"></div>
            <div class="tab-content">
                <section id="tab-item-1">
                    <div class="user-rate">
                        <div class="user-info d-flex">
                            <div class="user-info-avt">
                                <img src="../images/user-img-2.png" alt="">
                            </div>
                            <div class="user-info-name ">
                                <span>Bui Trong duong</span>
                                <span class="rating d-block">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </span>
                            </div>
                        </div>
                        <div class="user-comment-content">
                            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eius, eligendi? Eaque doloribus cumque
                            tempore sequi voluptate corrupti a hic omnis pariatur eveniet explicabo facilis culpa cupiditate
                            necessitatibus, ipsum temporibus ad.
                        </div>
                    </div>
                    <div class="user-rate">
                        <div class="user-info d-flex">
                            <div class="user-info-avt">
                                <img src="../images/user-img-2.png" alt="">
                            </div>
                            <div class="user-info-name ">
                                <span>Bui Trong duong</span>
                                <span class="rating d-block">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </span>
                            </div>
                        </div>
                        <div class="user-comment-content">
                            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eius, eligendi? Eaque doloribus cumque
                            tempore sequi voluptate corrupti a hic omnis pariatur eveniet explicabo facilis culpa cupiditate
                            necessitatibus, ipsum temporibus ad.
                        </div>
                    </div>
                    <div class="user-rate">
                        <div class="user-info d-flex">
                            <div class="user-info-avt">
                                <img src="../images/user-img-2.png" alt="">
                            </div>
                            <div class="user-info-name ">
                                <span>Bui Trong duong</span>
                                <span class="rating d-block">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                </span>
                            </div>
                        </div>
                        <div class="user-comment-content">
                            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eius, eligendi? Eaque doloribus cumque
                            tempore sequi voluptate corrupti a hic omnis pariatur eveniet explicabo facilis culpa cupiditate
                            necessitatibus, ipsum temporibus ad.
                        </div>
                    </div>
                </section>
                <section id="tab-item-2">
                    <div class="short-description-product">
                        ${product.shortDescription}
                    </div>
                    <div class="long-description-product">
                        ${product.detailDescription}
                    </div>
                </section>
            </div>
        </div>
        <!-- End Review Comments -->

        <!-- Related Products-->
        <div class="related-product">
            <h4 class="related-product-title">Related product</h4>
            <div class="row related-product-content ">
                <div class="cards col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body position-relative">
                        <img src="../images/JBL_JR 310BT_Product Image_Hero_Skyblue.png" class="card-img-top" alt=".366 452..">
                        <div class="action position-absolute ">
                            <a href="#"><i class="far fa-eye eye"></i></a>
                            <a href="#"><i class="fal fa-heart heart"></i></a>
                            <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                        </div>
                    </div>
                    <div class="info-product">
                        <a href="#">
                            <p>Acer Aspire Gaming</p>
                        </a>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="price">
                            $100
                        </div>
                    </div>
                </div>


                <div class="cards col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body position-relative">
                        <img src="../images/kisspng-beats-electronics-headphones-apple-beats-studio-red-headphones.png" class="card-img-top" alt=".366 452..">
                        <div class="action position-absolute">
                            <a href="#"><i class="far fa-eye eye"></i></a>
                            <a href="#"><i class="fal fa-heart heart"></i></a>
                            <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                        </div>
                    </div>
                    <div class="info-product">
                        <a href="#">
                            <p>Acer Aspire Gaming</p>
                        </a>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="price">
                            $100
                        </div>
                    </div>
                </div>


                <div class="cards col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body position-relative">
                        <img src="../images/loa01.png" class="card-img-top" alt=".366 452..">
                        <div class="action position-absolute">
                            <a href="#"><i class="far fa-eye eye"></i></a>
                            <a href="#"><i class="fal fa-heart heart"></i></a>
                            <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                        </div>
                    </div>
                    <div class="info-product">
                        <a href="#">
                            <p>Acer Aspire Gaming</p>
                        </a>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="price">
                            $100
                        </div>
                    </div>
                </div>


                <div class="cards col-sm-12 col-md-6 col-lg-3">
                    <div class="card-body position-relative">
                        <img src="../images/smart_watch_01.png" class="card-img-top" alt=".366 452..">
                        <div class="action position-absolute">
                            <a href="#"><i class="far fa-eye eye"></i></a>
                            <a href="#"><i class="fal fa-heart heart"></i></a>
                            <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                        </div>
                    </div>
                    <div class="info-product">
                        <a href="#">
                            <p>Acer Aspire Gaming</p>
                        </a>
                        <div class="star">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <div class="price">
                            $100
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- End Related Products-->
    </main>
    <!-- End Main -->


    <!-- Footer-->
    <jsp:include page="/WEB-INF/views/users/layout/footer.jsp"></jsp:include>
    <!-- End Footer-->
    <div class="button-to-top">
        <a href="#" class="btn-go-to-top">
            <i class="fas fa-chevron-up"></i>
        </a>
    </div>
    <script src="${base}/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>


</body>
<script src="${pageContext.servletContext.contextPath}/js/script2.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/ajax.js"></script>
<script src="${base}/js/users.js"></script>
</html>