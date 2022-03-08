package com.devpro.shop15.controller.customer;

import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.CategoryService;
import com.devpro.shop15.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

public abstract class BaseCustomerController {
    @Autowired
    private CategoryService categoryService;
    @Autowired private UserService accountService;

    public void setHeaderSession(Model model) {
        model.addAttribute("cate_all", categoryService.findAll());
        model.addAttribute("cate_gaming", categoryService.getCateHeadPhoneGaming());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            String name = auth.getName();
            Users accountVO = this.accountService.loadUserByUsername(name);
            model.addAttribute("account",accountVO);
        }
    }
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
