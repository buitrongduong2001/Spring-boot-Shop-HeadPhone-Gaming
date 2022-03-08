package com.devpro.shop15.MVConfig;

import com.devpro.shop15.services.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class ConfigSecurity extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailServiceImpl userDetailService;

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests() // bắt đầu cấu hình: tất cả các requests từ
                // trình duyệt đều được bắt trong hàm này

                //cho phép các request static resources không bị ràng buộc(permitAll)
                .antMatchers("/css/**", "/js/**", "/upload/**",
                        "/bootstrap/css/**","/bootstrap/js/**","/vendor/**","/images/**").permitAll()

                //các request kiểu: "/admin/" là phải đăng nhập (authenticated)
                .antMatchers("/admin/**").hasAuthority("ADMIN")
                .antMatchers("/cart/checkout2/**").hasAuthority("GUEST")
                .anyRequest().permitAll()
                .and()
                //cấu hình trang đăng nhập
                // /login là 1 action
                .formLogin().loginPage("/login").loginProcessingUrl("/perform_login").defaultSuccessUrl("/admin/index", true)
                .failureUrl("/login?login_error=true")
                .permitAll()
                .and()
                //cấu hình cho phần logout
                .logout().logoutUrl("/logout").logoutSuccessUrl("/index").invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll();
        http.exceptionHandling().accessDeniedPage("/index");
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
        auth.userDetailsService(userDetailService).passwordEncoder(new BCryptPasswordEncoder(4));
    }
}
