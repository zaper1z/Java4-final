// FILE: menu.jsp (Đã sửa lại hoàn toàn phần phân quyền đăng nhập)

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index"> <i class="fa-solid fa-clapperboard me-2 text-warning"></i>POLY FILM
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/index">
                        <i class="fa-solid fa-house me-1"></i> Trang chủ
                    </a>
                </li>
                
                <c:if test="${not empty sessionScope.currentUser}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/favorites">
                            <i class="fa-solid fa-heart me-1"></i> Yêu thích
                        </a>
                    </li>
                    <c:if test="${sessionScope.currentUser.admin}">
                         <li class="nav-item">
                            <a class="nav-link text-warning fw-bold" href="${pageContext.request.contextPath}/admin/reports">
                                <i class="fa-solid fa-user-gear me-1"></i> Quản trị
                            </a>
                        </li>
                    </c:if>
                </c:if>
            </ul>
            
            <ul class="navbar-nav ms-auto align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle fw-bold text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fa-solid fa-circle-user me-2"></i>${sessionScope.currentUser.id}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/edit-profile">
                                        <i class="fa-solid fa-user-pen me-2"></i>Cập nhật hồ sơ
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="${pageContext.request.contextPath}/change-password">
                                        <i class="fa-solid fa-key me-2"></i>Đổi mật khẩu
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logoff">
                                        <i class="fa-solid fa-right-from-bracket me-2"></i>Đăng xuất
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item me-2">
                            <a class="btn btn-outline-light btn-sm rounded-pill px-3 fw-bold" href="${pageContext.request.contextPath}/login">
                                <i class="fa-solid fa-right-to-bracket me-1"></i> Đăng nhập
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-primary btn-sm rounded-pill px-3 fw-bold btn-gradient" href="${pageContext.request.contextPath}/register">
                                Đăng ký
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
           </ul>
        </div>
    </div>
</nav>