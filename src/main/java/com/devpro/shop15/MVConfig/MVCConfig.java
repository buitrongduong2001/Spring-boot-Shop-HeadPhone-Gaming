package com.devpro.shop15.MVConfig;

import com.devpro.shop15.constants.Constants;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Configuration
public class MVCConfig implements WebMvcConfigurer, Constants {
	
	@Bean //Bảo spring biết folder chứa view
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		
		//Thiết lập view engine
		bean.setViewClass(JstlView.class);
		
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
	
	//Thực hiện định nghĩa các static resoures (file js, css, image..)
	//Classpath tương ứng với folder: src/main/resource
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/bootstrap/css/**").addResourceLocations("classpath:/bootstrap/css/");
		registry.addResourceHandler("/bootstrap/js/**").addResourceLocations("classpath:/bootstrap/js/");
		registry.addResourceHandler("/images/**").addResourceLocations("classpath:/images/");
		registry.addResourceHandler("/vendor/**").addResourceLocations("classpath:/vendor/");
		//đăng ký static resources cho ảnh attach đẩy lên
		registry.addResourceHandler("/uploads/**").addResourceLocations("file:"+UPLOAD_FOLDER_ROOT);
	}


}
