package com.devpro.shop15.controller.customer;

import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ManagerAccountController extends BaseCustomerController {

    @Autowired private UserService userService;

    @GetMapping(value = "/manager-user")
    public String view(Model model){
        setHeaderSession(model);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && !auth.getName().equals("anonymousUser")){
            Users users = this.userService.loadUserByUsername(auth.getName());
            if (users.getBirthDate() != null){
                SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
                String date = sd.format(users.getBirthDate());
                String[] birthday = date.split("-");
                System.out.println(date);
                Integer dayBird = Integer.parseInt(birthday[2]);
                Integer monthBird = Integer.parseInt(birthday[1]);
                Integer yearBird = Integer.parseInt(birthday[0]);

                System.out.println(dayBird + monthBird + yearBird);
                model.addAttribute("dayBird",dayBird);
                model.addAttribute("monthBird",monthBird);
                model.addAttribute("yearBird",yearBird);
            }
            model.addAttribute("accountLogin",users);
            return "users/manager_account";
        }else {
            return "redirect:/login";
        }
    }

    @PostMapping(value = "/save-user")
    public String saveOrUpdate(@RequestParam("fileImageUser") MultipartFile file, @ModelAttribute Users users
    , HttpServletRequest request) throws IOException, ParseException {
        System.out.println(users.getEmail());
        System.out.println(file.getOriginalFilename());
        String day = request.getParameter("dayBird");
        String month = request.getParameter("monthBird");
        String year = request.getParameter("yearBird");
        String birthDay = year+"-"+month+"-"+day;
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        if (!birthDay.equals("null-null-null")){
            Date birthDate = df.parse(birthDay);
            users.setBirthDate(birthDate);
        }
        this.userService.update(users,file);
        return "redirect:/manager-user";
    }
}
