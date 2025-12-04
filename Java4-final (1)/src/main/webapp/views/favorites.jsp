<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Yêu Thích</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-4 mb-5">
        <div class="alert alert-primary d-flex align-items-center shadow-sm" role="alert">
            <i class="fa-solid fa-heart text-danger fa-2x me-3"></i>
            <div>
                <h4 class="alert-heading mb-0">Danh Sách Yêu Thích</h4>
                <p class="mb-0">Những video bạn đã lưu lại.</p>
            </div>
        </div>

<div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 g-4">
            <c:forEach var="fav" items="${favoriteList}">
                <div class="col">
                    <div class="card h-100 movie-card bg-bg-card border-0 shadow-lg">
                         <a href="detail?id=${fav.video.id}" class="poster-frame">
                            <img src="poster/${fav.video.poster}" alt="${fav.video.title}" class="card-img-top">
                        </a>
                        <div class="card-body p-3">
                            <h6 class="card-title text-truncate fw-bold text-white mb-1" title="${fav.video.title}">${fav.video.title}</h6>
                            <p class="card-text small text-muted">Ngày thích: ${fav.likeDate}</p>
                        </div>
                         <div class="card-footer bg-bg-card border-top border-secondary border-opacity-25 d-flex justify-content-between p-3">
                            <a href="unlike?id=${fav.video.id}" class="btn btn-sm btn-outline-danger w-100 me-2 fw-bold">Bỏ thích</a>
                            <a href="share?id=${fav.video.id}" class="btn btn-sm btn-outline-light w-100 fw-bold">Chia sẻ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty favoriteList}">
                <div class="col-12 text-center mt-5">
                    <p class="text-white display-6 opacity-75"><i class="fa-regular fa-face-frown me-2"></i>Danh sách trống!</p>
                    <a href="index" class="btn btn-primary btn-gradient mt-3 fw-bold">Quay lại xem phim</a>
                </div>
            </c:if>
        </div>
    </div>
    </div>

    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>