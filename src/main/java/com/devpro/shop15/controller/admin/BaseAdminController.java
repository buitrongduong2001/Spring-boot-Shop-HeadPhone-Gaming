package com.devpro.shop15.controller.admin;

import com.devpro.shop15.entity.Categories;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.services.CategoryService;
//import com.devpro.shop15.services.SizesService;
import com.devpro.shop15.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public abstract class BaseAdminController {
    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ProductService productService;

//    @Autowired private SizesService sizesService;

    @ModelAttribute("categories")
    public List<Categories> listCate(){

        return this.categoryService.findAll();
    }
    @ModelAttribute("listProduct")
    public List<Products> productsList(){
        return this.productService.findAll();
    }

//    @ModelAttribute("listSizes")
//    public List<Sizes> sizesList(){
//        return this.sizesService.findAll();
//    }
    //Lấy current page page, ko có thì mặc định là 1
    public int getCurrentPage(HttpServletRequest request){
        try {
            return Integer.parseInt(request.getParameter("page"));
        }catch (Exception e){
            return 1;
        }
    }
    public int getCurrentPageHot(HttpServletRequest request){
        try {
            return Integer.parseInt(request.getParameter("pageHot"));
        }catch (Exception e){
            return 1;
        }
    }
}
