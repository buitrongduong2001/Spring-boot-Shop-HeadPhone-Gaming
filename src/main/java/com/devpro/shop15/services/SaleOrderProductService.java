package com.devpro.shop15.services;

import com.devpro.shop15.DTO.OrdersSearchModel;
import com.devpro.shop15.DTO.SaleOrderProductsSearchModel;
import com.devpro.shop15.entity.SaleOrderProducts;
import com.devpro.shop15.entity.SaleOrders;
import org.springframework.stereotype.Service;

@Service
public class SaleOrderProductService extends BaseService<SaleOrderProducts> {

    @Override
    protected Class<SaleOrderProducts> clazz() {
        return SaleOrderProducts.class;
    }

    public PagerData<SaleOrderProducts> search(SaleOrderProductsSearchModel searchModel, int size) {
        String sql = "SELECT * FROM tbl_saleorder_products s WHERE 1=1 ";
        if (searchModel != null){
            if (searchModel.getIdSaleOrder() != null){
                sql += "and s.saleorder_id = "+searchModel.getIdSaleOrder();
            }
        }
        return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage(), size);
    }
}
