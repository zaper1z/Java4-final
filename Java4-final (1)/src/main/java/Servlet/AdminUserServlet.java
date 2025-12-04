package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDAO;
import Dao.UserDAOImpl;
import Entity.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Kiểm tra đăng nhập và quyền admin
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null || !currentUser.getAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // TODO: Tạo phương thức findAll() trong UserDAO
        // List<User> users = userDAO.findAll();
        // request.setAttribute("users", users);

        request.getRequestDispatcher("/admin/users.jsp").forward(request, response);
    }
}