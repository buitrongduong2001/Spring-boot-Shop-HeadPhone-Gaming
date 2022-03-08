package com.devpro.shop15.DTO;

import com.devpro.shop15.entity.Products;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@NoArgsConstructor
@AllArgsConstructor
public class ProductsImagesDTO extends BaseDTO{
    private String title;

    private String path;

    private ProductDTO products;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public ProductDTO getProducts() {
        return products;
    }

    public void setProducts(ProductDTO products) {
        this.products = products;
    }
}
