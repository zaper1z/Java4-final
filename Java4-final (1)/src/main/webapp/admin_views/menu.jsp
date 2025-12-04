<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
        background: #0a0e1a;
    }

    /* SIDEBAR STYLES */
    .admin-sidebar {
        position: fixed;
        left: 0;
        top: 0;
        width: 260px;
        height: 100vh;
        background: linear-gradient(180deg, #1a1f2e 0%, #0f1419 100%);
        border-right: 1px solid rgba(255,255,255,0.1);
        padding: 0;
        overflow-y: auto;
        z-index: 1000;
        box-shadow: 4px 0 20px rgba(0,0,0,0.3);
    }

    /* LOGO SECTION */
    .sidebar-header {
        padding: 2rem 1.5rem;
        border-bottom: 1px solid rgba(255,255,255,0.1);
        background: rgba(99,102,241,0.05);
    }

    .sidebar-logo {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        color: #f1f5f9;
        text-decoration: none;
    }

    .sidebar-logo i {
        font-size: 1.75rem;
        color: #6366f1;
    }

    .sidebar-logo-text {
        display: flex;
        flex-direction: column;
        line-height: 1.2;
    }

    .sidebar-logo-title {
        font-size: 1rem;
        font-weight: 700;
        letter-spacing: 0.5px;
        color: #f1f5f9;
    }

    .sidebar-logo-subtitle {
        font-size: 0.7rem;
        font-weight: 500;
        color: #94a3b8;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    /* MENU SECTION */
    .sidebar-menu {
        padding: 1.5rem 0;
    }

    .menu-section {
        margin-bottom: 1.5rem;
    }

    .menu-section-title {
        padding: 0.5rem 1.5rem;
        font-size: 0.7rem;
        font-weight: 700;
        color: #64748b;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .sidebar-menu ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .sidebar-menu li {
        margin: 0.25rem 0.75rem;
    }

    .sidebar-menu a {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.875rem 1rem;
        text-decoration: none;
        color: #94a3b8;
        border-radius: 10px;
        font-size: 0.95rem;
        font-weight: 500;
        transition: all 0.2s ease;
        position: relative;
    }

    .sidebar-menu a i {
        font-size: 1.1rem;
        width: 20px;
        text-align: center;
    }

    .sidebar-menu a:hover {
        background: rgba(99,102,241,0.15);
        color: #f1f5f9;
        transform: translateX(4px);
    }

    .sidebar-menu a.active {
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        color: white;
        box-shadow: 0 4px 15px rgba(99,102,241,0.4);
    }

    .sidebar-menu a.active i {
        color: white;
    }

    /* LOGOUT SECTION */
    .sidebar-footer {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 1.5rem;
        border-top: 1px solid rgba(255,255,255,0.1);
        background: rgba(0,0,0,0.2);
    }

    .sidebar-footer a {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        padding: 0.875rem 1rem;
        background: rgba(239,68,68,0.1);
        border: 1px solid rgba(239,68,68,0.3);
        border-radius: 10px;
        color: #ef4444;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.2s ease;
    }

    .sidebar-footer a:hover {
        background: #ef4444;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 15px rgba(239,68,68,0.4);
    }

    /* CONTENT AREA */
    .admin-content {
        margin-left: 260px;
        min-height: 100vh;
    }

    /* SCROLLBAR */
    .admin-sidebar::-webkit-scrollbar {
        width: 6px;
    }

    .admin-sidebar::-webkit-scrollbar-track {
        background: transparent;
    }

    .admin-sidebar::-webkit-scrollbar-thumb {
        background: rgba(99,102,241,0.3);
        border-radius: 3px;
    }

    .admin-sidebar::-webkit-scrollbar-thumb:hover {
        background: rgba(99,102,241,0.5);
    }

    /* RESPONSIVE */
    @media (max-width: 768px) {
        .admin-sidebar {
            width: 70px;
        }

        .sidebar-logo-text,
        .menu-section-title,
        .sidebar-menu a span {
            display: none;
        }

        .sidebar-header {
            padding: 1.5rem 0.5rem;
        }

        .sidebar-logo {
            justify-content: center;
        }

        .sidebar-menu li {
            margin: 0.25rem 0.5rem;
        }

        .sidebar-menu a {
            justify-content: center;
            padding: 0.875rem;
        }

        .admin-content {
            margin-left: 70px;
        }
    }
</style>

<div class="admin-sidebar">
    <div class="sidebar-header">
        <a href="${pageContext.request.contextPath}/admin/home" class="sidebar-logo">
            <i class="fa-solid fa-shield-halved"></i>
            <div class="sidebar-logo-text">
                <span class="sidebar-logo-title">Admin Panel</span>
                <span class="sidebar-logo-subtitle">Management</span>
            </div>
        </a>
    </div>

    <nav class="sidebar-menu">
        <div class="menu-section">
            <div class="menu-section-title">Main Menu</div>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/home" 
                       class="${fn:contains(pageContext.request.requestURI, '/admin/home') ? 'active' : ''}">
                        <i class="fa-solid fa-house"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/videos" 
                       class="${fn:contains(pageContext.request.requestURI, '/admin/videos') ? 'active' : ''}">
                        <i class="fa-solid fa-film"></i>
                        <span>Videos</span>
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/users" 
                       class="${fn:contains(pageContext.request.requestURI, '/admin/users') ? 'active' : ''}">
                        <i class="fa-solid fa-users"></i>
                        <span>Users</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="menu-section">
            <div class="menu-section-title">Analytics</div>
            <ul>
                <li>
                    <a href="${pageContext.request.contextPath}/admin/reports" 
                       class="${fn:contains(pageContext.request.requestURI, '/admin/reports') ? 'active' : ''}">
                        <i class="fa-solid fa-chart-line"></i>
                        <span>Reports</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="sidebar-footer">
        <a href="${pageContext.request.contextPath}/logoff">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Đăng Xuất</span>
        </a>
    </div>
</div>