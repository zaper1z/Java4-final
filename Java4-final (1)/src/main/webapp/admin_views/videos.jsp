<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/admin_views/menu.jsp" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet">

<style>
    /* --- MODERN DARK ADMIN UI --- */
    :root {
        --bg-main: #121212; /* Nền Chính */
        --bg-card: #1f1f1f;
        --info: #03dac6;
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
        --info: #06b6d4;
    }

    * {
        transition: all 0.2s ease;
    }

    body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
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

    .breadcrumb {
        background: transparent;
        padding: 0;
        margin: 0;
    }

    .breadcrumb-item a {
        color: var(--text-secondary);
        text-decoration: none;
    }

    .breadcrumb-item a:hover {
        color: var(--accent-primary);
    }

    /* CARD STYLES */
    .card-dark {
        background: var(--bg-card);
        border: 1px solid var(--border-color);
        border-radius: 16px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.4);
        overflow: hidden;
        backdrop-filter: blur(10px);
    }

    .card-header-dark {
        padding: 1.5rem 2rem;
        background: linear-gradient(135deg, rgba(99,102,241,0.1), rgba(139,92,246,0.1));
        border-bottom: 1px solid var(--border-color);
    }

    .card-header-dark h5 {
        font-size: 1.1rem;
        font-weight: 700;
        letter-spacing: 0.5px;
        margin: 0;
        color: var(--text-primary);
    }

    .card-body {
        padding: 2rem;
    }

    /* FORM CONTROLS */
    .form-label {
        font-size: 0.875rem;
        font-weight: 600;
        color: var(--text-secondary);
        margin-bottom: 0.5rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .form-control-dark {
        background-color: var(--bg-input) !important;
        border: 1.5px solid var(--border-color) !important;
        color: var(--text-primary) !important;
        border-radius: 12px;
        padding: 0.75rem 1rem;
        font-size: 0.95rem;
    }

    .form-control-dark::placeholder {
        color: var(--text-muted);
    }

    .form-control-dark:hover {
        border-color: rgba(99,102,241,0.4) !important;
    }

    .form-control-dark:focus {
        border-color: var(--accent-primary) !important;
        box-shadow: 0 0 0 4px rgba(99,102,241,0.15) !important;
        background-color: var(--bg-card) !important;
    }

    /* POSTER PREVIEW */
    .poster-preview {
        position: relative;
        border-radius: 12px;
        overflow: hidden;
        border: 2px solid var(--border-color);
        background: var(--bg-input);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .poster-preview:hover {
        transform: translateY(-4px);
        box-shadow: 0 12px 40px rgba(99,102,241,0.3);
    }

    .poster-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* BUTTONS */
    .btn {
        border-radius: 10px;
        padding: 0.65rem 1.5rem;
        font-weight: 600;
        font-size: 0.9rem;
        letter-spacing: 0.3px;
        transition: all 0.3s ease;
    }

    .btn-gradient {
        background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary));
        border: none;
        color: white !important;
        box-shadow: 0 4px 15px rgba(99,102,241,0.4);
    }

    .btn-gradient:hover:not(:disabled) {
        transform: translateY(-2px);
        box-shadow: 0 6px 25px rgba(99,102,241,0.6);
    }

    .btn-success {
        background: var(--success);
        border: none;
    }

    .btn-success:hover:not(:disabled) {
        background: #059669;
        transform: translateY(-2px);
    }

    .btn-danger {
        background: var(--danger);
        border: none;
    }

    .btn-danger:hover:not(:disabled) {
        background: #dc2626;
        transform: translateY(-2px);
    }

    .btn-secondary {
        background: var(--bg-input);
        border: 1px solid var(--border-color);
        color: var(--text-primary);
    }

    .btn-secondary:hover {
        background: var(--bg-hover);
        border-color: var(--text-secondary);
    }

    .btn-outline-light {
        border: 1.5px solid var(--border-color);
        color: var(--text-primary);
        background: transparent;
    }

    .btn-outline-light:hover {
        background: var(--bg-hover);
        border-color: var(--accent-primary);
        color: var(--accent-primary);
    }

    .btn-outline-info {
        border: 1.5px solid var(--info);
        color: var(--info);
    }

    .btn-outline-info:hover {
        background: var(--info);
        color: white;
    }

    .btn:disabled {
        opacity: 0.4;
        cursor: not-allowed;
    }

    /* TABLE STYLES */
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
        transform: scale(1.01);
    }

    .table-dark td {
        padding: 1rem;
        vertical-align: middle;
        border: none !important;
    }

    /* BADGES */
    .badge {
        padding: 0.4rem 0.9rem;
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.8rem;
        letter-spacing: 0.3px;
    }

    .bg-success {
        background: linear-gradient(135deg, #10b981, #059669) !important;
    }

    .bg-danger {
        background: linear-gradient(135deg, #ef4444, #dc2626) !important;
    }

    /* SEARCH BAR */
    .search-wrapper {
        position: relative;
    }

    .search-wrapper .form-control {
        padding-right: 3rem;
        border-radius: 10px !important;
    }

    .search-wrapper .btn {
        position: absolute;
        right: 0;
        top: 0;
        height: 100%;
        border-radius: 0 10px 10px 0 !important;
    }

    /* RADIO BUTTONS */
    .form-check-input:checked {
        background-color: var(--accent-primary);
        border-color: var(--accent-primary);
    }

    .form-check-label {
        color: var(--text-secondary);
        font-weight: 500;
    }

    /* PAGINATION */
    .btn-group .btn {
        border-color: var(--border-color);
    }

    .btn-group .btn:hover {
        background: var(--accent-primary);
        border-color: var(--accent-primary);
        color: white;
    }

    /* ANIMATIONS */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .card-dark {
        animation: fadeIn 0.5s ease;
    }

    /* SCROLLBAR */
    ::-webkit-scrollbar {
        width: 10px;
        height: 10px;
    }

    ::-webkit-scrollbar-track {
        background: var(--bg-main);
    }

    ::-webkit-scrollbar-thumb {
        background: var(--bg-input);
        border-radius: 5px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: var(--accent-primary);
    }
</style>

<div class="admin-content">
    <div class="container-fluid">
        <div class="page-header d-flex justify-content-between align-items-center">
            <h3><i class="fa-solid fa-clapperboard me-3" style="color: var(--warning);"></i>Quản Lý Video</h3>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="#" class="text-decoration-none text-secondary">Admin</a></li>
                    <li class="breadcrumb-item active text-white" aria-current="page">Videos</li>
                </ol>
            </nav>
        </div>

        <div class="card card-dark mb-4">
            <div class="card-header bg-dark text-white">
                <h5><i class="fa-solid fa-pen-to-square me-2 text-warning"></i>Thông Tin Video</h5>
            </div>

            <div class="card-body">
                <form action="/admin/videos" method="post" enctype="multipart/form-data">
                    <div class="row g-4">
                        <div class="col-lg-4">
                            <div class="text-center">
                                <div class="poster-preview ratio ratio-2x3 mb-3" style="max-height: 380px;">
                                    <img src="${not empty video.poster ? video.poster : 'https://via.placeholder.com/300x450?text=No+Poster'}"
                                         alt="Poster Preview">
                                </div>
                                <label class="btn btn-outline-light w-100">
                                    <i class="fa-solid fa-cloud-arrow-up me-2"></i>Tải Lên Poster
                                    <input type="file" name="posterFile" accept="image/*" hidden>
                                </label>
                            </div>
                        </div>

                        <div class="col-lg-8">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Youtube ID</label>
                                    <input type="text" name="id" value="" class="form-control form-control-dark"
                                           placeholder="Ví dụ: dQw4w9WgXcQ" ${not empty video.id ? 'readonly' : ''}>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Lượt Xem</label>
                                    <input type="number" name="views" value="${empty video.views ? 0 : video.views}" 
                                           class="form-control form-control-dark" readonly>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Tiêu Đề Video</label>
                                    <input type="text" name="title" value="" class="form-control form-control-dark"
                                           placeholder="Nhập tiêu đề video..." required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label">Mô Tả</label>
                                    <textarea name="description" class="form-control form-control-dark" rows="4" 
                                              placeholder="Nhập mô tả chi tiết về video..."></textarea>
                                </div>
                                <div class="col-12">
                                    <label class="form-label d-block">Trạng Thái</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="active" id="activeTrue" 
                                               value="true" ${video.active or empty video.id ? 'checked' : ''}>
                                        <label class="form-check-label" for="activeTrue">
                                            <i class="fa-solid fa-circle-check text-success me-1"></i>Hoạt Động
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="active" id="activeFalse" 
                                               value="false" ${!video.active and not empty video.id ? 'checked' : ''}>
                                        <label class="form-check-label" for="activeFalse">
                                            <i class="fa-solid fa-circle-xmark text-danger me-1"></i>Tạm Ngưng
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-4 pt-4 border-top" style="border-color: var(--border-color) !important;">
                                <div class="d-flex gap-2 flex-wrap">
                                    <button type="submit" name="action" value="create" class="btn btn-gradient" ${not empty video.id ? 'disabled' : ''}>
                                        <i class="fa-solid fa-plus-circle me-2"></i>Thêm Mới
                                    </button>
                                    <button type="submit" name="action" value="update" class="btn btn-success" ${empty video.id ? 'disabled' : ''}>
                                        <i class="fa-solid fa-floppy-disk me-2"></i>Cập Nhật
                                    </button>
                                    <button type="submit" name="action" value="delete" class="btn btn-danger" ${empty video.id ? 'disabled' : ''}>
                                        <i class="fa-solid fa-trash-can me-2"></i>Xóa
                                    </button>
                                    <button type="submit" name="action" value="reset" class="btn btn-secondary">
                                        <i class="fa-solid fa-arrow-rotate-left me-2"></i>Làm Mới
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="card card-dark">
            <div class="card-header-dark d-flex justify-content-between align-items-center flex-wrap gap-3">
                <h5><i class="fa-solid fa-film me-2 text-warning"></i>Danh Sách Video</h5>
                <div class="search-wrapper" style="width: 320px;">
                    <input type="text" class="form-control form-control-dark" placeholder="Tìm kiếm video..." 
                           onkeyup="searchTable(this.value)">
                    <button class="btn btn-outline-light">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-dark table-hover mb-0 align-middle" id="videoTable">
                        <thead>
                        <tr>
                            <th class="ps-4" style="width: 15%;">
                                <i class="fa-brands fa-youtube text-danger me-2"></i>Youtube ID
                            </th>
                            <th style="width: 40%;">
                                <i class="fa-solid me-2"></i>Tiêu Đề
                            </th>
                            <th style="width: 15%;">
                                <i class="fa-solid fa-eye me-2"></i>Lượt Xem
                            </th>
                            <th style="width: 15%;">
                                <i class="fa-solid fa-signal me-2"></i>Trạng Thái
                            </th>
                            <th class="text-end pe-4" style="width: 15%;">
                                <i class="fa-solid fa-gear me-2"></i>Thao Tác
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="v" items="${videos}">
                            <tr>
                                <td class="ps-4">
                                    <code style="color: var(--warning); font-weight: 600;">${v.id}</code>
                                </td>
                                <td>
                                    <div class="text-truncate" style="max-width: 400px;" title="${v.title}">
                                        ${v.title}
                                    </div>
                                </td>
                                <td>
                                    <span class="text-info fw-semibold">
                                        <i class="fa-solid fa-chart-line me-1"></i>views
                                    </span>
                                </td>
                                <td>
                                    <span class="badge ${v.active ? 'bg-success' : 'bg-danger'}">
                                        <i class="fa-solid ${v.active ? 'fa-check-circle' : 'fa-times-circle'} me-1"></i>
                                         'Hoạt Động' : 'Tạm Ngưng'
                                    </span>
                                </td>
                                <td class="text-end pe-4">
                                    <a href="/admin/videos?action=edit&id=${v.id}" class="btn btn-sm btn-outline-info">
                                        <i class="fa-solid fa-pen-to-square me-1"></i>Sửa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <!-- Sample Data -->
                        <tr>
                            <td class="ps-4">
                                <code style="color: var(--warning); font-weight: 600;">Ytet_bPIRCU</code>
                            </td>
                            <td>
                                <div class="text-truncate" style="max-width: 400px;">
                                    Lâu ghê mới gặp - Trấn Thành
                                </div>
                            </td>
                            <td>
                                <span class="text-info fw-semibold">
                                    <i class="fa-solid fa-chart-line me-1"></i>1,205
                                </span>
                            </td>
                            <td>
                                <span class="badge bg-success">
                                    <i class="fa-solid fa-check-circle me-1"></i>Hoạt Động
                                </span>
                            </td>
                            <td class="text-end pe-4">
                                <a href="#" class="btn btn-sm btn-outline-info">
                                    <i class="fa-solid fa-pen-to-square me-1"></i>Sửa
                                </a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card-footer bg-transparent text-center py-3" style="border-top: 1px solid var(--border-color);">
                <nav aria-label="Video pagination">
                    <div class="btn-group" role="group" aria-label="Pagination controls">
                        <button type="button" class="btn btn-outline-light btn-sm" title="Trang đầu">
                            <i class="fa-solid fa-angles-left"></i>
                        </button>
                        <button type="button" class="btn btn-outline-light btn-sm" title="Trang trước">
                            <i class="fa-solid fa-chevron-left"></i>
                        </button>
                        <button type="button" class="btn btn-outline-light btn-sm active" disabled>
                            Trang 1
                        </button>
                        <button type="button" class="btn btn-outline-light btn-sm" title="Trang sau">
                            <i class="fa-solid fa-chevron-right"></i>
                        </button>
                        <button type="button" class="btn btn-outline-light btn-sm" title="Trang cuối">
                            <i class="fa-solid fa-angles-right"></i>
                        </button>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>

<script>
    // Simple search function for table
    function searchTable(query) {
        const table = document.getElementById('videoTable');
        const rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
        const searchTerm = query.toLowerCase();
        
        for (let i = 0; i < rows.length; i++) {
            const row = rows[i];
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        }
    }

    // Preview image before upload
    document.querySelector('input[type="file"]').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function(event) {
                document.querySelector('.poster-preview img').src = event.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
</script>