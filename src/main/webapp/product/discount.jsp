<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<label for="discount">Giảm giá:</label>
<select id="discount" name="discount" required>
    <c:forEach var="discount" items="${discounts}">
        <option value="${discount}">${discount}</option>
    </c:forEach>
</select><br>