package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;


@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    Map<Integer, ShoppingCart> maps = new HashMap<>(); //hien thi danh sach gio hang

    @Override
    public void add(ShoppingCart item) {
        ShoppingCart cartItem =  maps.get(item.getProduct().getId());
        if (cartItem == null) { // neu khong co
            maps.put(item.getProduct().getId(), item);
        }else {
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            //khi "add to cart" thi no cong len 1
        }
    }

    @Override
    public void remove(int productId) {//xoa thuc thi
        maps.remove(productId);
    }

     @Override
     public ShoppingCart update(int productId, int quantity) {
         //khi nguoi dung them so luong thi no se update
        ShoppingCart cartItem = maps.get(productId);
        cartItem.setQuantity(quantity);
        return cartItem;
     }

     @Override
     public void clear() {//xoa gio hang
        maps.clear();
     }

     @Override
     public Collection<ShoppingCart> getAllItems() {
        return maps.values();
     }

     @Override
     public int getCount() {//dem so luong
        return maps.values().size();
     }

     @Override
     public double getTotal() {//tinh tong tien
        return maps.values().stream()
                .mapToDouble(item -> item.getQuantity() * item.getPrice())
                .sum();
     }

}
