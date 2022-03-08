package com.devpro.shop15.controller.admin;

import com.devpro.shop15.DTO.ProductDTO;
import com.devpro.shop15.services.CategoryService;
import com.devpro.shop15.services.ProductService;
import com.devpro.shop15.entity.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller

public class ProductAdminController extends BaseAdminController {

	@Autowired
	private ProductService productService;


	@GetMapping("/admin/list/product")
	public String listProduct(Model model) {
		model.addAttribute("listProduct",this.productService.findAll());
		return "admin/table-product";
	}
	@GetMapping("/admin/create/product")
	public String create(Model model) {
		model.addAttribute("product",new Products());
		return "admin/create_product";
	}


	/*@GetMapping(value = "/admin/list/product-detail")
	public String listProductDetail(Model model){
		model.addAttribute("listProductDetail",productDetailService.findAll());
		return "/admin/table_product_detail";
	}*/
	/*@GetMapping(value = "/admin/create/product-detail")
	public String createProductDetail(Model model){
		model.addAttribute("productDetail",new ProductDetail());
		return "/admin/create_product_detail";
	}*/
	/*@PostMapping(value = "/admin/store/product-detail")
	public String storeOrUpdateDetail(@ModelAttribute("productDetail")ProductDetail productDetail){
		if (productDetail.getId() == null){
			productDetail.setCreatedDate(new Date());
			productDetailService.saveOrUpdate(productDetail);
		}else {
			productDetail.setUpdatedDate(new Date());
			productDetailService.saveOrUpdate(productDetail);
		}
		return "redirect:/admin/list/product-detail";
	}*/
	/*@GetMapping(value = "/admin/update/product-detail/{id}")
	public String updateProductDetail(@PathVariable("id") Integer id,Model model){
		ProductDetail productDetail = this.productDetailService.getById(id);
		model.addAttribute("productDetail",productDetail);
		return "/admin/create_product_detail";
	}*/


	@PostMapping("/admin/store/product")
	public  String storeOrUpdate(@ModelAttribute("product") Products products, HttpServletRequest request,
						 @RequestParam("avatarProduct") MultipartFile avatarPro,
						 @RequestParam("childAvatar1") MultipartFile[] childAvatar
								 ) throws Exception{
		String sale = request.getParameter("priceSale");
		System.out.println(sale);
		if(products.getId()==null || products.getId()==0){
			this.productService.add(products,avatarPro,childAvatar);
		}else {
			products.setUpdatedDate(new Date());
			this.productService.update(products,avatarPro,childAvatar);
		}
		return "redirect:/admin/list/product";
	}
	
	@GetMapping("/admin/edit/product/{id}")
	public String update(@PathVariable("id") Integer id,Model model) {
		Products products = this.productService.getById(id);
		model.addAttribute("product",products);
		return "admin/create_product";
	}

	//Ajax để tránh request lại trang
	@PostMapping(value = {"/admin/ajax/product"})
	public ResponseEntity<Map<String,Object>> ajax_Product(Model model, @RequestBody ProductDTO productDTO){
		Map<String,Object> jsonProduct = new HashMap<>();
		jsonProduct.put("code",200);
		jsonProduct.put("message",productDTO);
		return ResponseEntity.ok(jsonProduct);
	}

	@PostMapping(value = {"/admin/ajax/delete/product/{id}"})
	public ResponseEntity<Products> delete(Model model, @PathVariable("id") Integer id, HttpServletResponse response){
		Products products = this.productService.getById(id);
		if (products != null){
			if(products.getStatus() == true){
				products.setStatus(false);
				this.productService.saveOrUpdate(products);
			}else {
				response.setStatus(404);
				System.out.println(response.getStatus());
				return ResponseEntity.badRequest().build();
			}
		}else {
			System.out.println("Null");
		}
		return ResponseEntity.ok(products);
	}
}
