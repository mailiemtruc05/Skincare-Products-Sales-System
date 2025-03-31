package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.Category;
import edu.uth.wed_san_pham_cham_soc_da.models.Product;
import edu.uth.wed_san_pham_cham_soc_da.models.SubCategory;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    public static List<Product> ls = new ArrayList<>();
    static {
        Category category = new Category();  // Giả định có constructor mặc định
        SubCategory subCategory = new SubCategory(); // Giả định có constructor mặc định
        String image1 = "img/td2.jpg"; // Đường dẫn hình ảnh
        String image2 = "img/dd1.png"; // Đường dẫn hình ảnh
        String image3 = "img/dd2.png";
        String image4 = "img/dd3.png";
        String image5 = "img/dd4.jpg";
        ls.add(new Product(1, "Cream", image1, BigDecimal.valueOf(10000), "", category, subCategory, Instant.now(), Instant.now()));
        ls.add(new Product(2, "Creams", image2, BigDecimal.valueOf(11000), "", category, subCategory, Instant.now(), Instant.now()));
        ls.add(new Product(3, "Creamss", image3, BigDecimal.valueOf(12000), "", category, subCategory, Instant.now(), Instant.now()));
        ls.add(new Product(4, "Creamsss", image4, BigDecimal.valueOf(13000), "", category, subCategory, Instant.now(), Instant.now()));
        ls.add(new Product(5, "Creamssss", image5, BigDecimal.valueOf(14000), "", category, subCategory, Instant.now(), Instant.now()));
    }

    @Override
    public int addProduct(Product p){
        return 0;
    }

    @Override
    public int removeProduct(Product id) {
        return 0;
    }

    @Override
    public List<Product> getAll() {
        return ls;
    }

    @Override
    public Product findProductById(int id) {
        for (Product product : ls) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}
