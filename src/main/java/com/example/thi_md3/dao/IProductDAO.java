package com.example.thi_md3.dao;


import com.example.thi_md3.model.Product;

import java.util.List;

public interface IProductDAO {
    List<Product> getAllProducts();
    void addProduct(Product product);
    void deleteProductById(int id);
    Product getProductById(int id);
    void updateProduct(Product product);
}