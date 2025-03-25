package edu.uth.wed_san_pham_cham_soc_da.config;

import edu.uth.wed_san_pham_cham_soc_da.Service.CustomAccountDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Autowired
    private CustomAccountDetailService customAccountDetailService;
    @Bean
    BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // Tắt CSRF nếu không cần thiết
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/admin","/product","/about","/product-details").permitAll() // Trang chủ và trang đăng nhập không yêu cầu đăng nhập
                        .requestMatchers("/home/admin2").hasAuthority("ADMIN") // Chỉ ADMIN được vào trang này
                        .requestMatchers("/shopping-cart", "/pay","/lie","/contact").authenticated() // Yêu cầu đăng nhập
                        .anyRequest().authenticated() // Các trang khác cũng yêu cầu đăng nhập
                )
                .exceptionHandling(exception -> exception
                        .accessDeniedHandler((request, response, accessDeniedException) -> {
                            response.sendRedirect("/home");
                        })
                )
                .formLogin(login -> login
                        .loginPage("/admin") // Trang đăng nhập
                        .loginProcessingUrl("/admin")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .defaultSuccessUrl("/home", true) // Chuyển hướng về /home sau khi đăng nhập thành công
                        .failureUrl("/admin?error=true") // Nếu sai mật khẩu, quay lại trang đăng nhập
                        .permitAll()
                )
//                .logout(logout->logout.logoutUrl("/logout").logoutSuccessUrl("/home"));
                .logout(logout -> logout
                        .logoutUrl("/logout") // URL xử lý đăng xuất
                        .logoutSuccessUrl("/home?logout=true") // Sau khi đăng xuất, chuyển về home
                        .invalidateHttpSession(true) // Xóa session
                        .deleteCookies("JSESSIONID") // Xóa cookie đăng nhập
                        .permitAll()
                );

        return http.build();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring().requestMatchers(
                "/css/**",
                "/js/**",
                "/img/**",
                "/lib/**",
                "/scss/**"
        );
    }

}

