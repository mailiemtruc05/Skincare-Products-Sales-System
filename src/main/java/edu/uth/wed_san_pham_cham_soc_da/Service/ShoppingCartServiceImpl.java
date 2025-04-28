package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import edu.uth.wed_san_pham_cham_soc_da.models.Account;
import edu.uth.wed_san_pham_cham_soc_da.repository.ShoppingCartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;

//Thực thi ShoppingCartService, tương tác với sql qua ShoppingCartRepository.
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

    // Spring tự động inject ShoppingCartRepository quản lý CRUD cho ShoppingCart
    @Autowired
    //ShoppingCartRepository để thao tác CRUD với bảng shopping_cart
    private ShoppingCartRepository cartRepo;

    @Override // Lấy tất cả mục giỏ hàng của tài khoản đang đăng nhập(1 account có 1 giỏ hàng)
    public List<ShoppingCart> getCartItems(Account account) {
        return cartRepo.findByAccount(account);
    }


    @Override
    @Transactional //để đảm bảo tính toàn vẹn khi thêm, xóa, cập nhật.
    public void addItem(Account account, ShoppingCart item) { //Thêm sản phẩm vào giỏ hàng
        //Lấy danh sách sản phẩm trong giỏ hiện có của account từ sql
        List<ShoppingCart> currentItems = cartRepo.findByAccount(account);
        //Tìm xem có sản phẩm nào cùng productId không
        Optional<ShoppingCart> existingItemOpt = currentItems.stream()
                .filter(i -> i.getProduct().getId().equals(item.getProduct().getId()))
                .findFirst();
        if (existingItemOpt.isPresent()) {
            //Nếu tìm thấy, tăng quantity và cập nhật DB
            ShoppingCart existingItem = existingItemOpt.get();
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
            cartRepo.save(existingItem); // save sẽ update mục cũ
        } else {
            //Nếu chưa có, gán account cho item mới và lưu
            item.setAccount(account);
            cartRepo.save(item); // save sẽ insert mục mới
        }
    }

    @Override
    @Transactional
    public void removeItem(Account account, int productId) {
        //Lấy danh sách sản phẩm trong giỏ hiện có của account từ sql
        List<ShoppingCart> currentItems = cartRepo.findByAccount(account);
        //Tìm mục cần xóa theo productId
        currentItems.stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                // Xóa nếu tồn tại
                .ifPresent(cartRepo::delete);
    }

    @Override
    @Transactional
    public void updateItem(Account account, int productId, int newQuantity) {
        //Lấy danh sách sản phẩm trong giỏ hiện có của account từ sql
        List<ShoppingCart> currentItems = cartRepo.findByAccount(account);
        //Tìm sản phẩm cần update theo productId
        currentItems.stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst()
                //Nếu tìm thấy, cập nhật quantity và lưu
                .ifPresent(item -> {
                    item.setQuantity(newQuantity);
                    cartRepo.save(item);
                });
    }

    @Override
    public double getTotal(Account account) {
        //Tính tổng tiền của tất cả sản phẩm
        return cartRepo.findByAccount(account)
                .stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }

    @Override
    @Transactional
    public void applyCoupon(Account account, String couponCode, long discountAmount) {
        List<ShoppingCart> items = cartRepo.findByAccount(account);
        if (!items.isEmpty()) {
            ShoppingCart firstItem = items.get(0);
            firstItem.setCouponCode(couponCode);
            firstItem.setDiscountAmount(discountAmount);
            cartRepo.save(firstItem);
        }
    }
}