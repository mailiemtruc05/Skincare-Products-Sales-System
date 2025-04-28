package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import edu.uth.wed_san_pham_cham_soc_da.models.Account;
import java.util.List;

//Interface định nghĩa các chức năng xử lý cho entity shoppingcart
//Quản lý crud: thêm, xóa, cập nhật
public interface ShoppingCartService {
    // Lấy danh sách mục trong giỏ hàng của account
    List<ShoppingCart> getCartItems(Account account);
    void addItem(Account account, ShoppingCart item);
    void removeItem(Account account, int productId);
    void updateItem(Account account, int productId, int newQuantity);
    //- Tính tổng tiền
    double getTotal(Account account);
    void applyCoupon(Account account, String couponCode, long discountAmount);
}