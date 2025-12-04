package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Entity.User;
import java.io.IOException;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("========================================");
        System.out.println("AdminServlet DUOC GOI");
        System.out.println("========================================");


        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentUser") == null) {
            System.out.println("Chua dang nhap - Redirect ve login");
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }


        User user = (User) session.getAttribute("currentUser");
        System.out.println("User: " + user.getFullname());
        System.out.println("Is Admin: " + user.getAdmin());
        
        if (!user.getAdmin()) {
            System.out.println("Khong phai Admin - Redirect ve home");
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }
        String pathInfo = request.getPathInfo();
        System.out.println("PathInfo: " + pathInfo);

        if (pathInfo == null || pathInfo.equals("/") || pathInfo.equals("/home")) {
            System.out.println(">>> Redirect: /admin/reports");
            response.sendRedirect(request.getContextPath() + "/admin/reports");
            return; 
        } 
        else if (pathInfo.equals("/reports")) {
            System.out.println(">>> Forward: /admin-reports");
            request.getRequestDispatcher("/admin-reports").forward(request, response);
        } 
        else if (pathInfo.equals("/videos")) {
            request.getRequestDispatcher("/admin_views/videos.jsp").forward(request, response);
        } 
        else if (pathInfo.equals("/users")) {
            request.getRequestDispatcher("/admin_views/users.jsp").forward(request, response);
        }
        else {
            System.out.println(">>> 404 - Khong tim thay: " + pathInfo);
//            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}