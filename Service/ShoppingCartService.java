package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;

import java.util.Collection;

public interface ShoppingCartService {
    //dinh nghia cac ham
    void add(ShoppingCart item);

    void remove(int productId);

    ShoppingCart update(int productId, int quantity);

    void clear();

    Collection<ShoppingCart> getAllItems();

    int getCount();

    double getTotal();


}
