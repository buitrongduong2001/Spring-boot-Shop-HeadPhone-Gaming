package com.devpro.shop15.services;

import com.devpro.shop15.entity.ProductsImages;
import org.springframework.stereotype.Service;

@Service
public class ProductImagesService extends BaseService<ProductsImages> {

    @Override
    protected Class<ProductsImages> clazz() {
        return ProductsImages.class;
    }
}
