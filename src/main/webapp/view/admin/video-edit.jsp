<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }
    
    form {
        background: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="text"],
    input[type="file"],
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="radio"] {
        margin-right: 5px;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }

    img {
        margin-top: 10px;
        max-width: 100%;
        height: auto;
    }
</style>

<form action="${pageContext.request.contextPath }/admin/video/update" method="post" enctype="multipart/form-data">
    <input type="text" id="videoid" name="videoid" value="${video.videoId }" hidden="hidden"><br>
    <label for="videotitle">Video Title: </label><br>
    <input type="text" id="videotitle" name="videotitle" value="${video.title }"><br>
    <label for="categoryid">Category:</label><br>
    <select id="categoryid" name="categoryid"> 
        <c:forEach var="cate" items="${listcate}">
            <option value="${cate.categoryId}" 
                <c:if test="${cate.categoryId == video.category.categoryId}">
                    selected
                </c:if>
            >
                ${cate.categoryname}
            </option>
        </c:forEach>
    </select><br>
    <label for="views">View Count:</label><br>
    <input type="text" id="views" name="views" value="${video.views }"><br>
    <label for="description">Description:</label><br>
    <input type="text" id="description" name="description" value="${video.description }"><br>
    <label for="images">Poster:</label><br>
    <c:if test="${video.poster.substring(0,5) != 'https'}">
        <c:url value="/image?fname=${video.poster }" var="imgUrl"></c:url>
    </c:if>
    <c:if test="${video.poster.substring(0,5) == 'https'}">
        <c:url value="${video.poster }" var="imgUrl"></c:url>
    </c:if>
    <img id="imagess" height="150" width="200" src="${imgUrl}" />
    <input type="file" onchange="chooseFile(this)" id="images" name="images" value="${video.poster }"><br>
    <label for="status">Active: </label>
    <input id="statuson" type="radio" name="status" value="1" ${video.active==1?'checked': ''}>
    <label for="statuson">Hoạt động</label>
    <input id="statusoff" type="radio" name="status" value="0" ${video.active==0?'checked': ''}>
    <label for="statusoff">Khóa</label>
    <br> 
    <input type="submit" value="edit">
</form>
