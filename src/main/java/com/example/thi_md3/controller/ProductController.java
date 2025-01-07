package com.example.thi_md3.controller;

import com.example.thi_md3.dao.IProductDAO;
import com.example.thi_md3.dao.ProductDAOImpl;
import com.example.thi_md3.model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {

    private IProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Entering doGet() in ProductController"); // Log để kiểm tra doGet được gọi

        // Lấy hành động từ tham số
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Xử lý xóa sản phẩm
            try {
                int id = Integer.parseInt(request.getParameter("id")); // Lấy ID sản phẩm từ tham số
                productDAO.deleteProductById(id); // Gọi DAO để xóa sản phẩm
                System.out.println("Deleted product with ID: " + id); // Log kiểm tra sản phẩm đã xóa

                // Chuyển hướng về danh sách sản phẩm sau khi xóa
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            } catch (NumberFormatException e) {
                System.err.println("Invalid product ID for deletion: " + e.getMessage());
            }
        } else if ("edit".equals(action)) {
            // Xử lý hiển thị form sửa sản phẩm
            try {
                int id = Integer.parseInt(request.getParameter("id")); // Lấy ID sản phẩm
                Product product = productDAO.getProductById(id); // Lấy thông tin sản phẩm từ DAO

                if (product != null) {
                    request.setAttribute("product", product); // Gửi sản phẩm đến JSP
                    request.getRequestDispatcher("/products/edit.jsp").forward(request, response);
                } else {
                    System.err.println("Product with ID " + id + " not found.");
                    response.sendRedirect(request.getContextPath() + "/products");
                }
                return;
            } catch (NumberFormatException e) {
                System.err.println("Invalid product ID for editing: " + e.getMessage());
            }
        }

        // Hiển thị danh sách sản phẩm nếu không phải hành động xóa hoặc sửa
        List<Product> products = productDAO.getAllProducts();
        System.out.println("Number of products retrieved: " + products.size()); // Log số lượng sản phẩm lấy được

        // Gửi danh sách sản phẩm đến JSP
        request.setAttribute("products", products);
        request.getRequestDispatcher("/products/list.jsp").forward(request, response);
//        System.out.println("Product list forwarded to JSP"); // Log để kiểm tra forward hoạt động
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Entering doPost() in ProductController"); // Log để kiểm tra doPost được gọi

        // Kiểm tra hành động
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            // Xử lý cập nhật sản phẩm
            try {
                int id = Integer.parseInt(request.getParameter("id")); // Lấy ID sản phẩm
                String name = request.getParameter("name");
                BigDecimal price = new BigDecimal(request.getParameter("price"));
                String discount = request.getParameter("discount");
                int stock = Integer.parseInt(request.getParameter("stock"));

                Product product = new Product(id, name, price, discount, stock);
                productDAO.updateProduct(product); // Cập nhật sản phẩm trong cơ sở dữ liệu
                System.out.println("Updated product with ID: " + id);

                // Chuyển hướng về danh sách sản phẩm
                response.sendRedirect(request.getContextPath() + "/products");
                return;
            } catch (NumberFormatException e) {
                System.err.println("Invalid data for updating product: " + e.getMessage());
            }
        }

        // Xử lý thêm sản phẩm (code cũ)
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String discount = request.getParameter("discount");
        String stockStr = request.getParameter("stock");

//        System.out.println("Received form data - Name: " + name + ", Price: " + priceStr +
//                ", Discount: " + discount + ", Stock: " + stockStr); // Log dữ liệu từ form

        String errorMessage = null;

        // Validate dữ liệu
        if (name == null || name.trim().isEmpty()) {
            errorMessage = "Name cannot be empty.";
        } else if (priceStr == null || new BigDecimal(priceStr).compareTo(new BigDecimal(100)) < 0) {
            errorMessage = "Price must be at least 100.";
        } else if (stockStr == null || Integer.parseInt(stockStr) < 10) {
            errorMessage = "Stock must be at least 10.";
        }

        if (errorMessage != null) {
            System.out.println("Validation failed: " + errorMessage); // Log thông báo lỗi
            // Gửi lỗi và quay lại form thêm sản phẩm
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("/products/add.jsp").forward(request, response);
            return;
        }

        // Thêm sản phẩm nếu dữ liệu hợp lệ
        BigDecimal price = new BigDecimal(priceStr);
        int stock = Integer.parseInt(stockStr);
        Product product = new Product(0, name, price, discount, stock);

//        System.out.println("Adding product: " + product); // Log sản phẩm trước khi thêm
        productDAO.addProduct(product);

        // Chuyển về danh sách sản phẩm với thông báo thành công
//        System.out.println("Product added successfully, redirecting to product list"); // Log chuyển hướng thành công
        response.sendRedirect(request.getContextPath() + "/products?success=1");
    }
}