package com.devpro.shop15.controller.admin;

import com.devpro.shop15.entity.SaleOrders;
import com.devpro.shop15.entity.Users;
import com.devpro.shop15.services.RoleService;
import com.devpro.shop15.services.SaleOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;
import java.util.Set;

@Controller
public class IndexAdminController {

	@Autowired
	private SaleOrderService saleOrderService;
	@Autowired
	private RoleService roleService;
	@GetMapping("/admin/index")
	public String home(HttpServletRequest request, HttpServletResponse response, Model model) {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		List<SaleOrders> ordersListMonth = this.saleOrderService.getByMonth();
		List<SaleOrders> ordersListYear = this.saleOrderService.getByYear();
		List<SaleOrders> ordersList = this.saleOrderService.findAll();
		Set<Users> guestUser = this.roleService.getUsers();

		BigDecimal totalMonth = BigDecimal.ZERO;
		BigDecimal totalYear = BigDecimal.ZERO;
		BigDecimal totalShop = BigDecimal.ZERO;
		for (SaleOrders s:ordersListMonth) {
			totalMonth = totalMonth.add(s.getTotal());
		}
		for (SaleOrders s:ordersListYear) {
			totalYear = totalYear.add(s.getTotal());
		}
		for (SaleOrders s:ordersList) {
			totalShop = totalShop.add(s.getTotal());
		}
		model.addAttribute("totalUser",guestUser.size()+1);
		model.addAttribute("month",totalMonth);
		model.addAttribute("year",totalYear);
		model.addAttribute("total",totalShop);
		return "admin/home";
	}
	
}
