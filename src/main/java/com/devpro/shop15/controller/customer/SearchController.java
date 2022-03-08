package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.ProductSearchModel;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.services.CategoryService;
import com.devpro.shop15.services.ProductService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Controller
public class SearchController extends BaseCustomerController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService categoryService;

    @GetMapping(value = "/tim-kiem")
    public String getSearch(HttpServletRequest request, Model model){
        setHeaderSession(model);
        String parent = request.getParameter("parent");
        String loc = request.getParameter("exampleRadios");
        String key = request.getParameter("keyword");

        if (parent == null && loc == null ){
            ProductSearchModel searchModel = new ProductSearchModel();
            searchModel.setPage(getCurrentPage(request));
            searchModel.setKeyword(key);
            model.addAttribute("productModel",productService.search(searchModel,9));
//            model.addAttribute("products",this.productService.findAll());
        }else if (parent != null && loc == null){
            ProductSearchModel searchModel = new ProductSearchModel();
            searchModel.setPage(getCurrentPage(request));
            searchModel.setCategoryId(Integer.parseInt(parent));
            searchModel.setKeyword(key);
            model.addAttribute("productModel",productService.search(searchModel,9));
        } else if (parent != null && loc != null){
            ProductSearchModel searchModel = new ProductSearchModel();
            searchModel.setPage(getCurrentPage(request));
            searchModel.setCategoryId(Integer.parseInt(parent));
            searchModel.setKeyword(key);
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
            searchModel.setKeyword(key);
            model.addAttribute("productModel",productService.search(searchModel,9));
        }
        //Lấy ra list category head phone gaming parentId = 1
        model.addAttribute("listCate",this.categoryService.getCateHeadPhoneGaming());
        return "users/search";
    }


    @PostMapping(value = "/ajax/search/customer")
    public ResponseEntity<List<Products>> getListProductSearch(HttpServletRequest request){
        String keyword = request.getParameter("keyword");
        ProductSearchModel productSearchModel = new ProductSearchModel();
        if (keyword != null && !keyword.equals(" ") && !keyword.equals("")){
            productSearchModel.setKeyword(keyword);
        }
        System.out.println(productSearchModel.getKeyword());
        List<Products> productsList = new ArrayList<>();
        if (productSearchModel.getKeyword() != null){
            productsList = this.productService.search(productSearchModel,0).getData();
        }
        return ResponseEntity.ok(productsList);
    }
}
