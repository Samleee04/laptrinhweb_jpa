<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<style>
    body {
        font-family: Arial, sans-serif; /* Chọn font chữ */
    }
    .logout-btn {
        position: absolute; /* Định vị nút */
        top: 20px; /* Khoảng cách từ trên cùng */
        right: 20px; /* Khoảng cách từ bên phải */
        padding: 10px 15px; /* Kích thước nút */
        background-color: #dc3545; /* Màu đỏ */
        color: white; /* Màu chữ */
        border: none; /* Bỏ viền */
        border-radius: 5px; /* Bo góc nút */
        cursor: pointer; /* Đổi con trỏ khi hover */
        transition: background-color 0.3s; /* Hiệu ứng chuyển đổi */
    }
    .logout-btn:hover {
        background-color: #c82333; /* Màu đỏ đậm khi hover */
    }
</style>
</head>
<body>
 <h1> Trang chủ của admin</h1>
 <form action="${pageContext.request.contextPath }/admin/categories" method="get"> <!-- Thay đổi action theo đường dẫn đến trang login của bạn -->
     <button type="submit" class="logout-btn">Category</button>
 </form>
  <form action="${pageContext.request.contextPath }/admin/videos"> <!-- Thay đổi action theo đường dẫn đến trang login của bạn -->
     <button type="submit" >Video</button>
 </form>
</body>
</html>