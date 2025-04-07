package edu.uth.wed_san_pham_cham_soc_da.data;

import org.springframework.core.annotation.Order;
import edu.uth.wed_san_pham_cham_soc_da.models.Roles;
import edu.uth.wed_san_pham_cham_soc_da.repository.RoleRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Order(2)
@Configuration
public class DataRole {
    @Bean
    CommandLineRunner initData(RoleRepository roleRepo) {
        return args -> {
            // Kiểm tra nếu dữ liệu đã có thì không thêm nữa
            if (roleRepo.count() > 0) return;

            // Thêm các quyền mặc định
            Roles roleAdmin = new Roles("ADMIN");


            roleRepo.save(roleAdmin);

            System.out.println("✅ Dữ liệu roles đã được thêm vào thành công!");
        };
    }
}
