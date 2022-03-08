package com.devpro.shop15.services;

import com.devpro.shop15.DTO.OrdersSearchModel;
import com.devpro.shop15.DTO.ProductSearchModel;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.entity.SaleOrders;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class SaleOrderService extends BaseService<SaleOrders> {
    @Override
    protected Class<SaleOrders> clazz() {
        return SaleOrders.class;
    }

    public PagerData<SaleOrders> search(OrdersSearchModel ordersSearchModel, int size) {
        //Khởi tạo sql
        String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1 ";
        if (ordersSearchModel != null) {
            if (ordersSearchModel.getCode() != null){
                sql += " and s.code = "+ordersSearchModel.getCode();
            }
            if (ordersSearchModel.getStatusOrder() != null && ordersSearchModel.getIdUser() == null){
                if (ordersSearchModel.getStatusOrder() == 0){
                    sql += "and s.status_order = "+ordersSearchModel.getStatusOrder()+" ORDER BY s.id DESC ";
                }else {
                    sql += " and s.status_order = "+ordersSearchModel.getStatusOrder();
                }
            }
            if (ordersSearchModel.getIdUser() != null && ordersSearchModel.getStatusOrder() == null){
                sql += "and s.user_id = "+ordersSearchModel.getIdUser()+" ORDER BY s.id DESC ";
            }
            if (ordersSearchModel.getIdUser() != null && ordersSearchModel.getStatusOrder() != null){
                sql += "and s.user_id = "+ordersSearchModel.getIdUser()+" and s.status_order= "+ordersSearchModel.getStatusOrder()+" ORDER BY s.id DESC ";
            }

            if(!StringUtils.isEmpty(ordersSearchModel.getKeyword())){
                int status = 0;
                if (ordersSearchModel.getStatusOrder() != null){
                    status = ordersSearchModel.getStatusOrder();
                }
                if (status == 0){
                    sql+="  and ( s.status_order = " + status + " ) and ( s.customer_name like '%"+ordersSearchModel.getKeyword()+"%' or s.customer_address like '%"+
                            ordersSearchModel.getKeyword()+"%' or s.code like '%"+
                            ordersSearchModel.getKeyword()+"%' or s.customer_phone like '%"+
                            ordersSearchModel.getKeyword()+"%' or s.customer_email like '%"+ordersSearchModel.getKeyword()+"%')"+" ORDER BY s.id DESC ";
                }else {
                    sql+="  and ( s.status_order = " + status + " ) and ( s.customer_name like '%"+ordersSearchModel.getKeyword()+"%' or s.customer_address like '%"+
                            ordersSearchModel.getKeyword()+"%' or s.code like '%"+
                            ordersSearchModel.getKeyword()+"%' or s.customer_phone like '%"+
                            ordersSearchModel.getKeyword()+"%' or s.customer_email like '%"+ordersSearchModel.getKeyword()+"%')";
                }

            }

        }
        //Chỉ lấy sản phẩm chưa xóa
        //sql + = p.status =1
        return runTransactQuerySQL(sql, ordersSearchModel == null ? 0 : ordersSearchModel.getPage(), size);
    }
    public SaleOrders getByUser(Integer idAccount){
        String sql = "SELECT * FROM tbl_saleorder s WHERE 1=1 ";
        if (idAccount!= null){
            sql += "and s.status = -2 and s.user_id = "+idAccount;
        }
        List<SaleOrders> saleOrders = runTransactQuerySQL(sql, 0, 0).getData();
        if (saleOrders==null || saleOrders.size()<=0) return null;
        return saleOrders.get(0);
    }
    public List<SaleOrders> getByMonth(){
        String sql = "SELECT * FROM dbshop_devpro_02.tbl_saleorder s where month(s.finish_date) = month(curdate());";

        return runTransactQuerySQL(sql,0, 0).getData();
    }
    public List<SaleOrders> getByYear(){
        String sql = "SELECT * FROM dbshop_devpro_02.tbl_saleorder s where YEAR(s.finish_date) = YEAR(curdate());";

        return runTransactQuerySQL(sql,0, 0).getData();
    }
}
