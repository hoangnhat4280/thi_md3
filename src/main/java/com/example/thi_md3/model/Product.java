package com.example.thi_md3.model;

public class Product {
    private int productId;
    private String name;
    private double price;
    private String discount;
    private int stock;

    public Product(int productId, String name, double price, String discount, int stock) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.discount = discount;
        this.stock = stock;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
