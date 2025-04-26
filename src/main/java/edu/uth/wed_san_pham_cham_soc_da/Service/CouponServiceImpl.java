package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.Coupon;
import edu.uth.wed_san_pham_cham_soc_da.repository.CouponRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

//thực thi các phương thức trong CouponService,
//sử dụng CouponRepository để truy cập dữ liệu.
@Service
public class CouponServiceImpl implements CouponService {
    @Autowired//để Spring inject (tiêm) Repository quản lý CRUD cho Coupon
    private CouponRepository couponRepository;

    //Lấy danh sách tất cả coupon (dành cho trang của admin)
    @Override
    public List<Coupon> findAll() {
        return couponRepository.findAll();
    }

    //Tìm coupon theo mã code duy nhất
    @Override
    public Optional<Coupon> findByCode(String code) {
        return couponRepository.findByCode(code);
    }

    //Lưu mới hoặc cập nhật một coupon
    @Override
    public Coupon save(Coupon coupon) {
        return couponRepository.save(coupon);
    }

    //Xóa coupon theo ID
    @Override
    public void deleteById(Long id) {
        couponRepository.deleteById(id);
    }

    //Lấy danh sách coupon đang active và chưa hết hạn
    @Override
    public List<Coupon> findAvailable(LocalDateTime now) {
        return couponRepository.findByActiveTrueAndExpiredAtAfter(now);
    }
}