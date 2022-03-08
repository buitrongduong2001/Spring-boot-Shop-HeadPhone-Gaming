<%@ page import="java.text.DecimalFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Index</title>
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

    <link rel="stylesheet" href="${base}/css/home.css">
    <jsp:include page="/WEB-INF/views/users/style/css/indexCss.jsp"></jsp:include>
    <style>
        .table thead th {
            border-bottom: none;
        }

        .table th {
            border-top: none;
        }

    </style>
</head>

<body>
<!-- Header -->
<jsp:include page="/WEB-INF/views/users/layout/header.jsp"></jsp:include>
<!-- hero -->

<div class="hero">
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
    <div class="slide-container" id="hero-slide">
        <!-- slide item -->
        <div class="slide">
            <div class="slide-txt">
                <div class="slide-title">
                    <p>JBL Jr310BT</p>
                </div>
                <div class="slide-description">
                    <p>JBL legendary sound designed to never exceed 85dB making them safe for even the youngest music
                        fans</p>
                </div>
                <div class="slide-btn">
                    <a type="button" href="#" class="hero-btn">
                        buy now
                    </a>
                </div>
            </div>
            <div class="slide-img">
                <img src="${pageContext.servletContext.contextPath}/images/JBL_JR 310BT_Product Image_Hero_Skyblue.png"
                     width="100%" alt="">
            </div>
        </div>
        <!-- end slide item -->
        <!-- slide item -->
        <div class="slide">
            <div class="slide-txt">
                <div class="slide-title">
                    <p>Bose QuietComfort 35 II </p>
                </div>
                <div class="slide-description">
                    <p>Hassle-free Bluetooth pairing, and more through the Bose connect app. USB cable: 12 inch</p>
                </div>
                <div class="slide-btn">
                    <a type="button" href="#" class="hero-btn">
                        buy now
                    </a>
                </div>
            </div>
            <div class="slide-img">
                <img src="${pageContext.servletContext.contextPath}/images/kisspng-beats-electronics-headphones-apple-beats-studio-red-headphones.png"
                     alt="">
            </div>
        </div>
        <!-- end slide item -->
        <!-- slide item -->
        <div class="slide">
            <div class="slide-txt">
                <div class="slide-title">
                    <p>JBL E55BT</p>
                </div>
                <div class="slide-description">
                    <p>Package Dimensions: 10.693 cms (L) x 25.298 cms (W) x 10.693 cms (H)</p>
                </div>
                <div class="slide-btn">
                    <a type="button" href="#" class="hero-btn">
                        buy now
                    </a>
                </div>
            </div>
            <div class="slide-img">
                <img src="${pageContext.servletContext.contextPath}/images/JBL_E55BT_KEY_BLACK_6175_FS_x1-1605x1605px.png"
                     width="100%" alt="">
            </div>
        </div>
        <!-- end slide item -->
        <!-- slide control -->
        <ul class="slide-control">
            <li class="slide-prev"><i class="far fa-chevron-left"></i></i></li>
            <li class="slide-control-item active">01</li>
            <li class="slide-control-item">02</li>
            <li class="slide-control-item">03</li>
            <li class="slide-next"><i class="far fa-chevron-right"></i></li>
        </ul>
        <!-- end slide control -->
    </div>

</div>
<!--  end hero -->

<!-- featured product -->
<div class="container featured_product">
    <div class="featured_txt ">
        Featured Product
    </div>
    <div class="featured_content">
        <div class="card-deck">
            <div class="cards">
                <div class="card-body">
                    <img src="${pageContext.servletContext.contextPath}/images/feared_01.png" class="card-img-top"
                         alt=".366 452..">
                    <div class="action">
                        <a href="#"><i class="far fa-eye eye"></i></a>
                        <a href="#"><i class="fal fa-heart heart"></i></a>
                        <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                    </div>
                </div>
                <div class="info-product">
                    <p>Acer Aspire Gaming</p>
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

            <div class="cards">
                <div class="card-body">
                    <img src="${base}/images/feared_02.png" width="100%" class="card-img-top" alt="...">
                    <div class="action">
                        <a href="#"><i class="far fa-eye eye"></i></a>
                        <a href="#"><i class="fal fa-heart heart"></i></a>
                        <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                    </div>
                </div>
                <div class="info-product">
                    <p>Acer Aspire Gaming</p>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fal fa-star"></i>
                        <i class="fal fa-star"></i>
                    </div>
                    <div class="price">
                        $100
                    </div>
                </div>
            </div>
            <div class="cards">
                <div class="card-body">
                    <img src="${base}/images/feared_03.png" class="card-img-top" alt="...">
                    <div class="action">
                        <a href="#"><i class="far fa-eye eye"></i></a>
                        <a href="#"><i class="fal fa-heart heart"></i></a>
                        <a href="#"><i class="far fa-shopping-cart cart"></i></a>
                    </div>
                </div>
                <div class="info-product">
                    <p>Acer Aspire Gaming</p>
                    <div class="star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fal fa-star"></i>
                    </div>
                    <div class="price">
                        $100
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- End featured product -->

