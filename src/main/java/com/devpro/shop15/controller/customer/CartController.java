package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.CartItem;
import com.devpro.shop15.DTO.Carts;
//import com.devpro.shop15.entity.ProductDetail;
import com.devpro.shop15.entity.Products;
//import com.devpro.shop15.services.ProductDetailService;
import com.devpro.shop15.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController extends BaseCustomerController {

	@Autowired
	private ProductService productService;

//	@Autowired
//	private ProductDetailService productDetailService ;

	@GetMapping(value = "/view")
	public String viewCart(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		setHeaderSession(model);
		Carts carts = (Carts) session.getAttribute("yourCart");
		if (carts !=null){
			model.addAttribute("listCart",carts);
			HttpSession httpSession = request.getSession();
			model.addAttribute("totalItems",httpSession.getAttribute("totalItems"));
		}else {
			model.addAttribute("error","Không có sản phẩm nào trong giỏ hàng");
		}

		return "users/cart";
	}
/*	@PostMapping(value = "/ajax/updateCart")
	public ResponseEntity<Map<String,Object>> updateCart(@RequestBody CartItem cartItem,HttpServletRequest request){

		Map<String,Object> map = new HashMap<>();

		return ResponseEntity.ok(map);
	}*/
	@PostMapping(value = "/ajax/addToCart")
	public ResponseEntity<Map<String,Object>> addToCart(@RequestBody CartItem cartItem, HttpServletRequest request){
		HttpSession httpSession = request.getSession();
		Carts carts = null;
		if(httpSession.getAttribute("yourCart") != null){
			carts = (Carts) httpSession.getAttribute("yourCart");
		}else {
			carts = new Carts();
			httpSession.setAttribute("yourCart",carts);
		}

		//Lấy ra danh sách trong giỏ hàng
		List<CartItem> itemList = carts.getCartItems();
//		cartItem.setTotalPrice( * cartItem.getPriceUnit());
		//Kiểm tra nếu có trong giỏ hàng thì tăng quantity lên
		BigDecimal totalPriceCart = BigDecimal.ZERO;
		boolean isExists = false;
		for (CartItem item: itemList) {
			if (item.getProductId() == cartItem.getProductId()){
				isExists = true;
				item.setQuantity(item.getQuantity() + cartItem.getQuantity());
				BigDecimal quantity = BigDecimal.valueOf(item.getQuantity());
				BigDecimal total = quantity.multiply(item.getPriceUnit());
				item.setTotalPrice(total);
			}
			totalPriceCart = totalPriceCart.add(item.getTotalPrice());
		}
		//Nếu sản phẩm chưa có trong giỏ hàng
		if (!isExists){
			Products products;

			products = this.productService.getById(cartItem.getProductId());

			cartItem.setProductName(products.getTitle());
			cartItem.setQuantityStore(products.getQuantity());
			if (products.getPriceSale() == null){
				cartItem.setPriceUnit(products.getPrice());
				BigDecimal quantity = BigDecimal.valueOf(cartItem.getQuantity());
				BigDecimal total1 = quantity.multiply(cartItem.getPriceUnit());
				cartItem.setTotalPrice(total1);
			}else {
				cartItem.setPriceUnit(products.getPriceSale());
				cartItem.setPriceUnitSale(products.getPrice());
				BigDecimal quantity = BigDecimal.valueOf(cartItem.getQuantity());
				BigDecimal total2 = quantity.multiply(cartItem.getPriceUnit());
				cartItem.setTotalPrice(total2);
			}
			cartItem.setAvatarProduct(products.getAvatar());
			totalPriceCart = totalPriceCart.add(cartItem.getTotalPrice());
			carts.getCartItems().add(cartItem);
		}
		carts.setTotalPrice(totalPriceCart);

		Map<String,Object> map = new HashMap<>();

		map.put("code",200);
		map.put("status","TC");
		map.put("totalItem",carts.getCartItems().size());
		httpSession.setAttribute("totalItems", carts.getCartItems().size());
		return ResponseEntity.ok(map);

	}

	@PostMapping(value = "/ajax/updateQuantity")
	public ResponseEntity<Map<String,Object>> updateQuantity(@RequestBody CartItem cartItem,  HttpServletRequest request){
		HttpSession session = request.getSession();
		Carts carts = (Carts) session.getAttribute("yourCart");
		BigDecimal totalPrice = BigDecimal.ZERO;

		Map<String,Object> map = new HashMap<>();
		for (CartItem item:carts.getCartItems()) {
			if (item.getProductId() == cartItem.getProductId()){
				item.setQuantity(cartItem.getQuantity());
				BigDecimal quantity = BigDecimal.valueOf(item.getQuantity());
				BigDecimal total = quantity.multiply(item.getPriceUnit());
				item.setTotalPrice(total);

				map.put("totalPrice",item.getTotalPrice());
			}

			totalPrice = totalPrice.add(item.getTotalPrice());
			carts.setTotalPrice(totalPrice);
		}
		map.put("totalCart",carts.getTotalPrice());
		map.put("code",200);
		session.setAttribute("totalItems",carts.getCartItems().size());
		map.put("totalItems",carts.getCartItems().size());
		return ResponseEntity.ok(map);
	}

	@PostMapping(value = "/ajax/deleteItemCart")
	public ResponseEntity<Map<String,Object>> deleteItemCart(@RequestBody CartItem cartItem, HttpServletRequest request){
		HttpSession session = request.getSession();
		Carts carts = null;
		BigDecimal totalPrice = BigDecimal.ZERO;
		if (session.getAttribute("yourCart") != null){
			carts = (Carts) session.getAttribute("yourCart");
		}else {
			System.out.println("Not session Cart");
		}
		List<CartItem> itemList = carts.getCartItems();
		for (CartItem item:itemList) {
			if (item.getProductId() == cartItem.getProductId()){
				itemList.remove(item);
				break;
			}
			totalPrice = totalPrice.add(item.getTotalPrice());
			carts.setTotalPrice(totalPrice);
		}

		carts.setCartItems(itemList);
		Map<String,Object> map = new HashMap<>();
		map.put("totalCart",carts.getTotalPrice());
		session.setAttribute("totalItems",carts.getCartItems().size());
		map.put("totalItems",carts.getCartItems().size());
		return ResponseEntity.ok(map);
	}


	private int getTotalItem(HttpServletRequest request){
		HttpSession session = request.getSession();
		if (session.getAttribute("yourCart") == null){
			return 0;
		}else {
			Carts carts = (Carts) session.getAttribute("yourCart");
			List<CartItem> itemList = carts.getCartItems();
			int total = 0;
			for (CartItem c : itemList) {
				total+=c.getQuantity();
			}
			return total;
		}
	}

}
