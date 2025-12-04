package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import Dao.UserDAO;
import Dao.UserDAOImpl;
import Entity.User;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("========================================");
        System.out.println("LoginServlet doGet() được gọi");
        System.out.println("========================================");
        
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("========================================");
        System.out.println("LoginServlet doPost() được gọi");
        System.out.println("========================================");
        
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("id");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");

        System.out.println("Username: [" + username + "]");
        System.out.println("Password: [" + password + "]");
        System.out.println("Remember: " + remember);

        if (username == null || username.trim().isEmpty()) {
            System.out.println(" Username rỗng!");
            request.setAttribute("message", "Vui lòng nhập tên đăng nhập!");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            System.out.println(" Password rỗng!");
            request.setAttribute("message", "Vui lòng nhập mật khẩu!");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        try {
            UserDAO userDAO = new UserDAOImpl();
            System.out.println("🔍 Đang tìm user với ID: " + username);
            
            User user = userDAO.findById(username);

            System.out.println("👤 User tìm thấy: " + (user != null ? user.getFullname() : "NULL"));

            if (user != null) {
                System.out.println("Password trong DB: [" + user.getPassword() + "]");
                System.out.println("Password nhập vào: [" + password + "]");
                System.out.println("So sánh: " + user.getPassword().equals(password));
            }

            if (user != null && user.getPassword().equals(password)) {
                System.out.println("ĐĂNG NHẬP THÀNH CÔNG!");
                
                // Lưu vào session
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", user);
                
                System.out.println(" Đã lưu user vào session");
                System.out.println(" Session currentUser: " + session.getAttribute("currentUser"));
                System.out.println(" User là Admin: " + user.getAdmin());

                // Xử lý Remember Me
                if (remember != null) {
                    Cookie userCookie = new Cookie("username", username);
                    Cookie passCookie = new Cookie("password", password);
                    userCookie.setMaxAge(60 * 60 * 24 * 7);
                    passCookie.setMaxAge(60 * 60 * 24 * 7);
                    response.addCookie(userCookie);
                    response.addCookie(passCookie);
                    System.out.println("Đã lưu cookie Remember Me");
                }

                // Chuyển hướng
                String redirectUrl;
                if (user.getAdmin()) {
                    redirectUrl = request.getContextPath() + "/admin/reports";
                    System.out.println("Redirect đến ADMIN: " + redirectUrl);
                } else {
                    redirectUrl = request.getContextPath() + "/index";
                    System.out.println("Redirect đến INDEX: " + redirectUrl);
                }
                
                response.sendRedirect(redirectUrl);
                System.out.println("Đã gọi sendRedirect()");
                
            } else {
                System.out.println("ĐĂNG NHẬP THẤT BẠI!");
                request.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu!");
                request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            System.out.println("LỖI: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("message", "Lỗi hệ thống: " + e.getMessage());
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
        
        System.out.println("========================================");
    }
}