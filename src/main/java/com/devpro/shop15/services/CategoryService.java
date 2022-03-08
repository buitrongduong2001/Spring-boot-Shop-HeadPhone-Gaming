package com.devpro.shop15.services;

import com.devpro.shop15.DTO.CategorySearchModel;
import com.devpro.shop15.entity.Categories;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
public class CategoryService extends BaseService<Categories>{

    @Override
    protected Class<Categories> clazz() {
        return Categories.class;
    }

    public PagerData<Categories> search(CategorySearchModel searchModel){
        //Khởi tạo sql
        String sql = "SELECT * FROM tbl_category c WHERE 1=1 ";
        if(searchModel != null){
            //Tim Kiếm Theo Category
            if(searchModel.getCategoryId() != null){
                sql+="and c.id = " + searchModel.getCategoryId();
            }
            //Tìm kiếm theo search Text
            if(!StringUtils.isEmpty(searchModel.getKeyword())){
                sql+= "and (c.name like '%"+searchModel.getKeyword()+"%')";
            }
        }
        //Chỉ lấy sản phẩm chưa xóa
         //sql + = p.status =1
        return runTransactQuerySQL(sql,searchModel==null ? 0 : searchModel.getPage(),5);
    }

    public PagerData<Categories> getParentCate(){
        String sql = "SELECT * FROM tbl_category c WHERE c.parent_id is null ";
        return runTransactQuerySQL(sql,0,1);
    }
    public List<Categories> getCateHeadPhoneGaming(){
        String sql = "SELECT * FROM tbl_category c WHERE c.parent_id = 1 ";
        return runTransactQuerySQL(sql,0,0).getData();
    }
}
