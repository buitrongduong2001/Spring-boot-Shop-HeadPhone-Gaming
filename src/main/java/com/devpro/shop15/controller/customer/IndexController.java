package com.devpro.shop15.controller.customer;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.devpro.shop15.DTO.Letters;
import com.devpro.shop15.DTO.ProductSearchModel;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.services.PagerData;
import com.devpro.shop15.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

//Controller là 1 bean (Bean controller)
@Controller
public class IndexController extends BaseCustomerController {


	@Autowired
	private ProductService productService;



	@RequestMapping(value = {"/index"}, method = RequestMethod.GET)
	public String index(Model model, final HttpServletRequest request,
						final HttpServletResponse response) throws IOException {
		ProductSearchModel searchModel = new ProductSearchModel();
		//Thực hiện lấy ra sản phẩm đang sale
		setHeaderSession(model);
		searchModel.setPriceSale(true);
		if(searchModel.getPriceSale()){
			PagerData<Products> pagerData = this.productService.search(searchModel,0);
			Integer total = 0;
			if((pagerData.getData().size())%8 == 0){
				total = (pagerData.getData().size())/8;
			}else {
				total = ((pagerData.getData().size())/8)+1;
			}
			model.addAttribute("total",total);
			searchModel.setPage(getCurrentPage(request));

			model.addAttribute("priceNotSale",this.productService.search(searchModel,8));
		}

		//Lấy ra sản phẩm đang Hot
		if (searchModel.getPriceSale() != null){
			searchModel.setPriceSale(null);
			searchModel.setIsHot(true);
			searchModel.setPage(getCurrentPageHot(request));
			model.addAttribute("listIsHot",this.productService.search(searchModel,0));
		}


		return "users/index";
	}



	@PostMapping(value = "/user/letter/ajax")
	public ResponseEntity<Map<String,Object>> letter(@RequestBody Letters letters){
		System.out.println(letters.getEmail());
		Map<String,Object> map = new HashMap<>();
		map.put("code",200);
		map.put("message",letters);
		return ResponseEntity.ok(map);
	}
	
}	
