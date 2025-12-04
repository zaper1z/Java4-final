package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.VideoDAO;
import Dao.VideoDAOImpl;
import Dao.FavoriteDAO;
import Dao.FavoriteDAOImpl;
import Entity.User;

import java.io.IOException;

@WebServlet("/admin/home")
public class AdminHomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        if (currentUser == null || !currentUser.getAdmin()) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        VideoDAO videoDAO = new VideoDAOImpl();
        FavoriteDAO favoriteDAO = new FavoriteDAOImpl();


        Long totalVideosLong = videoDAO.countAll();
        Long totalFavoritesLong = favoriteDAO.countAll();
        
        request.setAttribute("totalVideos", totalVideosLong.intValue());
        request.setAttribute("totalFavorites", totalFavoritesLong.intValue());

        request.getRequestDispatcher("/admin/home.jsp").forward(request, response);
    }
}