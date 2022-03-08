//package com.devpro.shop15.entity;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "tbl_product_detail")
//public class ProductDetail extends BaseEntity {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "id", nullable = false)
//    private Integer id;
//
//    @Column(name = "description", length = 10)
//    private String description;
//    
//
//    @Column(name = "quantity_store")
//    private Integer quantityStore;
//
//
//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "product_id")
//    private Products products;
//
//    public Products getProducts() {
//        return products;
//    }
//
//    public void setProducts(Products products) {
//        this.products = products;
//    }
//
//    public Integer getQuantityStore() {
//        return quantityStore;
//    }
//
//    public void setQuantityStore(Integer quantityStore) {
//        this.quantityStore = quantityStore;
//    }
//
//
//    public String getDescription() {
//        return description;
//    }
//
//    public void setDescription(String description) {
//        this.description = description;
//    }
//
//    public Sizes getSizes() {
//        return sizes;
//    }
//
//    public void setSizes(Sizes sizes) {
//        this.sizes = sizes;
//    }
//
//    public Integer getId() {
//        return id;
//    }
//
//    public void setId(Integer id) {
//        this.id = id;
//    }
//}