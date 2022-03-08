//package com.devpro.shop15.services;
//
//import com.devpro.shop15.entity.ProductDetail;
//import org.springframework.stereotype.Service;
//
//import javax.transaction.Transactional;
//
//@Service
//public class ProductDetailService extends BaseService<ProductDetail>{
//
//    @Override
//    protected Class<ProductDetail> clazz() {
//        return ProductDetail.class;
//    }
//
//    /*
//     * Add new Product Detail
//     *
//     * @param productDetail
//     * @param IllegalStateException
//     * **/
//    @Transactional
//    public ProductDetail add(ProductDetail productDetail) throws IllegalStateException{
//
//        return super.saveOrUpdate(productDetail);
//    }
//
//
//
//}
