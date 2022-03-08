package com.devpro.shop15.controller.admin;

import com.devpro.shop15.DTO.Countries;
import com.devpro.shop15.DTO.OrdersSearchModel;
import com.devpro.shop15.DTO.SaleOrderProductsSearchModel;
import com.devpro.shop15.entity.SaleOrderProducts;
import com.devpro.shop15.entity.SaleOrders;
import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.CountriesService;
import com.devpro.shop15.services.SaleOrderProductService;
import com.devpro.shop15.services.SaleOrderService;
import com.devpro.shop15.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/admin")
public class OrderAdminController extends  BaseAdminController {

    @Autowired
    private SaleOrderService saleOrderService;
    @Autowired
    private SaleOrderProductService saleOrderProductService;
    @Autowired private CountriesService countriesService;
    @Autowired private UserService userService;

    @GetMapping(value = "/orders")
    public String viewOrders(Model model, HttpServletRequest request){
        String status = null;
        if (request.getParameter("status") != null){
            status = request.getParameter("status");
        }
        String keyword = request.getParameter("keyword");
        Comparator<SaleOrders> comparing = Comparator
                .comparing(SaleOrders::getStatusOrder)
                .reversed()
                .thenComparing(SaleOrders::getId);
        if (status == null && keyword == null){
            OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
            ordersSearchModel.setPage(getCurrentPage(request));

            ordersSearchModel.setStatusOrder(0);
            model.addAttribute("listCho",saleOrderService.search(ordersSearchModel,2));
        }else if (status != null && keyword == null){
            OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
            ordersSearchModel.setPage(getCurrentPage(request));
            ordersSearchModel.setStatusOrder(Integer.parseInt(status));
            model.addAttribute("listCho",saleOrderService.search(ordersSearchModel,2));
        }else if (status != null && keyword != null){
            OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
            ordersSearchModel.setPage(getCurrentPage(request));
            ordersSearchModel.setStatusOrder(Integer.parseInt(status));
            ordersSearchModel.setKeyword(keyword);
            model.addAttribute("listCho",saleOrderService.search(ordersSearchModel,2));
        }else {
            OrdersSearchModel ordersSearchModel = new OrdersSearchModel();
            ordersSearchModel.setPage(getCurrentPage(request));
            ordersSearchModel.setKeyword(keyword);
            model.addAttribute("listCho",saleOrderService.search(ordersSearchModel,2));
        }
        return "admin/orders_admin";
    }

    @GetMapping(value = "/detail/order/{id}")
    public String detailOrder(@PathVariable("id") Integer id, Model model) throws IOException {
        SaleOrders saleOrders = this.saleOrderService.getById(id);
        Countries countries = this.countriesService.getCountry(saleOrders.getCustomerAddress());
        String url = "https://provinces.open-api.vn/api/?depth=1";
        List<HashMap<String,?>> cityList = this.countriesService.getListCountries(url);
        String urlDistrict = "https://provinces.open-api.vn/api/?depth=2";
        List<HashMap<String,?>> mapListDistric = this.countriesService.getDistric(countries.getCity(),urlDistrict);
        String urlWard = "https://provinces.open-api.vn/api/?depth=3";
        List<HashMap<String,?>> mapListWards = this.countriesService.getWards(countries.getDistrict(),urlWard, countries.getCity());
        model.addAttribute("countries",cityList);
        model.addAttribute("listOrderProducts",saleOrders.getSaleOrderProducts());
        model.addAttribute("country",countries);
        model.addAttribute("listDistrict",mapListDistric);
        model.addAttribute("listWard",mapListWards);
        model.addAttribute("saleOrder",saleOrders);
        return "admin/detail_order";
    }

    @PostMapping(value = "/update/order")
    public String updateOrderPro(HttpServletRequest request, @ModelAttribute("saleOrder") SaleOrders saleOrders){
        System.out.println("Vào update Big");
        String quantityAndId = request.getParameter("quantityProduct");
        String cityName = request.getParameter("cityname");
        String userId = request.getParameter("userid");
        String districtName = request.getParameter("districtname");
        String wardsName = request.getParameter("wardsname");
        String soNha = request.getParameter("sonha");

        String[] splipQua = quantityAndId.split("-");
        SaleOrderProductsSearchModel searchModel = new SaleOrderProductsSearchModel();
        searchModel.setIdSaleOrder(saleOrders.getId());
        List<SaleOrderProducts> saleOrderProductsList = this.saleOrderProductService.search(searchModel,0).getData();
        BigDecimal totalPriceCart = BigDecimal.ZERO;
        if (userId != null){
            Users users = this.userService.getById(Integer.parseInt(userId));
            saleOrders.setUsers(users);
        }
        if (cityName != null && districtName != null && wardsName != null && !cityName.equals("") && !districtName.equals("") && !wardsName.equals("")){
            String address = soNha+", "+ wardsName+", "+districtName+", "+cityName;
            saleOrders.setCustomerAddress(address);
        }

        if (quantityAndId != null && !quantityAndId.equals("")){
            for (int i = 0; i < splipQua.length; i++) {
                if (i%2 == 0){
                    Integer id = Integer.parseInt(splipQua[i]);
                    Integer quantityNew = Integer.parseInt(splipQua[i+1]);
                    for (SaleOrderProducts s:saleOrderProductsList) {
                        if (s.getId() == id){
                            s.setQuality(quantityNew);
                            this.saleOrderProductService.saveOrUpdate(s);
                        }
                    }
                }
            }
            List<SaleOrderProducts> saleOrderProductsList2 = this.saleOrderProductService.search(searchModel,0).getData();

            for (SaleOrderProducts s:saleOrderProductsList2) {
                if (s.getProducts().getPriceSale() != null){
                    BigDecimal quantity = BigDecimal.valueOf(s.getQuality());
                    BigDecimal total = quantity.multiply(s.getProducts().getPriceSale());
                    totalPriceCart = totalPriceCart.add(total);
                }else {
                    BigDecimal quantity = BigDecimal.valueOf(s.getQuality());
                    BigDecimal total = quantity.multiply(s.getProducts().getPrice());
                    totalPriceCart = totalPriceCart.add(total);
                }
            }
            saleOrders.setTotal(totalPriceCart);
        }else {
            SaleOrders saleOrders1 = this.saleOrderService.getById(saleOrders.getId());
            saleOrders.setTotal(saleOrders1.getTotal());
        }

        this.saleOrderService.saveOrUpdate(saleOrders);

        return "redirect:/admin/orders";
    }

    @PostMapping(value = "/update/status-done/order/{id}")
    public ResponseEntity<SaleOrders> updateOrder(@PathVariable("id") Integer id, HttpServletResponse response){
        SaleOrders saleOrders = this.saleOrderService.getById(id);
        if (saleOrders != null){
            if(saleOrders.getStatusOrder() == 0){
                saleOrders.setStatusOrder(1);
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
    @PostMapping(value = "/update/status-delete/order/{id}")
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
    @PostMapping(value = "/update/order-ship/{id}")
    public ResponseEntity<SaleOrders> updateOrderShipping(@PathVariable("id") Integer id, HttpServletResponse response){
        SaleOrders saleOrders = this.saleOrderService.getById(id);
        if (saleOrders != null){
            if(saleOrders.getStatusOrder() == 1){
                saleOrders.setStatusOrder(2);
                saleOrders.setStatusPayment(1);
                saleOrders.setFinishDate(new Date());
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

}
