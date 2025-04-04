package edu.uth.wed_san_pham_cham_soc_da.repository;
import edu.uth.wed_san_pham_cham_soc_da.models.ShoppingCart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {
}

