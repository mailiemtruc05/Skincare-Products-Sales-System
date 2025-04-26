package edu.uth.wed_san_pham_cham_soc_da.repository;

import edu.uth.wed_san_pham_cham_soc_da.models.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;


@Repository
public interface CouponRepository extends JpaRepository<Coupon, Long> {
    //tìm coupon theo mã duy nhất
    Optional<Coupon> findByCode(String code);

    //lấy coupon đang active và chưa hết hạn
    List<Coupon> findByActiveTrueAndExpiredAtAfter(LocalDateTime now);
}