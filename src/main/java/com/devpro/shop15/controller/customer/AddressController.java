package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.Countries;
import com.devpro.shop15.entity.AddressAccount;
import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.AddressAccountService;
import com.devpro.shop15.services.CountriesService;
import com.devpro.shop15.services.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AddressController extends BaseCustomerController {

    /*@Autowired
    private DeliveryAddressService addressService;*/

    @Autowired
    private CountriesService countriesService;
    @Autowired
    private AddressAccountService addressAccountService;
    @Autowired
    private UserService userService;

    @PostMapping(value = "/ajax/getAddress")
    public ResponseEntity<Map<String,Object>> getAddressById(Model model,HttpServletRequest request) throws IOException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        setHeaderSession(model);
        if (auth != null && !auth.getName().equals("anonymousUser")) {
            String nameLogin = auth.getName();

            Users accountVO = this.userService.loadUserByUsername(nameLogin);
            String idAddress = request.getParameter("idAddress");
            AddressAccount vo = this.addressAccountService.getByIdAndUser(Integer.parseInt(idAddress),accountVO.getId());
            vo.getUsers().setRoles(null);
            Countries countries = this.countriesService.getCountry(vo.getAddress());
            String url = "https://provinces.open-api.vn/api/?depth=1";
            List<HashMap<String,?>> cityList = this.countriesService.getListCountries(url);
            String urlDistrict = "https://provinces.open-api.vn/api/?depth=2";
            List<HashMap<String,?>> mapListDistric = this.countriesService.getDistric(countries.getCity(),urlDistrict);
            String urlWard = "https://provinces.open-api.vn/api/?depth=3";
            List<HashMap<String,?>> mapListWards = this.countriesService.getWards(countries.getDistrict(),urlWard, countries.getCity());
            Map<String,Object> getAddress = new HashMap<>();
            if (vo != null){
                getAddress.put("address",vo);
                getAddress.put("countries",cityList);
                getAddress.put("country",countries);
                getAddress.put("listDistrict",mapListDistric);
                getAddress.put("listWard",mapListWards);
            }
            return ResponseEntity.ok(getAddress);
        }

        return null;
    }

    @PostMapping(value = "/ajax/delete-address")
    public ResponseEntity<Map<String, Object>> deleteAddress(HttpServletRequest request) throws Exception {
        String idAddress = request.getParameter("idAddress");
        System.out.println(idAddress);
        AddressAccount addressAccount = this.addressAccountService.deleteByIdAddress(Integer.parseInt(idAddress));

        Map<String, Object> map = new HashMap<>();
        if (addressAccount != null) {
            map.put("code", 200);
            map.put("data", addressAccount);
        }
        return ResponseEntity.ok(map);
    }

    @PostMapping(value = "/ajax/districts-address")
    public ResponseEntity<List<HashMap<String, ?>>> getDistricts(HttpServletRequest request) throws IOException {
        String code = request.getParameter("code");
        String url = "https://provinces.open-api.vn/api/?depth=2";
        List<HashMap<String, ?>> mapListDistric = this.countriesService.getDistric(Integer.parseInt(code), url);
        return ResponseEntity.ok(mapListDistric);
    }

    @PostMapping(value = "/ajax/wards-address")
    public ResponseEntity<List<HashMap<String, ?>>> getWards(HttpServletRequest request) throws IOException {
        String code = request.getParameter("code");
        String keyCity = request.getParameter("city");
        String url = "https://provinces.open-api.vn/api/?depth=3";
        List<HashMap<String, ?>> mapListWards = this.countriesService.getWards(Integer.parseInt(code), url, Integer.parseInt(keyCity));
        return ResponseEntity.ok(mapListWards);
    }

}
