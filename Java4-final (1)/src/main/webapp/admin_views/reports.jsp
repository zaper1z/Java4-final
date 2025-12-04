<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 1. INCLUDE MENU (Chứa Sidebar) --%>
<jsp:include page="/admin_views/menu.jsp" />

<%-- 2. EXTERNAL LIBRARIES & CSS --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">

<style>
    /* --- MODERN DARK ADMIN UI VARIABLES & STYLES (Đồng nhất với videos.jsp) --- */
    :root {
        --bg-main: #121212;
        --bg-card: #1f1f1f;
        --bg-input: #252b3d;
        --bg-hover: rgba(255,255,255,0.05);
        --border-color: rgba(255,255,255,0.1);

        --text-primary: #f1f5f9;
        --text-secondary: #94a3b8;
        --text-muted: #64748b;

        --accent-primary: #6366f1;
        --accent-secondary: #8b5cf6;
        --success: #10b981;
        --danger: #ef4444;
        --warning: #f59e0b;
        --info: #06b6d4; /* Màu Info dùng cho Reports */
    }

    * {
        transition: all 0.2s ease;
    }

    /* MAIN LAYOUT */
    .admin-content {
        background: linear-gradient(135deg, #0a0e1a 0%, #1a1f2e 100%);
        min-height: 100vh;
        padding: 2.5rem;
        color: var(--text-primary);
    }

    /* PAGE HEADER */
    .page-header {
        margin-bottom: 2rem;
        padding-bottom: 1.5rem;
        border-bottom: 2px solid var(--border-color);
    }

    .page-header h3 {
        font-size: 1.75rem;
        font-weight: 700;
        letter-spacing: -0.5px;
        margin: 0;
    }

    .breadcrumb-item a {
        color: var(--text-secondary);
        text-decoration: none;
    }

    /* CARD STYLES */
    .card-dark {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.4);
        overflow: hidden;
    }

    .card-body {
        padding: 2rem;
    }

    /* FORM CONTROLS (Copy từ videos.jsp) */
    .form-control-dark {
        background-color: var(--bg-input) !important;
        border: 1.5px solid var(--border-color) !important;
        color: var(--text-primary) !important;
        border-radius: 10px;
        padding: 0.75rem 1rem;
        font-size: 0.95rem;
    }

    .form-control-dark::placeholder {
        color: var(--text-muted);
    }

    .form-control-dark:focus {
        border-color: var(--accent-primary) !important;
        box-shadow: 0 0 0 4px rgba(99,102,241,0.15) !important;
        background-color: var(--bg-card) !important;
    }

    /* TABLE STYLES (Copy từ videos.jsp) */
    .table-dark {
        background: transparent !important;
        color: var(--text-primary);
    }

    .table-dark thead {
        background: linear-gradient(135deg, rgba(99,102,241,0.15), rgba(139,92,246,0.15)) !important;
    }

    .table-dark thead th {
        font-weight: 700;
        font-size: 0.85rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        padding: 1rem;
        border: none !important;
        color: var(--text-primary);
    }

    .table-dark tbody tr {
        border-bottom: 1px solid var(--border-color);
    }

    .table-dark tbody tr:hover {
        background: var(--bg-hover) !important;
    }

    .table-dark td {
        padding: 1rem;
        vertical-align: middle;
        border: none !important;
    }

    /* TABS STYLES */
    .report-tabs {
        display: flex;
        background: var(--bg-card);
        border-radius: 12px 12px 0 0;
        border: 1px solid var(--border-color);
        border-bottom: none;
        padding: 0.75rem 1rem 0 1rem;
        overflow: hidden;
    }

    .btn-report-tab {
        padding: 0.75rem 1.25rem;
        font-weight: 600;
        color: var(--text-secondary);
        background: transparent;
        border: none;
        border-bottom: 3px solid transparent;
        transition: all 0.2s ease;
        margin-right: 0.5rem;
    }

    .btn-report-tab.active {
        color: var(--info); /* Màu xanh ngọc cho tab active */
        border-bottom: 3px solid var(--info);
        background: rgba(6, 182, 212, 0.05);
    }

    .btn-report-tab:hover:not(.active) {
        color: var(--text-primary);
    }

    .report-content-wrapper {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 0 0 12px 12px;
        border-top: none;
        min-height: 400px; /* Đảm bảo chiều cao tối thiểu */
    }
</style>

<div class="admin-content">
    <div class="container-fluid">
        <div class="page-header d-flex justify-content-between align-items-center">
            <h3><i class="fa-solid fa-chart-line me-3" style="color: var(--info);"></i>Báo Cáo - Thống Kê</h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="#" class="text-decoration-none">Admin</a></li>
                    <li class="breadcrumb-item active text-white" aria-current="page">Reports</li>
                </ol>
            </nav>
        </div>

        <div class="report-tabs" role="tablist">
            <button class="btn-report-tab active" data-report="favorites">
                <i class="fa-solid fa-heart me-2"></i>Favorites
            </button>
            <button class="btn-report-tab" data-report="favorite-users">
                <i class="fa-solid fa-users me-2"></i>Favorite Users
            </button>
            <button class="btn-report-tab" data-report="shared-friends">
                <i class="fa-solid fa-share-alt me-2"></i>Shared Friends
            </button>
        </div>

        <div class="report-content-wrapper p-4">

            <div id="favorites" class="report-panel">
                <h5 class="text-secondary fw-bold mb-3">Thống kê số người yêu thích từng tiêu phẩm</h5>

                <div class="table-responsive">
                    <table class="table table-dark table-hover mb-0 align-middle">
                        <thead>
                        <tr>
                            <th class="ps-4" style="width: 40%;">VIDEO TITLE</th>
                            <th style="width: 20%;">FAVORITE COUNT</th>
                            <th style="width: 20%;">LATEST DATE</th>
                            <th class="text-end pe-4" style="width: 20%;">OLDEST DATE</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- Dữ liệu thực tế từ JSTL/Servlet --%>
                        <c:forEach var="item" items="${favoriteVideos}">
                            <tr>
    <td class="ps-4">${item['videoTitle']}</td> 
    <td class="text-info fw-semibold">${item['favoriteCount']}</td>
    <td>${item['latestDate']}</td>
    <td class="text-end pe-4">${item['oldestDate']}</td>
