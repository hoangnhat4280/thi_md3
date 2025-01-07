
package com.example.thi_md3.dao;


import com.example.thi_md3.model.Product;
import com.example.thi_md3.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements IProductDAO {

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (Connection connection = DBConnection.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Product product = new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getBigDecimal("price"),
                        resultSet.getString("discount"),
                        resultSet.getInt("stock")
                );
                products.add(product);
            }

            // Thêm log để hiển thị số lượng sản phẩm lấy được
            System.out.println("Number of products retrieved: " + products.size());
        } catch (SQLException e) {
            System.err.println("Error retrieving products: " + e.getMessage());
        }
        return products;
    }

    @Override
    public void addProduct(Product product) {
        String query = "INSERT INTO products (name, price, discount, stock) VALUES (?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Thêm log để kiểm tra dữ liệu sản phẩm trước khi thêm
//            System.out.println("Adding product: " + product.getName() + ", Price: " + product.getPrice() +
//                    ", Discount: " + product.getDiscount() + ", Stock: " + product.getStock());

            preparedStatement.setString(1, product.getName());
            preparedStatement.setBigDecimal(2, product.getPrice());
            preparedStatement.setString(3, product.getDiscount());
            preparedStatement.setInt(4, product.getStock());
            preparedStatement.executeUpdate();

            // Thêm log để xác nhận sản phẩm đã được thêm
//            System.out.println("Product added successfully.");
        } catch (SQLException e) {
            System.err.println("Error adding product: " + e.getMessage());
        }
    }

    @Override
    public void deleteProductById(int id) {
        String query = "DELETE FROM products WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);

            // Log kiểm tra sản phẩm nào được xóa
            System.out.println("Deleting product with ID: " + id);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product getProductById(int id) {
        String query = "SELECT * FROM products WHERE id = ?";
        Product product = null;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                product = new Product(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getBigDecimal("price"),
                        resultSet.getString("discount"),
                        resultSet.getInt("stock")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }
    @Override
    public void updateProduct(Product product) {
        String query = "UPDATE products SET name = ?, price = ?, discount = ?, stock = ? WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, product.getName());
            preparedStatement.setBigDecimal(2, product.getPrice());
            preparedStatement.setString(3, product.getDiscount());
            preparedStatement.setInt(4, product.getStock());
            preparedStatement.setInt(5, product.getId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
