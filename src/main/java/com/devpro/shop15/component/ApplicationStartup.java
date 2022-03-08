//package com.devpro.shop15.component;
//
//import java.math.BigDecimal;
//import java.util.Date;
//
//import com.devpro.shop15.Services.CategoryService;
//import com.devpro.shop15.entities.Categories;
//import com.devpro.shop15.entities.Products;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.context.event.ApplicationReadyEvent;
//import org.springframework.context.ApplicationListener;
//import org.springframework.stereotype.Component;
//@Component // bean
//public class ApplicationStartup implements ApplicationListener<ApplicationReadyEvent> {
//
//	@Autowired // inject 1 bean vào trong 1 bean khác
//	private CategoryService categoryService;
//
//	/**
//	 * khi ứng dụng chạy xong sẽ chạy vào hàm này.
//	 * Đây là thêm mới Category
//	 */
//	@Override
//	public void onApplicationEvent(final ApplicationReadyEvent event) {
////		seedCategory();
//		System.out.println("Chap");
//	}
//	private void seedCategory(){
//		//Tìm kiếm "Java" có trong DB ko
//		try {
//			Categories categories = this.categoryService.getByTransactQuerySQL("SELECT * FROM tbl_category where name like'Java';");
//			if(categories == null){
//				categories = new Categories();
//				categories.setName("Java");
//				categories.setDescription("Java");
//				categories.setCreatedDate(new Date());
//				for (int i = 0; i < 4; i++) {
//					Products products = new Products();
//					products.setTitle("Title "+i);
//					products.setPrice(new BigDecimal("1000"));
//					products.setShortDescription("Short Description");
//					products.setDetailDescription("Detail Description");
//					categories.addProducts(products);
//				}
//
//			}else {
//				categories.setUpdatedDate(new Date());
//				System.out.println("Update");
//			}
//
//			categoryService.saveOrUpdate(categories);
//		}catch (Exception e){
//			e.printStackTrace();
//		}
//
//	}
//}
