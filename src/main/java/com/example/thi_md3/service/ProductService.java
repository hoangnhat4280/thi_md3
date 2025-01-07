package com.example.thi_md3.service;

import com.example.thi_md3.dao.ProductDAO;
import com.example.thi_md3.model.Product;
import java.util.List;

public class ProductService {

    private ProductDAO productDAO = new ProductDAO();

    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public void addProduct(Product product) {
        productDAO.addProduct(product);
    }
}
