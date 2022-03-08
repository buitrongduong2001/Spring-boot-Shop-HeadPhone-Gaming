package com.devpro.shop15.controller.customer;

import com.devpro.shop15.DTO.Countries;
import com.devpro.shop15.entity.AddressAccount;
import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.AddressAccountService;
import com.devpro.shop15.services.CountriesService;
import com.devpro.shop15.services.CountryService;
import com.devpro.shop15.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ManagerAddressController extends BaseCustomerController {

    @Autowired
    private UserService userService;
    @Autowired private AddressAccountService addressAccountService;
    @Autowired private CountryService countryService;
    @Autowired private CountriesService countriesService;

    @GetMapping(value = "/address-user")
    public String view(Model model, HttpServletRequest request){
        setHeaderSession(model);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            Users users = this.userService.loadUserByUsername(auth.getName());
            if (request.getParameter("error-size") != null){
                System.out.println("Lỗi");
                model.addAttribute("errorSizeManager","lỗi");
            }
            model.addAttribute("accountLogin",users);
            model.addAttribute("listAddress",this.addressAccountService.getListByIdUser(users.getId()));
            return "users/manager_address_user";
        }else {
            return "redirect:/login";
        }
    }

    @GetMapping(value = "/form-address")
    public String viewFormAddress(Model model) throws IOException {
        setHeaderSession(model);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            Users users = this.userService.loadUserByUsername(auth.getName());
            if (this.addressAccountService.getListByIdUser(users.getId()).getData().size() >= 4){
                return "redirect:/address-user?error-size="+true;
            }
            String url = "https://provinces.open-api.vn/api/?depth=1";
            List<HashMap<String,?>> countries = this.countryService.getListCountries(url);
            model.addAttribute("countries",countries);
            model.addAttribute("addressUser",new AddressAccount());
            return "users/form_add_address_user";
        }else {
            return "redirect:/login";
        }
    }
    @GetMapping(value = "/detail-address/{id}")
    public  String viewDetail(@PathVariable("id") Integer id, Model model) throws IOException {
        setHeaderSession(model);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            Users users = this.userService.loadUserByUsername(auth.getName());
            AddressAccount vo = this.addressAccountService.getByIdAndUser(id,users.getId());
            vo.getUsers().setRoles(null);
            Countries countries = this.countriesService.getCountry(vo.getAddress());
            String url = "https://provinces.open-api.vn/api/?depth=1";
            List<HashMap<String,?>> cityList = this.countriesService.getListCountries(url);
            String urlDistrict = "https://provinces.open-api.vn/api/?depth=2";
            List<HashMap<String,?>> mapListDistric = this.countriesService.getDistric(countries.getCity(),urlDistrict);
            String urlWard = "https://provinces.open-api.vn/api/?depth=3";
            List<HashMap<String,?>> mapListWards = this.countriesService.getWards(countries.getDistrict(),urlWard, countries.getCity());

            model.addAttribute("addressUser",vo);
            model.addAttribute("countries",cityList);
            model.addAttribute("country",countries);
            model.addAttribute("listDistrict",mapListDistric);
            model.addAttribute("listWard",mapListWards);
            return "users/form_edit_address_user";
        }else {
            return "redirect:/login";
        }
    }

    @PostMapping(value = "/add-address-form")
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
            this.addressAccountService.saveAddress(addressAccount);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/address-user";
    }
}
