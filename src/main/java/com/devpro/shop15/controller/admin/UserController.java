package com.devpro.shop15.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class UserController {

	@GetMapping("/create/user")
	public String create() {

		return "admin/create_user";
	}
}
