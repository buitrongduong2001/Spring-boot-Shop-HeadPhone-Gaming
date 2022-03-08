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
    <title>Your Cart</title>
    <!-- pageContext.servletContext.contextPath chuyển thành BASE -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
    <link rel="stylesheet" href="${base}/css/cart.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <!-- Header -->
    <jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
    <!-- End Header -->
    <c:if test="${empty error}">${error}</c:if>
    <div class="top_breadcrumb" >
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Category</li>
            </ol>
        </nav>
    </div>

    <main class="main">
        <div class="page-header breadcrumb-wrap">
            <nav style="--bs-breadcrumb-divider: '>>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                </ol>
            </nav>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12 ">
                    <form action="" class="form-shopping-cart">
                        <div class="table-shopping-cart mt-5">
                            <table class="table text-center">
                                <thead>
                                    <tr class="main-heading">
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Subtotab</th>
                                        <th scope="col">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="item" items="${listCart.cartItems}">
                                    <tr>
                                        <td class="image product-img">
                                            <img src="${base}/uploads/${item.avatarProduct}"
                                                 alt="">
                                        </td>
                                        <td class="product-name">
                                            <p>${item.productName}</p>
                                            <span>(Color: black, size: ${item.size})</span>
                                        </td>
                                        <td class="price" data-title="Price">
                                            <c:choose>
                                                <c:when test="${item.priceUnitSale == null}">
                                                    <span id="number-price">
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${item.priceUnit}" type="currency"/>
                                                    </span>
                                                </c:when>
                                                <c:when test="${item.priceUnitSale != null}">
                                                    <span id="number-price">
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${item.priceUnit}" type="currency"/>
                                                    </span>
                                                    <s>
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${item.priceUnitSale}" type="currency"/>
                                                    </s>
                                                </c:when>
                                            </c:choose>

                                        </td>
                                        <td class="text-center shopping-cart-quantity" data-title="quantity">
                                            <span data-product = "${item.productId}" id="shopping-btn-minus" style="margin-right: 10px;"
                                                  class="shopping-btn-minus">
                                                <i class="fas fa-minus"></i>
                                            </span>
                                            <input type="number" name="" class="product-info-quantity"
                                                   id="product-shopping-quantity" data-quantity="${item.quantityStore}" data-value ="${item.quantity}" value="${item.quantity}" disabled>
                                            <span data-product = "${item.productId}" id="shopping-btn-plus" class="shopping-btn-plus">
                                                <i class="fas fa-plus"></i>
                                            </span>
                                        </td>
                                        <td class="text-right" data-title="Subtotal">
                                            <span id="subtotal" class="subtotal">
                                                <fmt:setLocale value="vi_VN" scope="session"/>
                                                <fmt:formatNumber value="${item.totalPrice}" type="currency"/>
                                            </span>
                                        </td>
                                        <td class="action-cart" data-title="Remove">
                                            <a href="#" data-product="${item.productId}" class="shopping-cart-action-remove"><i
                                                    class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-7 col-sm-12">

                            </div>
                            <div class="col-lg-5 col-md-9 col-sm-12">
                                <div class="box ">
                                    <div class="container form-total">
                                        <div class="header-cart-total">
                                            <span>Cart Total</span>
                                        </div>
                                        <div class="cart-total mt-3">
                                            <div class="row mb-2">
                                                <div class="col-9 total-name">
                                                    Tax
                                                </div>
                                                <div class="col-3 total-number">
                                                    0 ₫
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-9 total-name">
                                                    <span>Total</span>
                                                    <span>(Shipping fees not included)</span>
                                                </div>

                                                <div class="col-3 total-number">
                                                    <span id="price-total">
                                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                                        <fmt:formatNumber value="${listCart.totalPrice}" type="currency"/>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="redirect-check-out row">
                                                <a href="${base}/cart/checkout" type="button" class="btn col-6 btn-check-out">
                                                    <span>Checkout <i class="fas fa-credit-card"></i></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                
            </div>
             <!-- Related Products-->
             <div class="related-product mt-5">
                <h4 class="related-product-title">Related product</h4>
                <div class="row related-product-content ">
                    <div class="cards col-sm-12 col-md-6 col-lg-3">
                        <div class="card-body position-relative">
                            <img src="../images/JBL_JR 310BT_Product Image_Hero_Skyblue.png"
                                class="card-img-top" alt=".366 452..">
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
                            <img src="../images/kisspng-beats-electronics-headphones-apple-beats-studio-red-headphones.png"
                                class="card-img-top" alt=".366 452..">
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
        </div>
    </main>







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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
    <!-- owl carousel -->
    <script src="${base}/js/ajax.js"></script>
    <script src="${base}/js/users.js"></script>
</body>
<script src="${base}/js/script2.js"></script>


</html>