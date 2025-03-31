package edu.uth.wed_san_pham_cham_soc_da.Service;

import edu.uth.wed_san_pham_cham_soc_da.models.Product;

import java.util.List;

public interface ProductService {
    public int addProduct(Product p);
    public int removeProduct(Product id);
    public List<Product> getAll();
    public Product findProductById(int id);
}
