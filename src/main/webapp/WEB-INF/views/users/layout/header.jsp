<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<header class="header">
        <div class="grid">
            <nav class="container_top">
                <div class="logo">
                    <a href="#" class="header_item_link_logo">Silon<span>.</span></a>
                </div>

                <ul class="nav text-uppercase menu_bar">
                    <li class="header_item nav-item ">
                        <a class=" active header_navbar_item_link" href="${base}/index">Home</a>
                    </li>
                    <li class="header_item nav-item ">
                        <a class="header_navbar_item_link" href="${base}/danh-sach-san-pham">Shop</a>
                        <div class="header_subnav">
                            <ul class="header_subnav_list">
                                <li class="header_subnav_item">
                                    <a href="#" class="header_subnav_item_link">Category 1</a>
                                </li>
                                <li class="header_subnav_item">
                                    <a href="#" class="header_subnav_item_link">Category 2</a>
                                </li>
                                <li class="header_subnav_item">
                                    <a href="#" class="header_subnav_item_link">Category 3</a>
                                </li>
                                <li class="header_subnav_item">
                                    <a href="#" class="header_subnav_item_link">Category 4</a>
                                </li>
                                <li class="header_subnav_item">
                                    <a href="#" class="header_subnav_item_link">Category 5</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="header_item nav-item">
                        <a class=" header_navbar_item_link" href="#">Blog</a>
                    </li>
                    <li class="header_item nav-item">
                        <a class=" header_navbar_item_link" href="#">Product</a>
                    </li>
                    <li class="header_item nav-item">
                        <a class=" header_navbar_item_link" href="#">Brands</a>
                    </li>
                    <li class="header_item nav-item">
                        <a class=" header_navbar_item_link" href="#">Contact</a>
                    </li>
                </ul>

                <div class="icon">
                    <div class="search px-md-2">
                        <form action="${base}/tim-kiem" method="get">
                            <div class="search-input">
                                <div class="icon-search">
                                <span>
                                    <i class="fas fa-search"></i>
                                </span>
                                </div>
                                <div class="input">
                                    <input type="text" placeholder="Tìm kiếm sản phẩm..." name="keyword" id="mysearch">
                                </div>
                                <button type="submit" class="submit-search">Tìm</button>
                            </div>
                        </form>

                        <div class="t-popover__pane" id="pane-list-search">
                            <div class="w-full bg-white p-3 rounded-xl shadow-2">
                                <section>
                                    <span id="quantity-pro-header" class="text-label font-extrabold uppercase">Tìm thấy (0)</span>
                                    <div class="space-y-2 mt-2" id="list-product-search-header">
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                    <div class="cart position-relative px-md-2">
                        <span>
                            <a href="${base}/cart/view" class="cart_link" style="color: #000;">
                                <i class="fas fa-shopping-cart"></i>
                            </a>
                        </span>
                        <span id="total-cart" class="sl position-absolute">${totalItems}</span>
                    </div>
                    <div class="account position-relative px-md-2 ">
                        <a href="#" >
                            <span><i class="fas fa-user"></i></span>
                        </a>
                        <div class="wrap-fill wrap-fill-account ">
                            <ul class="list-action-logout">
                                <c:choose>
                                    <c:when test="${empty account}">
                                        <li class="px-4 py-3 li-logout">
                                            <h3>
                                                <a href="${base}/login" class="login block">
                                                    Đăng Nhập
                                                </a>
                                            </h3>
                                        </li>
                                        <li class="px-4 py-3 li-register">
                                            <h3>
                                                <a href="#" class="login block">
                                                    Tạo Tài Khoản
                                                </a>
                                            </h3>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="px-4 py-3">
                                            <h3>
                                                <a href="${base}/manager-user" class="block">
                                                    <span><i class="far fa-user-circle"></i></span>  Tài khoản
                                                </a>
                                            </h3>
                                        </li>
                                        <li class="px-4 py-3 ">
                                            <h3>
                                                <a href="${base}/list-order" class=" block">
                                                    <span><i class="fas fa-list"></i></span> Đơn hàng
                                                </a>
                                            </h3>
                                        </li>
                                        <li class="px-4 py-3 ">
                                            <h3>
                                                <a href="${base}/logout" class=" block">
                                                    <span><i class="fas fa-sign-out-alt"></i></span> Đăng xuất
                                                </a>
                                            </h3>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- End Header -->