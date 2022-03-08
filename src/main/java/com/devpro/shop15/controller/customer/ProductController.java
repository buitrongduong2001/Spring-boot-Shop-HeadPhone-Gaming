package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.ProductSearchModel;
//import com.devpro.shop15.entity.ProductDetail;
import com.devpro.shop15.entity.Products;
//import com.devpro.shop15.services.ProductDetailService;
import com.devpro.shop15.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class ProductController extends BaseCustomerController {

	@Autowired
	private ProductService productService;
//	@Autowired private ProductDetailService productDetailService;



	@GetMapping(value = "/detail-product/{seo}")
	public String detailProduct(@PathVariable("seo") String seo, Model model){
		setHeaderSession(model);
		ProductSearchModel searchModel = new ProductSearchModel();
		searchModel.setSeo(seo);
		List<Products> list = productService.search(searchModel,0).getData();
		if (list.size() == 0){
			return "redirect:/index";
		}
		Products products = list.get(0);
//		List<ProductDetail> listSize = products.getProductDetails().stream().map(ProductDetail::getId).sorted().collect(Collectors.toList());
//		List<ProductDetail> listDetail = products.getProductDetails().stream().collect(Collectors.toList());
//		model.addAttribute("listDetail",listDetail);
		model.addAttribute("product",products);
		return "users/detail";
	}
	@PostMapping(value = "/ajax/product-detail")
	public ResponseEntity<Map<String,Object>> getQuantity(HttpServletRequest request){
		String id = request.getParameter("idDetail");
//		ProductDetail productDetail = this.productDetailService.getById(Integer.parseInt(id));
		Map<String,Object> map = new HashMap<>();
//		map.put("productDetail",productDetail);
		return ResponseEntity.ok(map);
	}
}
