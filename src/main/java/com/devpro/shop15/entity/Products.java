package com.devpro.shop15.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.servlet.annotation.MultipartConfig;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_products")
public class Products extends BaseEntity {

    @Column(name = "title", length = 1000, nullable = false)
    private String title;

    //Cach 1: columnDefinition = "DECIMAL(13,2)"
    @Column(name = "price",precision = 13, scale = 2, nullable = false)
    private BigDecimal price;

    @Column(name = "price_sale",precision = 13, scale = 2, nullable = true)
    private BigDecimal priceSale;

    @Column(name = "short_description", length = 3000, nullable = false)
    private String shortDescription;

    @Lob
    @Column(name = "detail_description", columnDefinition = "LONGTEXT", nullable = false)
    private String detailDescription;

    @Column(name = "avatar",nullable = true, length = 200)
    private String  avatar;

    @Column(name = "is_hot", nullable = true)
    private Boolean isHot = Boolean.TRUE;

    @Column(name = "seo", nullable = true,length = 1000)
    private String seo;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;
    //fetch = FetchType.EAGER => để truy vấn đến thằng Category
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Categories categories;

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "products")
    private Set<ProductsImages> productsImages = new HashSet<>();

   /* @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "products")
    private Set<ProductDetail> productDetails = new HashSet<>();*/

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "products")
    private Set<SaleOrderProducts> saleOrderProducts = new HashSet<>();

    //Entity SaleOrderProducts
    public void addSaleOrderProducts(SaleOrderProducts saleOrderProducts){
        this.saleOrderProducts.add(saleOrderProducts);
        saleOrderProducts.setProducts(this);
    }
    public void deleteSaleOrderProducts(SaleOrderProducts saleOrderProducts){
        this.saleOrderProducts.remove(saleOrderProducts);
        saleOrderProducts.setProducts(null);
    }


    //Entity Products Images
    public void addProductImg(ProductsImages productsImages){
        this.productsImages.add(productsImages);
        productsImages.setProducts(this);
    }
    public void removeProductImg(ProductsImages productsImages){
        this.productsImages.remove(productsImages);
        productsImages.setProducts(null);
    }
    /*//Entity Products Detail
    public void addProductDetail(ProductDetail productDetail){
        this.productDetails.add(productDetail);
        productDetail.setProducts(this);
    }
    public void removeProductDetail(ProductDetail productDetail){
        this.productDetails.remove(productDetail);
        productDetail.setProducts(null);
    }

    public Set<ProductDetail> getProductDetails() {
        return productDetails;
    }

    public void setProductDetails(Set<ProductDetail> productDetails) {
        this.productDetails = productDetails;
    }*/

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(BigDecimal priceSale) {
        this.priceSale = priceSale;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getDetailDescription() {
        return detailDescription;
    }

    public void setDetailDescription(String detailDescription) {
        this.detailDescription = detailDescription;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Boolean getHot() {
        return isHot;
    }

    public void setHot(Boolean hot) {
        isHot = hot;
    }

    public Categories getCategories() {
        return categories;
    }

    public void setCategories(Categories categories) {
        this.categories = categories;
    }

    public Set<ProductsImages> getProductsImages() {
        return productsImages;
    }

    public void setProductsImages(Set<ProductsImages> productsImages) {
        this.productsImages = productsImages;
    }

    public Set<SaleOrderProducts> getSaleOrderProducts() {
        return saleOrderProducts;
    }

    public void setSaleOrderProducts(Set<SaleOrderProducts> saleOrderProducts) {
        this.saleOrderProducts = saleOrderProducts;
    }
}