<!-- banner sale -->
<div class="sale_off">
    <div class="content_sale">
        <div class="name_sale">
            <p class="number_sale">25% Off</p>
            <p class="name_pr">All laptop dell </p>
            <a href="#" type="button">By now</a>
        </div>
        <div class="image_sale">
            <img src="${base}/images/ASUS_15.6.png" alt="">
        </div>
    </div>
</div>
<!-- end banner sale -->

<!-- Main -->
<main>
    <div class="container-fluid list_product">
        <!-- Most popular-->
        <div class="most_popular">
            <div class="most_popular_txt">
                most popular
            </div>
            <div class = "row g-4 my-5 mx-auto owl-carousel owl-theme">
                <c:forEach var="hot" items="${listIsHot.data}">
                    <div class = "col product-item mx-auto">
                        <div class = "product-img">
                            <img src = "${base}/uploads/${hot.avatar}" width="100%" alt = "" class = "img-fluid d-block mx-auto">
                            <span class = "heart-icon">
                        <i class = "far fa-heart"></i>
                    </span>
                            <div class = "row btns w-100 mx-auto text-center">
                                <button onclick="AddToCart(${hot.id},${hot.quantity})" type = "button" class = "col-6 py-2">
                                    <i class="fas fa-shopping-cart"></i> Add To Cart
                                </button>
                                <a href="${base}/detail-product/${hot.seo}" type = "button" class = "col-6 py-2">
                                    <i class = "fa fa-binoculars"></i> View
                                </a>
                            </div>
                        </div>

                        <div class = "product-info p-3">
                            <span class = "product-type">${hot.categories.name}</span>
                            <a  href="${base}/detail-product/${hot.seo}" class = "d-block text-dark text-decoration-none py-2 product-name">${hot.title}</a>

                            <c:choose>
                                <c:when test="${hot.priceSale != null}">
                                    <span class="product-price-sale">
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${hot.priceSale}" type="currency"/>
                                    </span>
                                    <span class="product-price ml-2">
                                         <s>
                                            <fmt:setLocale value="vi_VN" scope="session"/>
                                            <fmt:formatNumber value="${hot.price}" type="currency"/>
                                        </s>
                                    </span>
                                </c:when>
                                <c:when test="${hot.priceSale == null}">
                                    <span class="product-price-sale">
                                        <fmt:setLocale value="vi_VN" scope="session"/>
                                        <fmt:formatNumber value="${hot.price}" type="currency"/>
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
            </div>
        </div>

    </div>
    <!-- End Most popular-->
    <!-- Commitment (Cam kết)-->
    <div class="commitment justify-content-center">
        <div class="card-deck">
            <div class="card" style="width: 16rem;">
                <div class="card-body">
                    <i class="fal fa-sack-dollar"></i>
                    <p class="card-text">Money back gurantee</p>
                    <p> great fill signs he evening</p>
                </div>
            </div>
            <div class="card" style="width: 16rem;">
                <div class="card-body">
                    <i class="fal fa-truck-container"></i>
                    <p class="card-text">Free Delivery</p>
                    <p> great fill signs he evening</p>
                </div>
            </div>
            <div class="card" style="width: 16rem;">
                <div class="card-body">
                    <i class="far fa-headphones-alt"></i>
                    <p class="card-text">Alway support</p>
                    <p> great fill signs he evening</p>
                </div>
            </div>
            <div class="card" style="width: 16rem;">
                <div class="card-body">
                    <i class="fal fa-shield-cross"></i>
                    <p class="card-text">Secure payment</p>
                    <p> great fill signs he evening</p>
                </div>
            </div>
        </div>

    </div>
    <!-- End Commitment (Cam kết)-->

    <!-- Trending product-->
    <div id="trending_product" class="trending_product ">
        <div class="trending_product_txt">
            trending products
        </div>
        <div class="row justify-content-center p-5 ">
            <c:forEach items="${priceNotSale.data}" var="sale">
                <div class = "col-3 product-item ">
                    <div class = "product-img">
                        <img src = "${base}/uploads/${sale.avatar}" width="100%" alt = "" class = "img-fluid d-block mx-auto">
                        <span class = "heart-icon">
                        <i class = "far fa-heart"></i>
                    </span>
                        <div class = "row btns w-100 mx-auto text-center">
                            <button onclick="AddToCart(${sale.id},${sale.quantity})" type = "button" class = "btn-sale col-6 py-2">
                                <i class="fas fa-shopping-cart"></i> Add To Cart
                            </button>
                            <a href="${base}/detail-product/${sale.seo}" type = "button" class = "col-6 py-2">
                                <i class = "fa fa-binoculars"></i> View
                            </a>
                        </div>
                    </div>

                    <div class = "product-info p-3">
                        <span class = "product-type">${sale.categories.name}</span>
                        <a href="${base}/detail-product/${sale.seo}" class = "d-block text-dark text-decoration-none py-2 product-name">${sale.title}</a>
                        <span class = "product-price-sale">
                            <fmt:setLocale value="vi_VN" scope="session" />
                            <fmt:formatNumber value="${sale.priceSale}" type="currency" />
                        </span>
                        <span class = "product-price">
                            <s>
                                <fmt:setLocale value="vi_VN" scope="session" />
                                <fmt:formatNumber value="${sale.price}" type="currency" />
                            </s>
                        </span>
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
        <div class="d-flex justify-content-center pagination-sale">
            <a  class="mr-3" onclick="${(priceNotSale.currentPage - 1 <= 0) ? 'return false;':''}" href="${base}/index?page=${(priceNotSale.currentPage - 1 <= 0) ? 1 :priceNotSale.currentPage - 1}#trending_product">
                <i style="${(priceNotSale.currentPage - 1 <= 0) ? 'color: #ccc':''}" class="fas fa-angle-left"></i>
            </a>
            <a onclick="${(priceNotSale.currentPage + 1 > total) ? 'return false;':''}" href="${base}/index?page=${(priceNotSale.currentPage + 1 > total) ? total :priceNotSale.currentPage + 1}#trending_product">
                <i style="${(priceNotSale.currentPage + 1 > total) ? 'color: #ccc':''}" class="fas fa-angle-right"></i>
            </a>
        </div>
        </div>
    </div>
    <!-- End Trending product-->

    <!-- Silon Blog-->
    <div class="silon_blog container">
        <div class="silon_blog_txt">
            Silon Blog
        </div>
        <div class="silon_blog_content">
            <div class="card-deck">
                <div class="cards">
                    <div class="card-body">
                        <img src="${base}/images/feared_01.png" class="card-img-top" alt=".366 452..">
                    </div>
                    <div class="silon_blog_info">
                        <div class="silon_blog_info_top">
                            <p class="info_time"><i class="fad fa-window-minimize"></i> 07 July, 2021</p>
                            <p>Were divided land his creature which have evening subdue</p>
                        </div>
                        <hr>
                        <div class="silon_blog_info_botton">
                            <p><i class="fal fa-box"></i> Computer the new</p>
                            <p><i class="far fa-comment-alt"></i> 3 Comments</p>
                        </div>
                    </div>
                </div>
                <div class="cards">
                    <div class="card-body">
                        <img src="${base}/images/feared_01.png" class="card-img-top" alt="...">
                    </div>
                    <div class="silon_blog_info">
                        <div class="silon_blog_info_top">
                            <p class="info_time"><i class="fad fa-window-minimize"></i> 07 July, 2021</p>
                            <p>Were divided land his creature which have evening subdue</p>
                        </div>
                        <hr>
                        <div class="silon_blog_info_botton">
                            <p><i class="fal fa-box"></i> Computer the new</p>
                            <p><i class="far fa-comment-alt"></i> 2 Comments</p>
                        </div>

                    </div>
                </div>
                <div class="cards">
                    <div class="card-body">
                        <img src="${base}/images/feared_01.png" class="card-img-top" alt=".366 452..">
                    </div>
                    <div class="silon_blog_info">
                        <div class="silon_blog_info_top">
                            <p class="info_time"><i class="fad fa-window-minimize"></i> 07 July, 2021</p>
                            <p>Were divided land his creature which have evening subdue</p>
                        </div>
                        <hr>
                        <div class="silon_blog_info_botton">
                            <p><i class="fal fa-box"></i> Computer the new</p>
                            <p><i class="far fa-comment-alt"></i> 2 Comments</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End Silon Blog-->
    </div>
    <!--End List Product-->

    <!--Top Reviews-->
    <div class="home_review">
        <div class="home_review_img">
            <div class="home_review_info">
                <span class="home_review_info_heading">Top Reviews</span>
                <span class="home_review_info_footer">Lorem, ipsum dolor sit amet consectetur adipisicing elit.
                        Quidem
                        blanditiis corrupti, tempore quod eos laboriosam? </span>
            </div>
            <div class="row home_review_list ml-2">
                <div class="col l-4 m-6 c-12">
                    <div class="home_review_item">
                        <img src="${base}/images/user-img-1.png" alt="" class="home_review_item_img">
                        <div class="home_review_item_info">
                            <a href="#" class="home-review__item-location">Computer Pro 1</a>
                            <div class="home_review_item_rating">
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                            </div>
                            <span class="home_review_item_desc">Lorem ipsum dolor sit amet consectetur adipisicing
                                    elit. Repellat non, ullam perspiciatis corporis quam</span>
                            <div class="home_review_item_name">Adam Index</div>
                        </div>
                    </div>
                </div>
                <div class="col l-4 m-6 c-12">
                    <div class="home_review_item">
                        <img src="${base}/images/user-img-2.png" alt="" class="home_review_item_img">

                        <div class="home_review_item_info">
                            <a href="#" class="home-review__item-location">Macbook air 2020</a>
                            <div class="home_review_item_rating">
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                            </div>
                            <span class="home_review_item_desc">Lorem ipsum dolor sit amet consectetur adipisicing
                                    elit. Architecto rerum illo maxime id nisi a quibusdam atque debitis, </span>
                            <div class="home_review_item_name">Charlie Puth</div>
                        </div>
                    </div>
                </div>
                <div class="col l-4 m-6 c-12">
                    <div class="home_review_item">
                        <img src="${base}/images/user-img-3.png" alt="" class="home_review_item_img">
                        <div class="home_review_item_info">
                            <a href="#" class="home-review__item-location">Holland Canals</a>
                            <div class="home_review_item_rating">
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                                <i class="home-review__item-rating-icon home-review__item-rating--active fas fa-star"></i>
                            </div>
                            <span class="home_review_item_desc">Lorem ipsum dolor sit amet consectetur adipisicing
                                    elit. Ea nam totam hic reprehenderit aspernatur </span>
                            <div class="home_review_item_name">Maroon 5</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="home_review_footer">
                <button class="dot dot_active"></button>
                <button class="dot "></button>
                <button class="dot "></button>
            </div>
        </div>
    </div>
    <!--End Top Reviews-->

    <!--Follow Us-->
    <section class="follow_us">
        <div class=" container">
            <div class="row">
                <div class="col">
                    <div class="follow_us_txt">
                        <h3>Follow Us</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <a href="#" class="follow_us_item">
                        <img src="${base}/images/follow_01.jpg" width="100%" alt="">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#" class="follow_us_item">
                        <img src="${base}/images/follow_03.jpg" width="100%" alt="">
                        <i class="fab fa-facebook"></i>
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#" class="follow_us_item">
                        <img src="${base}/images/follow_04.jpg" width="100%" alt="">
                        <i class="fab fa-pinterest"></i>

                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="#" class="follow_us_item">

                        <img src="${base}/images/follow_02.jpg" width="100%" alt="">
                        <i class="fab fa-twitter-square"></i>

                    </a>
                </div>
            </div>
        </div>
    </section>
    <!--End Follow Us-->
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
</body>

<%--<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>--%>
<script src="${base}/js/jquery.min.js"></script>
<script src = "${base}/vendor/jquery/jquery.js"></script>
<script src = "${base}/vendor/owl_carousel/owl.carousel.js"></script>
<script src="${base}/bootstrap/js/bootstrap.min.js"></script>
<script src="${base}/js/script.js"></script>
<script src="${base}/js/users.js"></script>
<script>
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 0,
        responsiveClass: true,
        responsive: {
            0:{
                items: 1,
            },
            768:{
                items: 2,
            },
            1100:{
                items: 3,
            },
            1400:{
                items: 4,
                loop: false,
            }
        }
    });
</script>


<!-- owl carousel -->
<script src="${base}/js/ajax.js"></script>

</html>