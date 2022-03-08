package com.devpro.shop15.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;


@NoArgsConstructor
@AllArgsConstructor


@Entity
@Table(name = "tbl_saleorder_products")
public class SaleOrderProducts extends BaseEntity {

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "saleorder_id")
    private SaleOrders saleOrders;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Products products;

    /*@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_detail")
    private ProductDetail productDetails;*/

    @Column(name = "quality", nullable = false)
    private Integer quality;

    public SaleOrders getSaleOrders() {
        return saleOrders;
    }

    public void setSaleOrders(SaleOrders saleOrders) {
        this.saleOrders = saleOrders;
    }

    public Products getProducts() {
        return products;
    }

    public void setProducts(Products products) {
        this.products = products;
    }

    public Integer getQuality() {
        return quality;
    }

    public void setQuality(Integer quality) {
        this.quality = quality;
    }
}
