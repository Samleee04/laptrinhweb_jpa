<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp" %>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }
    
    a {
        text-decoration: none;
        color: #007bff;
        margin-right: 15px;
    }

    a:hover {
        text-decoration: underline;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    img {
        height: 150px;
        width: 200px;
        object-fit: cover; /* Đảm bảo hình ảnh có tỷ lệ khung hình chính xác */
    }
</style>

<a href="${pageContext.request.contextPath }/admin/video/add">Add Video</a>
<a href="${pageContext.request.contextPath }/admin/videos">All Videos</a>

<table>
    <tr>
        <th>STT</th>
        <th>Poster</th>
        <th>VideoID</th>
        <th>VideoTitle</th>
        <th>Description</th>
        <th>Views</th>
        <th>Category ID</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${listvideo}" var="video" varStatus="STT">
        <tr>
            <td>${STT.index + 1 }</td>
            <td>
                <c:if test="${video.poster.substring(0,5) != 'https'}">
                    <c:url value="/image?fname=${video.poster }" var="imgUrl"></c:url>
                </c:if>
                <c:if test="${video.poster.substring(0,5) == 'https'}">
                    <c:url value="${video.poster}" var="imgUrl"></c:url>
                </c:if>
                <img src="${imgUrl}" alt="${video.title}" />
            </td>
            <td>${video.videoId }</td>
            <td>${video.title }</td>
            <td>${video.description }</td>
            <td>${video.views }</td>
            <td>${video.category.categoryId }</td>
            <td>
                <c:if test="${video.active == 1}">
                    <span>Hoạt Động</span>
                </c:if>
                <c:if test="${video.active != 1}">
                    <span>Khóa</span>
                </c:if>
            </td>
            <td>
                <a href="<c:url value='/admin/video/edit?id=${video.videoId }'/>">Sửa</a>
                | <a href="<c:url value='/admin/video/delete?id=${video.videoId }'/>">Xóa</a>
            </td>
        </tr>
    </c:forEach>
</table>
