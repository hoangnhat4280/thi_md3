
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<h1>Edit Product</h1>
<form action="${pageContext.request.contextPath}/products" method="post" class="card p-4 shadow">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${product.id}">
    <div class="mb-3">
        <%--@declare id="name"--%><label for="name" class="form-label">Name</label>
        <input type="text" name="name" class="form-control" value="${product.name}" required>
    </div>
    <div class="mb-3">
        <%--@declare id="price"--%><label for="price" class="form-label">Price</label>
        <input type="number" name="price" class="form-control" value="${product.price}" min="100" required>
    </div>
    <div class="mb-3">
        <%--@declare id="discount"--%><label for="discount" class="form-label">Discount</label>
        <select name="discount" class="form-select" required>
            <option value="5%" ${product.discount == '5%' ? 'selected' : ''}>5%</option>
            <option value="10%" ${product.discount == '10%' ? 'selected' : ''}>10%</option>
            <option value="15%" ${product.discount == '15%' ? 'selected' : ''}>15%</option>
            <option value="20%" ${product.discount == '20%' ? 'selected' : ''}>20%</option>
        </select>
    </div>
    <div class="mb-3">
        <%--@declare id="stock"--%><label for="stock" class="form-label">Stock</label>
        <input type="number" name="stock" class="form-control" value="${product.stock}" min="10" required>
    </div>
    <button type="submit" class="btn btn-primary w-100">Update Product</button>
</form>
</body>
</html>
