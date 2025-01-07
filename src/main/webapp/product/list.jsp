<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>Danh sách sản phẩm</h2>
<table border="1">
    <tr>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Giảm giá</th>
        <th>Tồn kho</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.discount}</td>
            <td>${product.stock}</td>
        </tr>
    </c:forEach>
</table>

<!-- Phần Thêm mới sản phẩm -->
<h2>Thêm mới sản phẩm</h2>
<form action="products" method="POST">
    <label for="name">Tên sản phẩm:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="price">Giá:</label>
    <input type="number" id="price" name="price" required><br>

    <label for="discount">Giảm giá:</label>
    <select id="discount" name="discount" required>
        <option value="5%">5%</option>
        <option value="10%">10%</option>
        <option value="15%">15%</option>
        <option value="20%">20%</option>
    </select><br>

    <label for="stock">Tồn kho:</label>
    <input type="number" id="stock" name="stock" required><br>

    <button type="submit">Thêm sản phẩm</button>
</form>
