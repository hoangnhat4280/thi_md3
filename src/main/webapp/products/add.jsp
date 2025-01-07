<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Product</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body><body>
<div class="container mt-5">
  <h1 class="text-center mb-4">Add New Product</h1>
  <form action="${pageContext.request.contextPath}/products" method="post" class="card p-4 shadow">
    <div class="mb-3">
      <%--@declare id="name"--%><label for="name" class="form-label">Name</label>
      <input type="text" name="name" class="form-control" required>
    </div>
    <div class="mb-3">
      <%--@declare id="price"--%><label for="price" class="form-label">Price</label>
      <input type="number" name="price" class="form-control" min="100" required>
    </div>
    <div class="mb-3">
      <%--@declare id="discount"--%><label for="discount" class="form-label">Discount</label>
      <select name="discount" class="form-select" required>
        <option value="5%">5%</option>
        <option value="10%">10%</option>
        <option value="15%">15%</option>
        <option value="20%">20%</option>
      </select>
    </div>
    <div class="mb-3">
      <%--@declare id="stock"--%><label for="stock" class="form-label">Stock</label>
      <input type="number" name="stock" class="form-control" min="10" required>
    </div>
    <button type="submit" class="btn btn-success w-100">Add Product</button>
  </form>
</div>
</body>
</html>