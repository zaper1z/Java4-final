<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Poly Film - Giải Trí Đỉnh Cao</title>
    <jsp:include page="head.jsp"></jsp:include>
    <style>
        /* Banner sáng hơn */
        .hero-img { 
            height: 500px; 
            object-fit: cover; 
            filter: brightness(0.85); /* Sáng hơn bản cũ */
        }
        /* Gradient che chân ảnh để chữ dễ đọc mà ảnh vẫn sáng */
        .hero-overlay {
            position: absolute;
            bottom: 0; left: 0; right: 0;
            height: 50%;
            background: linear-gradient(to top, var(--bg-body), transparent);
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div id="heroCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active position-relative">
                <img src="https://wallpapers.com/images/hd/avengers-infinity-war-4k-8k-1tqbdks3q0h4b54g.jpg" class="d-block w-100 hero-img" alt="Banner 1">
                <div class="hero-overlay"></div> <div class="carousel-caption d-none d-md-block text-start container pb-5">
                    <h2 class="display-4 fw-bold text-white" style="text-shadow: 0 0 20px rgba(0,0,0,0.8);">
                        SIÊU PHẨM <span class="text-gradient">BOM TẤN</span>
                    </h2>
                    <p class="fs-5 text-light">Trải nghiệm điện ảnh sống động ngay tại nhà.</p>
                    <a href="#trending" class="btn btn-gradient btn-lg rounded-pill px-4 mt-2">
                        <i class="fa-solid fa-play me-2"></i> Xem Ngay
                    </a>
                </div>
            </div>
            <div class="carousel-item position-relative">
                <img src="https://images.hdqwalls.com/wallpapers/avatar-the-way-of-water-5k-1a.jpg" class="d-block w-100 hero-img" alt="Banner 2">
                <div class="hero-overlay"></div>
                <div class="carousel-caption d-none d-md-block text-start container pb-5">
                    <h2 class="display-4 fw-bold text-white">
                        KHÁM PHÁ <span class="text-gradient">THẾ GIỚI MỚI</span>
                    </h2>
                    <p class="fs-5 text-light">Hàng ngàn video 4K sắc nét đang chờ đón.</p>
                    <a href="#trending" class="btn btn-gradient btn-lg rounded-pill px-4 mt-2">
                        <i class="fa-solid fa-fire me-2"></i> Thịnh Hành
                    </a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

// FILE: index.jsp (Cập nhật cấu trúc HTML/CSS cho card và phân trang)

// ... (Giữ nguyên phần trên: head, menu, carousel)

    <div class="container mt-5 mb-5">
        <h4 class="text-white mb-4 fw-bold text-uppercase"><i class="fa-solid fa-fire me-2 text-neon-orange"></i>Video Thịnh Hành</h4>

        <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5 g-4">
            <c:forEach var="item" items="${items}">
                <div class="col">
                    <div class="card h-100 movie-card bg-bg-card border-0 shadow-lg">
                        <a href="detail?id=${item.id}" class="poster-frame">
                            <img src="poster/${item.poster}" alt="${item.title}" class="card-img-top">
                        </a>
                        <div class="card-body p-3">
                            <h6 class="card-title text-truncate fw-bold text-white mb-1" title="${item.title}">${item.title}</h6>
                            <p class="card-text small text-muted">${item.views} lượt xem</p>
                        </div>
                        <div class="card-overlay">
                             <a href="detail?id=${item.id}" class="btn btn-danger btn-lg rounded-circle shadow-lg">
                                <i class="fa-solid fa-play"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <c:if test="${empty items}">
            <div class="alert alert-warning text-center mt-5" role="alert">
                <i class="fa-solid fa-triangle-exclamation me-2"></i>Hiện tại chưa có video nào được đăng tải!
            </div>
        </c:if>

        <%-- PHÂN TRANG: Chỉ hiển thị khi có video --%>
        <c:if test="${not empty items}">
            <nav class="mt-5">
                <ul class="pagination justify-content-center">
                    <li class="page-item <c:if test="${currentPage == 0}">disabled</c:if>">
                        <a class="page-link bg-dark text-secondary border-secondary" href="index?page=${currentPage-1}">Previous</a>
                    </li>
                    <li class="page-item">
                        <span class="page-link bg-primary text-white border-primary fw-bold">${currentPage + 1}</span>
                    </li>
                    <li class="page-item">
                        <a class="page-link bg-dark text-secondary border-secondary" href="index?page=${currentPage+1}">Next</a>
                    </li>
                </ul>
            </nav>
        </c:if>
    </div>

// ... (Giữ nguyên footer)

    <footer>
        <div class="container text-center">
            <h4 class="fw-bold mb-3 text-white">POLY <span class="text-gradient">FILM</span></h4>
            <p class="small mb-4 opacity-75">Mang cả rạp chiếu phim về ngôi nhà của bạn.</p>
            
            <div class="mb-4 social-icons">
                <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 40px; height: 40px;"><i class="fa-brands fa-facebook-f lh-base"></i></a>
                <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 40px; height: 40px;"><i class="fa-brands fa-youtube lh-base"></i></a>
                <a href="#" class="btn btn-outline-light btn-sm rounded-circle" style="width: 40px; height: 40px;"><i class="fa-brands fa-tiktok lh-base"></i></a>
            </div>
            
            <div class="border-top border-secondary border-opacity-25 pt-3 small">
                &copy; 2025 Assignment Java 4. All rights reserved.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        .hover-danger:hover { color: #ff6b6b !important; }
        .hover-primary:hover { color: #7c4dff !important; }
    </style>
</body>
</html>