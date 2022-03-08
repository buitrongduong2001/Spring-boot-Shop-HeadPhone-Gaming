package com.devpro.shop15.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "tbl_category")
public class Categories extends BaseEntity {
    //nullable => cho trạng thái Not null => false => là ko đc null (not null)
    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Column(name = "description", length = 100, nullable = false)
    private String description;

    @Column(name = "seo", length = 100, nullable = true)
    private String seo;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "parent_id")
    private Categories parent;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "parent")
    private Set<Categories> childs = new HashSet<>();

    //fetch = FetchType.LAZY => Nó không truy vấn lấy hết thằng Product Liên quan nữa
    //cascade = CascadeType.ALL => Khi thêm mới thằng Cate thì Product cũng thêm mới, nếu xóa thì thằng Product cũng bị xóa
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "categories")
    private Set<Products> listProduct = new HashSet<Products>();

    //Phía oneToMany cẩn định nghĩa 2 method
    //Hỗ trợ CRUD
    public void addProducts(Products products){
        this.listProduct.add(products);
        products.setCategories(this);
    }
    public void deleteProduct(Products products){
        this.listProduct.remove(products);
        products.setCategories(null);
    }

    public void  addChild(Categories categories){
        this.childs.add(categories);
        categories.setParent(this);
    }
    public void deleteChild(Categories categories){
        this.childs.remove(categories);
        categories.setParent(null);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSeo() {
        return seo;
    }

    public void setSeo(String seo) {
        this.seo = seo;
    }

    public Categories getParent() {
        return parent;
    }

    public void setParent(Categories parent) {
        this.parent = parent;
    }

    public Set<Categories> getChilds() {
        return childs;
    }

    public void setChilds(Set<Categories> childs) {
        this.childs = childs;
    }

    public Set<Products> getListProduct() {
        return listProduct;
    }

    public void setListProduct(Set<Products> listProduct) {
        this.listProduct = listProduct;
    }
}
