package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDAO;
import Dao.UserDAOImpl;
import Entity.User;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("id");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        try {
            UserDAO userDAO = new UserDAOImpl();

            // Kiểm tra username đã tồn tại chưa
            if (userDAO.findById(username) != null) {
                request.setAttribute("error", "Username đã tồn tại!");
                request.getRequestDispatcher("/views/register.jsp").forward(request, response);
                return;
            }

            // Tạo user mới
            User newUser = new User();
            newUser.setId(username);
            newUser.setPassword(password);
            newUser.setFullname(fullname);
            newUser.setEmail(email);
            newUser.setAdmin(false);

            userDAO.create(newUser);

            request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        }
    }
}