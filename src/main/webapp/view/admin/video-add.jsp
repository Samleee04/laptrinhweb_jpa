<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/commons/taglib.jsp" %>
<form action="${pageContext.request.contextPath }/admin/video/insert" method="post" enctype="multipart/form-data">
    <label for="images">Poster: </label><br>
    <div style="width:100px; height:100px">
        <img alt="images" id="imagess" src="" width="100px" height="100px" />
    </div><br>
    Nhập link: <input type="text" id="images1" name="images1"><br>
    Hoặc tải file:
    <input type="file" onchange="chooseFile(this)" id="images" name="images"><br>

    <label for="videoid">Video ID:</label><br>
    <input type="text" id="videoid" name="videoid"><br>

    <label for="videotitle">Video Title:</label><br>
    <input type="text" id="videotitle" name="videotitle"><br>

    <label for="views">View Count:</label><br>
    <input type="text" id="views" name="views"><br>

    <label for="description">Description:</label><br>
    <input type="text" id="description" name="description"><br>

    <label for="categoryid">Category:</label><br>
	<select id="categoryid" name="categoryid">
	    <c:forEach var="cate" items="${listcate}">
	        <option value="${cate.categoryId}">${cate.categoryname}</option>
	    </c:forEach>
	</select><br>

    <label for="status">Status: </label>
    <input id="statuson" type="radio" name="status" value="1" ${video.active==1?'checked': ''}>
    <label for="statuson">Hoạt động</label>
    <input id="statusoff" type="radio" name="status" value="0" ${video.active==0?'checked': ''}>
    <label for="statusoff">Khóa</label>

    <br> <input type="submit" value="Submit">
</form>