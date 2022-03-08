package com.devpro.shop15.DTO;

import com.devpro.shop15.entity.Categories;
import com.devpro.shop15.entity.Products;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
public class CategoriesDTO extends BaseDTO {
    private String name;

    private String description;

    private String seo;

    private Categories parent;

    private Set<CategoriesDTO> childs = new HashSet<>();

    private Set<ProductDTO> listProduct = new HashSet<ProductDTO>();

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

    public Set<CategoriesDTO> getChilds() {
        return childs;
    }

    public void setChilds(Set<CategoriesDTO> childs) {
        this.childs = childs;
    }

    public Set<ProductDTO> getListProduct() {
        return listProduct;
    }

    public void setListProduct(Set<ProductDTO> listProduct) {
        this.listProduct = listProduct;
    }
}
