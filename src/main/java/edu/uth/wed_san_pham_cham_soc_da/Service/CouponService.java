package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.Coupon;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

//interface CouponService định nghĩa các phép toán chính cho Entity Coupon
//Quản lý CRUD: tìm kiếm, lưu, xóa
public interface CouponService {
    List<Coupon> findAll();
    Optional<Coupon> findByCode(String code);
    Coupon save(Coupon coupon);
    void deleteById(Long id);
    List<Coupon> findAvailable(LocalDateTime now);
}