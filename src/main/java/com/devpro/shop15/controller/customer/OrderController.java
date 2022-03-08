package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.CartItem;
import com.devpro.shop15.DTO.Carts;
import com.devpro.shop15.DTO.OrdersSearchModel;
import com.devpro.shop15.entity.Products;
import com.devpro.shop15.entity.SaleOrderProducts;
import com.devpro.shop15.entity.SaleOrders;
import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.PagerData;
import com.devpro.shop15.services.ProductService;
import com.devpro.shop15.services.SaleOrderService;
import com.devpro.shop15.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class OrderController extends BaseCustomerController {

    @Autowired
    private SaleOrderService saleOrderService;
    @Autowired private UserService userService;
    @Autowired
    private ProductService productService;
    //Check out

    @PostMapping(value = "/save/order")
    public String saveOder(HttpServletRequest request){
        String name = request.getParameter("customerName");
        String email = request.getParameter("customerEmail");
        String phoneNumber = request.getParameter("customerMobile");
        String address = request.getParameter("customerAddress");
        Integer code = getRandomCodeOrder();
        OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
        ordersSearchModel.setCode(code);
        PagerData<SaleOrders> saleOrders = this.saleOrderService.search(ordersSearchModel,0);
        if (!saleOrders.getData().isEmpty()){
            code = getRandomCodeOrder();
        }
        SaleOrders orders = new SaleOrders();
        orders.setCodeOrder(String.valueOf(code));
        orders.setCustomerEmail(email);
        orders.setCustomerName(name);
        orders.setCustomerPhone(phoneNumber);
        orders.setCustomerAddress(address);
        this.saleOrderService.saveOrUpdate(orders);
        return "redirect:/cart/checkout";
    }

    public Integer getRandomCodeOrder(){
        SecureRandom secureRandom = new SecureRandom();
        Integer randomWithSecureRandomWithinARange = secureRandom.nextInt(99999999 - 1) + 1;
        String num =  "011"+randomWithSecureRandomWithinARange.toString();

        return Integer.parseInt(num);
    }

    @RequestMapping("/list-order")
    public String order(Model model, HttpServletRequest request, @RequestParam("status") Optional<Integer> status){
        setHeaderSession(model);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            String name = auth.getName();
            Users accountVO = this.userService.loadUserByUsername(name);
            OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
            if (status.isPresent()){
                ordersSearchModel.setIdUser(accountVO.getId());
                ordersSearchModel.setStatusOrder(status.get());
                ordersSearchModel.setPage(getCurrentPage(request));
                model.addAttribute("listOrder",this.saleOrderService.search(ordersSearchModel,3));
            }else {
                ordersSearchModel.setIdUser(accountVO.getId());
                ordersSearchModel.setPage(getCurrentPage(request));
                model.addAttribute("listOrder",this.saleOrderService.search(ordersSearchModel,3));
            }
            return "users/list_orders";
        }else {
            return "redirect:/login";
        }
    }
    @RequestMapping("/detail/order/{id}")
    public String orderDetail(Model model, HttpServletRequest request, @PathVariable("id") Integer id){
        setHeaderSession(model);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            String name = auth.getName();
            Users accountVO = this.userService.loadUserByUsername(name);
            SaleOrders saleOrders = this.saleOrderService.getById(id);
            SimpleDateFormat sd = new SimpleDateFormat("HH:mm");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Date date = saleOrders.getCreatedDate();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DAY_OF_WEEK,7);
            String estimated = df.format(cal.getTime());
            model.addAttribute("dateNew", estimated);
            model.addAttribute("saleOrders",saleOrders);
            return "users/order_detail";
        }else {
            return "redirect:/login";
        }
    }
    @PostMapping(value = "/update/remove/order/{id}")
    public ResponseEntity<SaleOrders> updateOrderDelete(@PathVariable("id") Integer id, HttpServletResponse response){
        SaleOrders saleOrders = this.saleOrderService.getById(id);
        if (saleOrders != null){
            if(saleOrders.getStatusOrder() == 0){
                saleOrders.setStatusOrder(-1);
                this.saleOrderService.saveOrUpdate(saleOrders);
            }else {
                response.setStatus(404);
                System.out.println(response.getStatus());
                return ResponseEntity.badRequest().build();
            }
        }else {
            System.out.println("Null");
        }
        return ResponseEntity.ok(saleOrders);
    }

    @PostMapping(value = "/by-again/{id}")
    public String  byOrderAgain(@PathVariable("id") Integer id, HttpServletRequest request){
        HttpSession httpSession = request.getSession();
        Carts carts = null;
        if(httpSession.getAttribute("yourCart") != null){
            carts = (Carts) httpSession.getAttribute("yourCart");
        }else {
            carts = new Carts();
            httpSession.setAttribute("yourCart",carts);
        }
        //Lấy ra danh sách trong giỏ hàng
        SaleOrders saleOrders = this.saleOrderService.getById(id);

        for (SaleOrderProducts s:saleOrders.getSaleOrderProducts()) {
            List<CartItem> itemList = carts.getCartItems();
            BigDecimal totalPriceCart = BigDecimal.ZERO;
            boolean isExists = false;
            CartItem cartItem = new CartItem();
            cartItem.setProductId(s.getProducts().getId());
            cartItem.setQuantity(s.getQuality());
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
        }
        return "redirect:/cart/view";
    }
}
