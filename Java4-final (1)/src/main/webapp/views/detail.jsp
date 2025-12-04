<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${video.title}</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

 <div class="container mt-4 mb-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow mb-4 bg-bg-card border-0">
                    <div class="ratio ratio-16x9 rounded-top overflow-hidden">
                        <iframe src="https://www.youtube.com/embed/${video.id}" title="${video.title}" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title fw-bold" style="color: var(--neon-orange);">${video.title}</h3>
                        <div class="d-flex justify-content-between align-items-center my-3 border-bottom border-secondary pb-3">
                            <span class="badge bg-secondary p-2"><i class="fa-solid fa-eye me-1"></i> ${video.views} Lượt xem</span>
                            <div>
                                <a href="like?id=${video.id}" class="btn btn-danger btn-sm me-2"><i class="fa-solid fa-heart me-1"></i> Thích</a>
                                <a href="share?id=${video.id}" class="btn btn-info btn-sm text-white"><i class="fa-solid fa-share-nodes me-1"></i> Chia sẻ</a>
                            </div>
                        </div>
                        <p class="text-white-50">${video.description}</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card shadow-sm bg-bg-card border-0">
                    <div class="card-header-theme bg-secondary text-white fw-bold p-3 rounded-top">
                        <i class="fa-solid fa-clock-rotate-left me-2"></i>VIDEO ĐÃ XEM
                    </div>
                    <div class="list-group list-group-flush">
                        <c:forEach var="watched" items="${watchedList}">
                            <a href="detail?id=${watched.id}" class="list-group-item list-group-item-action bg-bg-card border-secondary text-white d-flex align-items-center p-2">
                                <img src="poster/${watched.poster}" class="rounded me-3" width="70" height="50" style="object-fit: cover;">
                                <div>
                                    <h6 class="mb-0 fw-bold" style="font-size: 0.95rem; color: var(--neon-purple);">${watched.title}</h6>
                                    <small class="text-muted">Xem lại</small>
                                </div>
                            </a>
                        </c:forEach>
                        <c:if test="${empty watchedList}">
                            <div class="p-3 text-center text-muted">Chưa có lịch sử xem.</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>