</tr>
                        </c:forEach>

                        <%-- Dữ liệu mẫu (Giống trong hình ảnh) --%>
                        <tr>
                            <td class="ps-4">kỷ băng hà: Trái đất sập</td>
                            <td class="text-info fw-semibold">2,150</td>
                            <td>2025-11-18</td>
                            <td class="text-end pe-4">2025-01-01</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="favorite-users" class="report-panel" style="display: none;">
                <h5 class="text-secondary fw-bold mb-3">Lọc người yêu thích theo tiêu phẩm</h5>

                <div class="mb-4" style="max-width: 300px;">
                    <input type="text" class="form-control form-control-dark"
                           placeholder="-- Tất cả Video --">
                </div>

                <div class="table-responsive">
                    <table class="table table-dark table-hover mb-0 align-middle">
                        <thead>
                        <tr>
                            <th class="ps-4" style="width: 15%;">USERNAME</th>
                            <th style="width: 30%;">FULLNAME</th>
                            <th style="width: 30%;">EMAIL</th>
                            <th class="text-end pe-4" style="width: 25%;">FAVORITE DATE</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- Dữ liệu thực tế từ JSTL/Servlet --%>
                        <c:forEach var="item" items="${favoriteUsers}">
                            <tr>
                                <td class="ps-4">
                                    <code style="color: var(--warning);">${item.username}</code>
                                </td>
                                <td>${item.fullname}</td>
                                <td>${item.email}</td>
                                <td class="text-end pe-4 text-info">${item.favoriteDate}</td>
                            </tr>
                        </c:forEach>

                        <%-- Dữ liệu mẫu (Giống trong hình ảnh) --%>
                        <tr>
                            <td class="ps-4">
                                <code style="color: var(--warning);">hoangnmt</code>
                            </td>
                            <td>Hoàng Minh Tuấn</td>
                            <td>hoangnmt@fpoly.edu.vn</td>
                            <td class="text-end pe-4 text-info">2025-11-18</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div id="shared-friends" class="report-panel" style="display: none;">
                <h5 class="text-secondary fw-bold mb-3">Lọc người gửi & người nhận theo tiêu phẩm được chia sẻ</h5>

                <div class="mb-4" style="max-width: 300px;">
                    <input type="text" class="form-control form-control-dark"
                           placeholder="-- Tất cả Video --">
                </div>

                <div class="table-responsive">
                    <table class="table table-dark table-hover mb-0 align-middle">
                        <thead>
                        <tr>
                            <th class="ps-4" style="width: 25%;">SENDER NAME</th>
                            <th style="width: 25%;">SENDER EMAIL</th>
                            <th style="width: 25%;">RECEIVER EMAIL</th>
                            <th class="text-end pe-4" style="width: 25%;">SENT DATE</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- Dữ liệu thực tế từ JSTL/Servlet --%>
                        <c:forEach var="item" items="${sharedFriends}">
                            <tr>
                                <td class="ps-4">${item.senderName}</td>
                                <td>${item.senderEmail}</td>
                                <td>${item.receiverEmail}</td>
                                <td class="text-end pe-4">${item.sentDate}</td>
                            </tr>
                        </c:forEach>

                        <%-- Dữ liệu mẫu (Giống trong hình ảnh) --%>
                        <tr>
                            <td class="ps-4">Nguyễn Văn Tèo</td>
                            <td>teonv@gmail.com</td>
                            <td>poly@gmail.com</td>
                            <td class="text-end pe-4">2025-11-19</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
    // Tab switching logic
    document.querySelectorAll('.report-tabs .btn-report-tab').forEach(button => {
        button.addEventListener('click', function() {
            // Remove 'active' from all buttons
            document.querySelectorAll('.report-tabs .btn-report-tab').forEach(btn => btn.classList.remove('active'));
            // Hide all report panels
            document.querySelectorAll('.report-panel').forEach(panel => panel.style.display = 'none');

            // Activate the clicked button
            this.classList.add('active');

            // Show the corresponding panel
            const targetId = this.getAttribute('data-report');
            const targetPanel = document.getElementById(targetId);
            if (targetPanel) {
                targetPanel.style.display = 'block';
            }
        });
    });

    // Khởi tạo tab mặc định là 'favorites' (giống hình ảnh đầu tiên của tab active)
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.report-panel').forEach(panel => {
            panel.style.display = 'none';
        });
        const activeTabId = document.querySelector('.btn-report-tab.active').getAttribute('data-report');
        const defaultPanel = document.getElementById(activeTabId);
        if(defaultPanel) {
            defaultPanel.style.display = 'block';
        }
    });
</script>