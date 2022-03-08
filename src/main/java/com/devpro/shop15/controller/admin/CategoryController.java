package com.devpro.shop15.controller.admin;

import com.devpro.shop15.DTO.CategorySearchModel;
import com.devpro.shop15.entity.Categories;
import com.devpro.shop15.services.CategoryService;
import com.devpro.shop15.services.PagerData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class CategoryController extends BaseAdminController {

	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/list/categories")
	public String list(Model model, HttpServletRequest request) {
		model.addAttribute("listCategory",this.categoryService.findAll());
		CategorySearchModel searchModel = new CategorySearchModel();
		searchModel.setKeyword(request.getParameter("keyword"));
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("catePage",categoryService.search(searchModel));
		return "admin/table_category";
	}
	
	@GetMapping("/create/catrgory")
	public String create(Model model) {
		PagerData<Categories> list = this.categoryService.getParentCate();
		model.addAttribute("category",new Categories());
		model.addAttribute("listParent",this.categoryService.findAll());
		return "admin/create_category";
	}
	@GetMapping("/edit/category/{id}")
	public String edit(Model model, @PathVariable("id") Integer id){
		Categories categories = this.categoryService.getById(id);
		model.addAttribute("category",categories);
		return "admin/create_category";
	}
	
	@PostMapping("/store/category")
	public String storeOrUpdate(@ModelAttribute("category") Categories categories) {
		if (categories.getId()==null){
			categories.setCreatedDate(new Date());
			if(categories.getParent() != null){
				if (categories.getParent().getId()==null){
					categories.setParent(null);
				}
			}
			this.categoryService.saveOrUpdate(categories);
		}else {
			categories.setUpdatedDate(new Date());
			if (categories.getParent().getId()==null){
				categories.setParent(null);
			}
			this.categoryService.saveOrUpdate(categories);
		}
		return "redirect:/admin/list/categories";
	}

	
}
