<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="jakarta.tags.core" %>
<form action="${pageContext.request.contextPath }/admin/category/update" method="post">
	<input type="text" id="categoryid" name="categoryid" value="${cate.categoryId}" hidden ="hidden"><br>
  <label for="categoryname">Category Name:</label><br>
  <input type="text" id="categoryname" name="categoryname" value="${cate.categoryname}"><br>
  <label for="lname">Images:</label><br>
	<c:if test="${cate.images.substring(0,5)!='https'}">
	 	<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
	</c:if>
	<c:if test="${cate.images.substring(0,5)!='https'}">
	 	<c:url value="${cate.images}" var="imgUrl"></c:url>
	</c:if>
	<img height="150" width="200" src="${imgUrl}" />
  <input type="file" onchange="chooseFile(this)" id="images" name="images" value="${cate.images}"><br>
   <label for="lname">Status:</label><br>
    <input type="radio" id="ston" name="status" value="1" ${cate.status==1?'checked':'' } >
    <label for="html">Đang hoạt động</label><br>
    <input type="radio" id="stoff" name="status" value="0" ${cate.status!=1?'checked':'' }>
    <label for="css">Khóa</label><br><br><br>
  <input type="submit" value="Update">
</form> 