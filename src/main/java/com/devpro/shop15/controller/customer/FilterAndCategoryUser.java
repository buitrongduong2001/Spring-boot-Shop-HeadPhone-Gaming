package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.ProductSearchModel;
import com.devpro.shop15.controller.admin.BaseAdminController;
import com.devpro.shop15.services.CategoryService;
import com.devpro.shop15.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;

@Controller
public class FilterAndCategoryUser extends BaseCustomerController {

    @Autowired
    private ProductService productService;
    @Autowired private CategoryService categoryService;
    @GetMapping(value = "/danh-sach-san-pham")
    public String getListCategory(Model model, HttpServletRequest request){
        setHeaderSession(model);
        String parent = request.getParameter("parent");
        String loc = request.getParameter("exampleRadios");

        if (parent == null && loc == null ){
            ProductSearchModel searchModel = new ProductSearchModel();
            searchModel.setPage(getCurrentPage(request));
            model.addAttribute("productModel",productService.search(searchModel,9));
//            model.addAttribute("products",this.productService.findAll());
        }else if (parent != null && loc == null){
            ProductSearchModel searchModel = new ProductSearchModel();
            searchModel.setPage(getCurrentPage(request));
            searchModel.setCategoryId(Integer.parseInt(parent));
            model.addAttribute("productModel",productService.search(searchModel,9));
        } else if (parent != null && loc != null){
            System.out.println("Khac null roif");
            ProductSearchModel searchModel = new ProductSearchModel();
            searchModel.setPage(getCurrentPage(request));
            searchModel.setCategoryId(Integer.parseInt(parent));
            Integer locInt = Integer.parseInt(loc);
            if (locInt==1){
                searchModel.setPriceStart(new BigDecimal(1000000));
                searchModel.setPriceEnd(new BigDecimal(5000000));
            }else if (locInt==2){
                searchModel.setPriceStart(new BigDecimal(5000000));
                searchModel.setPriceEnd(new BigDecimal(10000000));
            }else if (locInt==3){
                searchModel.setPriceStart(new BigDecimal(10000000));
                searchModel.setPriceEnd(new BigDecimal(25000000));
            }else if (locInt==4){
                searchModel.setPriceStart(new BigDecimal(25000000));
                searchModel.setPriceEnd(new BigDecimal(60000000));
            }
            model.addAttribute("productModel",productService.search(searchModel,9));
        }else {
            ProductSearchModel searchModel = new ProductSearchModel();
            Integer locInt = Integer.parseInt(loc);
            if (locInt==1){
                searchModel.setPriceStart(new BigDecimal(1000000));
                searchModel.setPriceEnd(new BigDecimal(5000000));
            }else if (locInt==2){
                searchModel.setPriceStart(new BigDecimal(5000000));
                searchModel.setPriceEnd(new BigDecimal(10000000));
            }else if (locInt==3){
                searchModel.setPriceStart(new BigDecimal(10000000));
                searchModel.setPriceEnd(new BigDecimal(25000000));
            }else if (locInt==4){
                searchModel.setPriceStart(new BigDecimal(25000000));
                searchModel.setPriceEnd(new BigDecimal(60000000));
            }
            searchModel.setPage(getCurrentPage(request));
            model.addAttribute("productModel",productService.search(searchModel,9));
        }
        //Lấy ra list category head phone gaming parentId = 1
        model.addAttribute("listCate",this.categoryService.getCateHeadPhoneGaming());
        return "users/categories";
    }
}
