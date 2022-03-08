package com.devpro.shop15.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "tbl_products_images")
public class ProductsImages extends BaseEntity {

    @Column(name = "title", length = 500, nullable = false)
    private String title;

    @Column(name = "path", length = 200, nullable = false)
    private String path;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    private Products products;
}
