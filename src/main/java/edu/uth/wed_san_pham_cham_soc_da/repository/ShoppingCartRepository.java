package edu.uth.wed_san_pham_cham_soc_da.repository;

import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import edu.uth.wed_san_pham_cham_soc_da.models.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

//Repository interface quản lý các thao tác CRUD cho entity ShoppingCart.
//Kế thừa JpaRepository để tự động có sẵn các phương thức cơ bản:
//- save(), findById(), findAll(), delete(), v.v.
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {
    //lấy danh sách mục trong giỏ hàng của một tài khoản
    List<ShoppingCart> findByAccount(Account account);
    //xóa mục trong giỏ hàng dựa trên productId
    void deleteByProductId(Integer id);
}