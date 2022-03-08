package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.CartItem;
import com.devpro.shop15.DTO.Carts;
import com.devpro.shop15.DTO.Countries;
import com.devpro.shop15.DTO.OrdersSearchModel;
import com.devpro.shop15.entity.*;
import com.devpro.shop15.services.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CheckoutController extends BaseCustomerController {

    @Autowired
    private CountriesService countriesService;
    @Autowired private AddressAccountService accountService;
    @Autowired private UserService userService;
    @Autowired private ProductService productService;
    @Autowired private SaleOrderService saleOrderService;
    @Autowired private SaleOrderProductService saleOrderProductService;
    @Autowired private SendEmailOrderService sendEmailOrderService;

    @GetMapping(value = "/cart/checkout")
    public String checkOut(Model model, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        setHeaderSession(model);
        Carts carts = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            if (session.getAttribute("yourCart") != null){
                carts = (Carts) session.getAttribute("yourCart");
            }else {
                System.out.println("Not found");
            }
            String url = "https://provinces.open-api.vn/api/?depth=1";
            List<HashMap<String,?>> countries = this.countriesService.getListCountries(url);
            Users users = this.userService.loadUserByUsername(auth.getName());
            List<AddressAccount> addressAccountList = this.accountService.getListByIdUser(users.getId()).getData();

            AddressAccount voAdress = null;
            for (AddressAccount vo:addressAccountList) {
                if (vo.getSetAsDefault()){
                    voAdress = vo;
                }
            }
            model.addAttribute("addressDefault",voAdress);
            model.addAttribute("listAddress",addressAccountList);
            model.addAttribute("countries",countries);
            model.addAttribute("addressUser", new AddressAccount());
            model.addAttribute("cartCheckout",carts);
            if (request.getParameter("error-size") != null){
                model.addAttribute("errorAddress","Lỗi");
                System.out.println("Lỗi size quá 4 address");
            }
            if (request.getParameter("error-cart") !=  null){
                model.addAttribute("errorCart","Lỗi");
            }
            return "users/checkout";
        }else {
            return "redirect:/login";
        }
    }
    @PostMapping(value = "/add-address")
    public String addNewAddress(@ModelAttribute AddressAccount addressAccount, HttpServletRequest request){
        String city = request.getParameter("cityname");
        String district = request.getParameter("districtname");
        String wards = request.getParameter("wardsname");
        String checkDefault = request.getParameter("setAsDefault");
        String soNha = request.getParameter("addressDetail");
        if (checkDefault != null){
            if (checkDefault.equals("on")){
                addressAccount.setSetAsDefault(true);
            }else {
                addressAccount.setSetAsDefault(false);
            }
        }else {
            addressAccount.setSetAsDefault(false);
        }
        String address = soNha+", "+ wards+", "+district+", "+city;
        addressAccount.setAddress(address);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users users = this.userService.loadUserByUsername(auth.getName());
        addressAccount.setUsers(users);
        try {
            this.accountService.saveAddress(addressAccount);
        }catch (Exception e){
            return "redirect:/cart/checkout?error-size="+true;
        }
        return "redirect:/cart/checkout";
    }

    @PostMapping(value = "/save-order")
    public String saveOrder(HttpServletRequest request) throws UnsupportedEncodingException {
        String idAddress = request.getParameter("idAddress");
        HttpSession session = request.getSession();
        Carts carts = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")) {
            if (session.getAttribute("yourCart") != null) {
                carts = (Carts) session.getAttribute("yourCart");
                //Save SaleOrder
                AddressAccount addressAccount = this.accountService.getById(Integer.parseInt(idAddress));
                String payment = request.getParameter("payment");
                SaleOrders saleOrdersSave = null;

                //Khi mà payment == 1 thì là thanh toán tiền mặt
                if (Integer.parseInt(payment) == 1){
                    SaleOrders saleOrders = new SaleOrders();
                    Users users = this.userService.loadUserByUsername(auth.getName());
                    saleOrders.setUsers(users);
                    Integer code = getRandomCodeOrder();
                    OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
                    ordersSearchModel.setCode(code);
                    PagerData<SaleOrders> saleOrdersSearch = this.saleOrderService.search(ordersSearchModel,0);
                    if (!saleOrdersSearch.getData().isEmpty()){
                        code = getRandomCodeOrder();
                    }
                    saleOrders.setCodeOrder(String.valueOf(code));
                    saleOrders.setCustomerAddress(addressAccount.getAddress());
                    saleOrders.setCustomerName(addressAccount.getName());
                    saleOrders.setCustomerPhone(addressAccount.getPhone());
                    saleOrders.setCustomerEmail(addressAccount.getEmail());
                    saleOrders.setTotal(carts.getTotalPrice());
                    if (request.getParameter("description") != null){
                        saleOrders.setNote(request.getParameter("description"));
                    }
                    saleOrders.setPayments(1);
                    saleOrders.setCreatedDate(new Date());
                    //Chưa thanh toán == 0
                    saleOrders.setStatusPayment(0);
                    saleOrders.setStatusOrder(0);
                    saleOrdersSave = this.saleOrderService.saveOrUpdate(saleOrders);
                    //Save Sale Order Product
                    for (CartItem c:carts.getCartItems()) {
                        SaleOrderProducts saleOrderProducts = new SaleOrderProducts();
                        Products products = productService.getById(c.getProductId());

                        products.setQuantity(products.getQuantity() - c.getQuantity());
                        this.productService.saveOrUpdate(products);
                        saleOrderProducts.setProducts(products);
                        saleOrderProducts.setQuality(c.getQuantity());
                        saleOrderProducts.setSaleOrders(saleOrdersSave);
                        saleOrderProducts.setCreatedDate(new Date());
                        this.saleOrderProductService.saveOrUpdate(saleOrderProducts);
                    }

                }
                return "redirect:/send-order?idOrder="+saleOrdersSave.getId()+"&idAddress="+idAddress;
            } else {
                return "redirect:/cart/checkout?error-cart="+true;
            }
        }else {
                return "redirect:/login";
        }

    }

    @GetMapping(value = "/send-order")
    public String sendOrder(HttpServletRequest request, Model model){
        String idOrder = request.getParameter("idOrder");
        SaleOrders saleOrders = this.saleOrderService.getById(Integer.parseInt(idOrder));
        String phoneUser = saleOrders.getCustomerPhone();
        String emailUser = saleOrders.getCustomerEmail();
        BigDecimal totalPriceOrder = saleOrders.getTotal();
        String idAddress = request.getParameter("idAddress");
        AddressAccount addressAccount = this.accountService.getById(Integer.parseInt(idAddress));
        Map<String,Object> modelmap = new HashMap<>();
        modelmap.put("sanPham",saleOrders);
        modelmap.put("listPro",saleOrders.getSaleOrderProducts());
        this.sendEmailOrderService.sendEmail(modelmap,addressAccount);

        model.addAttribute("name",saleOrders.getCustomerName());
        model.addAttribute("address",saleOrders.getCustomerAddress());
        model.addAttribute("phone",phoneUser);
        model.addAttribute("email",emailUser);
        model.addAttribute("totalPrice",totalPriceOrder);
        model.addAttribute("codeOrder",saleOrders.getCodeOrder());


        return "users/send_order";
    }
    public Integer getRandomCodeOrder(){
        SecureRandom secureRandom = new SecureRandom();
        Integer randomWithSecureRandomWithinARange = secureRandom.nextInt(99999999 - 1) + 1;
        String num =  "011"+randomWithSecureRandomWithinARange.toString();
        return Integer.parseInt(num);
    }
}
